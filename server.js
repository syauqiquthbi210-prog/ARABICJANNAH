const express = require('express');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const cors = require('cors');
const path = require('path');
const http = require('http');
const { Server } = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: '*' } });
const PORT = 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Sajikan file statis
app.use(express.static(path.join(__dirname, 'public')));

// Konfigurasi Database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '12345',
    database: 'db_fasih_ma'
});

db.connect((err) => {
    if (err) {
        console.error('Koneksi Database Gagal!', err);
        return;
    }
    console.log('Berhasil terhubung ke database MySQL (db_fasih_ma)!');
});

// ==========================================
// TRACK USER ONLINE via Socket.io
// ==========================================
const onlineUsers = {}; // { userId: socketId }

io.on('connection', (socket) => {
    console.log('Socket terhubung:', socket.id);

    // Saat user login, mereka kirim user_id mereka
    socket.on('user_online', (userId) => {
        onlineUsers[userId] = socket.id;
        console.log(`User ${userId} online dengan socket ${socket.id}`);
    });

    // Real-time chat
    socket.on('kirim_pesan', (data) => {
        const { pengirim_id, penerima_id, isi_pesan } = data;
        const query = 'INSERT INTO pesan_chat (pengirim_id, penerima_id, isi_pesan) VALUES (?, ?, ?)';
        db.query(query, [pengirim_id, penerima_id, isi_pesan], (err, result) => {
            if (err) return console.error('Gagal simpan pesan:', err);
            const payload = { ...data, id: result.insertId, waktu_kirim: new Date() };
            // Kirim ke pengirim
            if (onlineUsers[pengirim_id]) {
                io.to(onlineUsers[pengirim_id]).emit('pesan_baru', payload);
            }
            // Kirim ke penerima
            if (onlineUsers[penerima_id]) {
                io.to(onlineUsers[penerima_id]).emit('pesan_baru', payload);
            }
        });
    });

    // Pemicu untuk beritahu lawan bicara bahwa chat dikosongkan (Real-time sync)
    socket.on('hapus_chat', (data) => {
        const { peminta_id, partner_id } = data;
        if (onlineUsers[partner_id]) {
            io.to(onlineUsers[partner_id]).emit('chat_dihapus', { partner_id: peminta_id });
        }
    });

    socket.on('disconnect', () => {
        // Hapus dari daftar online
        for (const uid in onlineUsers) {
            if (onlineUsers[uid] === socket.id) {
                delete onlineUsers[uid];
                console.log(`User ${uid} offline`);
                break;
            }
        }
    });
});

// ==========================================
// API ENDPOINTS
// ==========================================

// Whitelist email VIP
const VIP_EMAILS = ['syauqiquthbi210@gmail.com', 'nikmatulkhumairoh268@gmail.com'];

// 1. Pendaftaran
app.post('/api/register', async (req, res) => {
    console.log("==> Ada permintaan daftar masuk!");
    console.log("Isi data dari browser:", req.body);

    const { nama_lengkap, password, kelas, target_menit } = req.body;
    const email = req.body.email ? req.body.email.trim().toLowerCase() : "";

    // Auto-assign role VIP jika email ada di whitelist
    const role = VIP_EMAILS.includes(email) ? 'vip' : 'siswa';

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const querySQL = "INSERT INTO pengguna (nama_lengkap, email, password, kelas, target_menit, role) VALUES (?, ?, ?, ?, ?, ?)";

        db.query(querySQL, [nama_lengkap, email, hashedPassword, kelas, target_menit, role], (err, hasil) => {
            if (err) {
                console.error("Gagal menyimpan data ke MySQL:", err);
                return res.status(500).json({ success: false, message: "Gagal mendaftar. Email mungkin sudah dipakai." });
            }
            console.log("Pendaftaran Berhasil di Simpan!");
            res.json({ 
                success: true, 
                message: "Alhamdulillah, pendaftaran berhasil!",
                user: { id: hasil.insertId, nama_lengkap, email, kelas, role }
            });
        });
    } catch (error) {
        console.error("Error di server:", error);
        res.status(500).json({ success: false, message: "Terjadi kesalahan pada server." });
    }
});

// 2. Login
app.post('/api/login', (req, res) => {
    const email = req.body.email ? req.body.email.trim().toLowerCase() : "";
    const password = req.body.password;
    console.log("Mencoba Login:", email);

    db.query('SELECT * FROM pengguna WHERE email = ?', [email], async (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        if (results.length === 0) return res.status(401).json({ success: false, message: 'Email tidak ditemukan' });

        const user = results[0];
        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) return res.status(401).json({ success: false, message: 'Password salah' });

        res.json({
            success: true,
            message: 'Berhasil login!',
            user: { id: user.id, nama_lengkap: user.nama_lengkap, email: user.email, kelas: user.kelas, level_aktif: user.level_aktif || 1, poin_belajar: user.poin_belajar || 0, role: user.role || 'siswa' }
        });
    });
});

// 2.1 Ambil data user berdasar EMAIL (untuk pemulihan sesi jika ID hilang)
app.get('/api/user/email/:email', (req, res) => {
    const email = req.params.email ? req.params.email.trim().toLowerCase() : "";
    db.query('SELECT id, nama_lengkap, email, kelas FROM pengguna WHERE email = ?', [email], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        if (results.length === 0) return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        res.json({ success: true, user: results[0] });
    });
});

// 3. Ambil Semua Pengguna (kecuali diri sendiri) + status pertemanan
app.get('/api/pengguna/:id', (req, res) => {
    const currentUserId = req.params.id;
    const query = `
        SELECT p.id, p.nama_lengkap, p.kelas,
            (SELECT status FROM pertemanan WHERE pengikut_id = ? AND diikuti_id = p.id LIMIT 1) as i_follow,
            (SELECT status FROM pertemanan WHERE pengikut_id = p.id AND diikuti_id = ? LIMIT 1) as they_follow
        FROM pengguna p
        WHERE p.id != ? AND p.email IS NOT NULL
    `;
    db.query(query, [currentUserId, currentUserId, currentUserId], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        
        // Olah hasil untuk menentukan status_mutual tunggal buat frontend
        const refinedResults = results.map(p => {
            let status = 'belum';
            if (p.i_follow === 'mutual' || (p.i_follow === 'menunggu' && p.they_follow === 'menunggu')) {
                status = 'mutual';
            } else if (p.i_follow === 'menunggu') {
                status = 'menunggu';
            } else if (p.they_follow === 'menunggu') {
                status = 'follback';
            } else if (p.i_follow === 'mutual' || p.they_follow === 'mutual') {
                // Handling jika salah satu sudah ditandai mutual tapi yang lain belum (sinkronisasi)
                status = 'mutual';
            }
            
            return {
                id: p.id,
                nama_lengkap: p.nama_lengkap,
                kelas: p.kelas,
                status_mutual: status,
                sudah_follow_dia: p.i_follow ? 1 : 0
            };
        });

        res.json({ success: true, pengguna: refinedResults });
    });
});

// 4. FOLLOW seseorang
app.post('/api/follow', (req, res) => {
    const { pengikut_id, diikuti_id } = req.body;
    console.log(`User ${pengikut_id} mengikuti ${diikuti_id}`);

    // Cek apakah sudah follow sebelumnya
    db.query(
        'SELECT id FROM pertemanan WHERE pengikut_id = ? AND diikuti_id = ?',
        [pengikut_id, diikuti_id],
        (err, existing) => {
            if (err) return res.status(500).json({ success: false, message: 'Database error' });
            if (existing.length > 0) {
                return res.json({ success: true, status: 'sudah_follow', message: 'Sudah mengikuti' });
            }

            // Cek apakah orang yang di-follow sudah follow balik (akan jadi mutual)
            db.query(
                'SELECT id FROM pertemanan WHERE pengikut_id = ? AND diikuti_id = ?',
                [diikuti_id, pengikut_id],
                (err2, reverse) => {
                    if (err2) return res.status(500).json({ success: false, message: 'Database error' });

                    if (reverse.length > 0) {
                        // Keduanya saling follow → ubah keduanya jadi MUTUAL
                        db.query(
                            'UPDATE pertemanan SET status = "mutual" WHERE pengikut_id = ? AND diikuti_id = ?',
                            [diikuti_id, pengikut_id],
                            (err3) => {
                                if (err3) return res.status(500).json({ success: false, message: 'Database error' });

                                // Simpan record baru juga sebagai mutual
                                db.query(
                                    'INSERT INTO pertemanan (pengikut_id, diikuti_id, status) VALUES (?, ?, "mutual")',
                                    [pengikut_id, diikuti_id],
                                    (err4) => {
                                        if (err4) return res.status(500).json({ success: false, message: 'Database error' });

                                        // Tandai notifikasi follow lama dari diikuti_id → pengikut_id sudah dibaca
                                        db.query(
                                            'UPDATE notifikasi SET sudah_dibaca = 1 WHERE pengirim_id = ? AND penerima_id = ? AND tipe = "follow_request"',
                                            [diikuti_id, pengikut_id],
                                            () => {}
                                        );

                                        // Emit ke keduanya bahwa mereka sudah mutual
                                        const mutualPayload = { pengikut_id, diikuti_id, status: 'mutual' };
                                        if (onlineUsers[pengikut_id]) io.to(onlineUsers[pengikut_id]).emit('status_mutual', mutualPayload);
                                        if (onlineUsers[diikuti_id]) io.to(onlineUsers[diikuti_id]).emit('status_mutual', mutualPayload);

                                        console.log(`MUTUAL antara ${pengikut_id} dan ${diikuti_id}`);
                                        res.json({ success: true, status: 'mutual', message: 'Kalian sekarang saling mengikuti!' });
                                    }
                                );
                            }
                        );
                    } else {
                        // Follow biasa → status menunggu
                        db.query(
                            'INSERT INTO pertemanan (pengikut_id, diikuti_id, status) VALUES (?, ?, "menunggu")',
                            [pengikut_id, diikuti_id],
                            (err3) => {
                                if (err3) return res.status(500).json({ success: false, message: 'Database error' });

                                // Simpan notifikasi untuk penerima
                                db.query(
                                    'INSERT INTO notifikasi (penerima_id, pengirim_id, tipe) VALUES (?, ?, "follow_request")',
                                    [diikuti_id, pengikut_id],
                                    (err4) => {
                                        if (err4) console.error('Gagal simpan notifikasi:', err4);
                                    }
                                );

                                // Ambil data pengirim untuk dikirim lewat socket
                                db.query(
                                    'SELECT nama_lengkap FROM pengguna WHERE id = ?',
                                    [pengikut_id],
                                    (err5, userRows) => {
                                        const namaPengirim = userRows && userRows[0] ? userRows[0].nama_lengkap : 'Seseorang';

                                        // Emit notifikasi real-time ke penerima
                                        const notifPayload = {
                                            pengikut_id: parseInt(pengikut_id),
                                            diikuti_id: parseInt(diikuti_id),
                                            nama_pengirim: namaPengirim,
                                            tipe: 'follow_request'
                                        };
                                        if (onlineUsers[diikuti_id]) {
                                            io.to(onlineUsers[diikuti_id]).emit('notif_follow', notifPayload);
                                        }

                                        console.log(`Follow request dari ${pengikut_id} ke ${diikuti_id}`);
                                        res.json({ success: true, status: 'menunggu', message: 'Permintaan follow terkirim!' });
                                    }
                                );
                            }
                        );
                    }
                }
            );
        }
    );
});

// 5. Ambil Notifikasi belum dibaca milik user
app.get('/api/notifikasi/:id', (req, res) => {
    const userId = req.params.id;
    const query = `
        SELECT n.id, n.tipe, n.sudah_dibaca, n.created_at,
               p.nama_lengkap as nama_pengirim, p.id as pengirim_id, p.kelas
        FROM notifikasi n
        JOIN pengguna p ON p.id = n.pengirim_id
        WHERE n.penerima_id = ? AND n.sudah_dibaca = 0
        ORDER BY n.created_at DESC
    `;
    db.query(query, [userId], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true, notifikasi: results });
    });
});

// 6. Tandai notifikasi sudah dibaca
app.post('/api/notifikasi/baca/:id', (req, res) => {
    const notifId = req.params.id;
    db.query('UPDATE notifikasi SET sudah_dibaca = 1 WHERE id = ?', [notifId], (err) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true });
    });
});

// 7. Riwayat obrolan antara 2 user
app.get('/api/pesan/:pengirim/:penerima', (req, res) => {
    const { pengirim, penerima } = req.params;
    const query = `
        SELECT id, pengirim_id, penerima_id, isi_pesan, waktu_kirim
        FROM pesan_chat
        WHERE (pengirim_id = ? AND penerima_id = ?)
           OR (pengirim_id = ? AND penerima_id = ?)
        ORDER BY waktu_kirim ASC
        LIMIT 100
    `;
    db.query(query, [pengirim, penerima, penerima, pengirim], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true, pesan: results });
    });
});

// 8. Hapus riwayat obrolan (Clear Chat)
app.delete('/api/pesan/:u1/:u2', (req, res) => {
    const { u1, u2 } = req.params;
    const query = 'DELETE FROM pesan_chat WHERE (pengirim_id = ? AND penerima_id = ?) OR (pengirim_id = ? AND penerima_id = ?)';
    db.query(query, [u1, u2, u1, u2], (err) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true, message: 'Chat berhasil dihapus' });
    });
});

// ==========================================
// API MODUL PEMBELAJARAN
// ==========================================

// A. Ambil Flashcard Mufrodat
app.get('/api/pembelajaran/mufrodat/:level', (req, res) => {
    const levelId = req.params.level;
    db.query('SELECT * FROM flashcard_mufrodat WHERE level_id = ?', [levelId], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true, data: results });
    });
});

// B. Ambil Hiwar Chat
app.get('/api/pembelajaran/hiwar/:level', (req, res) => {
    const levelId = req.params.level;
    db.query('SELECT * FROM hiwar_chat WHERE level_id = ? ORDER BY urutan ASC', [levelId], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true, data: results });
    });
});

// C. Ambil Soal Ujian
app.get('/api/pembelajaran/ujian/:level', (req, res) => {
    const levelId = req.params.level;
    db.query('SELECT * FROM ujian_soal WHERE level_id = ?', [levelId], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        res.json({ success: true, data: results });
    });
});

// D. Ambil data user terbaru (untuk refresh dashboard)
app.get('/api/user/:id', (req, res) => {
    const userId = req.params.id;
    db.query('SELECT id, nama_lengkap, email, kelas, level_aktif, poin_belajar, role FROM pengguna WHERE id = ?', [userId], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: 'Database error' });
        if (results.length === 0) return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        res.json({ success: true, user: results[0] });
    });
});

// E. Simpan Kelulusan Level (Naik Level)
app.post('/api/pembelajaran/lulus/:level', (req, res) => {
    const { userId } = req.body;
    const levelId = parseInt(req.params.level);
    const nextLevel = levelId + 1;

    console.log(`[LULUS] User ${userId} menyelesaikan level ${levelId}, naik ke level ${nextLevel}`);

    if (!userId) {
        return res.status(400).json({ success: false, message: 'userId diperlukan' });
    }

    // Update level_aktif (pakai GREATEST agar tidak mundur) dan tambah poin
    db.query('UPDATE pengguna SET level_aktif = GREATEST(level_aktif, ?), poin_belajar = poin_belajar + 10 WHERE id = ?', 
    [nextLevel, userId], (err, result) => {
        if (err) {
            console.error('[LULUS] Database error saat update:', err);
            return res.status(500).json({ success: false, message: 'Database error saat menyimpan kelulusan' });
        }
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        }

        // Ambil data user terbaru untuk dikembalikan ke frontend
        db.query('SELECT id, nama_lengkap, email, kelas, level_aktif, poin_belajar FROM pengguna WHERE id = ?', [userId], (err2, user) => {
            if (err2) {
                console.error('[LULUS] Database error saat ambil user:', err2);
                return res.status(500).json({ success: false, message: 'Database error' });
            }
            console.log('[LULUS] Sukses! Data user baru:', user[0]);
            res.json({ success: true, message: 'Level Selesai!', user: user[0] });
        });
    });
});

// ==========================================
// API PAPAN PERINGKAT (LEADERBOARD)
// ==========================================

// F. Ambil Top 10 Leaderboard
app.get('/api/leaderboard', (req, res) => {
    const query = `
        SELECT id, nama_lengkap, kelas, level_aktif, poin_belajar
        FROM pengguna
        ORDER BY poin_belajar DESC
        LIMIT 10
    `;
    db.query(query, (err, results) => {
        if (err) {
            console.error('[LEADERBOARD] Database error:', err);
            return res.status(500).json({ success: false, message: 'Database error' });
        }
        res.json({ success: true, leaderboard: results });
    });
});

// G. Ambil Ranking User Tertentu
app.get('/api/leaderboard/rank/:userId', (req, res) => {
    const userId = req.params.userId;
    const query = `
        SELECT 
            (SELECT COUNT(*) + 1 FROM pengguna WHERE poin_belajar > (SELECT COALESCE(poin_belajar, 0) FROM pengguna WHERE id = ?)) AS ranking,
            poin_belajar
        FROM pengguna
        WHERE id = ?
    `;
    db.query(query, [userId, userId], (err, results) => {
        if (err) {
            console.error('[LEADERBOARD RANK] Database error:', err);
            return res.status(500).json({ success: false, message: 'Database error' });
        }
        if (results.length === 0) {
            return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        }
        res.json({ success: true, ranking: results[0].ranking, poin_belajar: results[0].poin_belajar });
    });
});

// Jalankan Server
server.listen(PORT, () => {
    console.log(`Server Fasih MA berjalan di http://localhost:${PORT}`);
});
require('dotenv').config(); //
const express = require('express');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const cors = require('cors');
const path = require('path');
const http = require('http');
const { Server } = require('socket.io');

const app = express();
const server = http.createServer(app);

// MODE DARURAT: Mengizinkan akses dari mana saja agar web segera bisa dipakai
const io = new Server(server, { 
    cors: { origin: "*" } 
});

// Railway akan memberikan PORT secara otomatis lewat environment variable
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors({ origin: "*" })); // Mengizinkan semua domain untuk sementara
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Sajikan file statis (opsional jika kamu hanya pakai untuk API)
app.use(express.static(path.join(__dirname, 'public')));

// Konfigurasi Database Menggunakan Environment Variables Railway
const db = mysql.createConnection({
    host: process.env.MYSQLHOST,
    user: process.env.MYSQLUSER,
    password: process.env.MYSQLPASSWORD,
    database: process.env.MYSQLDATABASE,
    port: process.env.MYSQLPORT || 3306
});

db.connect((err) => {
    if (err) {
        console.error('Koneksi Database Railway Gagal!', err);
        return;
    }
    console.log(`Berhasil terhubung ke database MySQL Railway!`);
});

// ==========================================
// TRACK USER ONLINE via Socket.io
// ==========================================
const onlineUsers = {};

io.on('connection', (socket) => {
    console.log('Socket terhubung:', socket.id);

    socket.on('user_online', (userId) => {
        onlineUsers[userId] = socket.id;
        console.log(`User ${userId} online`);
    });

    socket.on('kirim_pesan', (data) => {
        const { pengirim_id, penerima_id, isi_pesan } = data;
        const query = 'INSERT INTO pesan_chat (pengirim_id, penerima_id, isi_pesan) VALUES (?, ?, ?)';
        db.query(query, [pengirim_id, penerima_id, isi_pesan], (err, result) => {
            if (err) return console.error('Gagal simpan pesan:', err);
            const payload = { ...data, id: result.insertId, waktu_kirim: new Date() };
            if (onlineUsers[pengirim_id]) io.to(onlineUsers[pengirim_id]).emit('pesan_baru', payload);
            if (onlineUsers[penerima_id]) io.to(onlineUsers[penerima_id]).emit('pesan_baru', payload);
        });
    });

    socket.on('hapus_chat', (data) => {
        const { peminta_id, partner_id } = data;
        if (onlineUsers[partner_id]) {
            io.to(onlineUsers[partner_id]).emit('chat_dihapus', { partner_id: peminta_id });
        }
    });

    socket.on('disconnect', () => {
        for (const uid in onlineUsers) {
            if (onlineUsers[uid] === socket.id) {
                delete onlineUsers[uid];
                break;
            }
        }
    });
});

// ==========================================
// API ENDPOINTS (Tetap Sama Seperti Versi Kamu)
// ==========================================

const VIP_EMAILS = ['syauqiquthbi210@gmail.com', 'nikmatulkhumairoh268@gmail.com'];

app.post('/api/register', async (req, res) => {
    const { nama_lengkap, password, kelas, target_menit } = req.body;
    const email = req.body.email ? req.body.email.trim().toLowerCase() : "";
    const role = VIP_EMAILS.includes(email) ? 'vip' : 'siswa';

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const querySQL = "INSERT INTO pengguna (nama_lengkap, email, password, kelas, target_menit, role) VALUES (?, ?, ?, ?, ?, ?)";
        db.query(querySQL, [nama_lengkap, email, hashedPassword, kelas, target_menit, role], (err, hasil) => {
            if (err) return res.status(500).json({ success: false, message: "Gagal mendaftar." });
            res.json({ success: true, user: { id: hasil.insertId, nama_lengkap, email, kelas, role } });
        });
    } catch (error) {
        res.status(500).json({ success: false, message: "Error server." });
    }
});

app.post('/api/login', (req, res) => {
    const email = req.body.email ? req.body.email.trim().toLowerCase() : "";
    const password = req.body.password;
    db.query('SELECT * FROM pengguna WHERE email = ?', [email], async (err, results) => {
        if (err || results.length === 0) return res.status(401).json({ success: false, message: 'User tidak ditemukan' });
        const user = results[0];
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(401).json({ success: false, message: 'Password salah' });
        res.json({ success: true, user: { id: user.id, nama_lengkap: user.nama_lengkap, email: user.email, kelas: user.kelas, role: user.role } });
    });
});

app.get('/api/pembelajaran/mufrodat/:level', (req, res) => {
    db.query('SELECT * FROM flashcard_mufrodat WHERE level_id = ?', [req.params.level], (err, results) => {
        if (err) return res.status(500).json({ success: false });
        res.json({ success: true, data: results });
    });
});

app.get('/api/pembelajaran/hiwar/:level', (req, res) => {
    db.query('SELECT * FROM hiwar_chat WHERE level_id = ? ORDER BY urutan ASC', [req.params.level], (err, results) => {
        if (err) return res.status(500).json({ success: false });
        res.json({ success: true, data: results });
    });
});

app.get('/api/pembelajaran/ujian/:level', (req, res) => {
    db.query('SELECT * FROM ujian_soal WHERE level_id = ?', [req.params.level], (err, results) => {
        if (err) return res.status(500).json({ success: false });
        res.json({ success: true, data: results });
    });
});

app.get('/api/leaderboard', (req, res) => {
    db.query('SELECT nama_lengkap, poin_belajar FROM pengguna ORDER BY poin_belajar DESC LIMIT 10', (err, results) => {
        if (err) return res.status(500).json({ success: false });
        res.json({ success: true, leaderboard: results });
    });
});

// Jalankan Server
server.listen(PORT, () => {
    console.log(`Server Fasih MA berjalan di port ${PORT}`);
});

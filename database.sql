-- Jalankan script ini di PHPMyAdmin untuk membuat struktur database

CREATE DATABASE IF NOT EXISTS db_fasih_ma;
USE db_fasih_ma;

CREATE TABLE IF NOT EXISTS pengguna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_lengkap VARCHAR(255) NOT NULL,
    kelas ENUM('X', 'XI', 'XII') NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    target_menit INT DEFAULT 20,
    level_aktif INT DEFAULT 1,
    poin_belajar INT DEFAULT 0,
    role VARCHAR(20) DEFAULT 'siswa',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Koneksi (Sosial Follow)
CREATE TABLE IF NOT EXISTS pertemanan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pengikut_id INT NOT NULL,
    diikuti_id INT NOT NULL,
    status ENUM('menunggu', 'mutual') DEFAULT 'menunggu',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pengikut_id) REFERENCES pengguna(id) ON DELETE CASCADE,
    FOREIGN KEY (diikuti_id) REFERENCES pengguna(id) ON DELETE CASCADE
);

-- Tabel Riwayat Obrolan Bahasa Arab
CREATE TABLE IF NOT EXISTS pesan_chat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pengirim_id INT NOT NULL,
    penerima_id INT NOT NULL,
    isi_pesan TEXT NOT NULL,
    waktu_kirim TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pengirim_id) REFERENCES pengguna(id) ON DELETE CASCADE,
    FOREIGN KEY (penerima_id) REFERENCES pengguna(id) ON DELETE CASCADE
);

-- ==========================================
-- TABEL MODUL PEMBELAJARAN
-- ==========================================

CREATE TABLE IF NOT EXISTS materi_level (
    id INT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    deskripsi TEXT
);

CREATE TABLE IF NOT EXISTS flashcard_mufrodat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level_id INT NOT NULL,
    arab VARCHAR(255) NOT NULL,
    latin VARCHAR(255) NOT NULL,
    arti VARCHAR(255) NOT NULL,
    FOREIGN KEY (level_id) REFERENCES materi_level(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS hiwar_chat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level_id INT NOT NULL,
    urutan INT NOT NULL,
    karakter ENUM('A', 'B') NOT NULL,
    arab TEXT NOT NULL,
    latin TEXT NOT NULL,
    arti TEXT NOT NULL,
    FOREIGN KEY (level_id) REFERENCES materi_level(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ujian_soal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level_id INT NOT NULL,
    tipe_soal ENUM('pilihan_ganda', 'isian') NOT NULL,
    pertanyaan TEXT NOT NULL,
    opsi_a VARCHAR(255),
    opsi_b VARCHAR(255),
    opsi_c VARCHAR(255),
    opsi_d VARCHAR(255),
    jawaban_benar VARCHAR(255) NOT NULL,
    FOREIGN KEY (level_id) REFERENCES materi_level(id) ON DELETE CASCADE
);

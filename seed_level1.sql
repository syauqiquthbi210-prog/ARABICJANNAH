-- Terapkan Tabel Baru
USE db_fasih_ma;

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

-- ==========================================
-- DATA SEEDING: LEVEL 1 (Perkenalan)
-- ==========================================
-- 1. Insert ke materi_level
INSERT IGNORE INTO materi_level (id, judul, deskripsi) VALUES 
(1, 'التَّعَارُف - At-Ta\'aruf (Perkenalan)', 'Mempelajari cara menyapa, menanyakan kabar, dan memperkenalkan diri.');

-- Bersihkan data lama jika ada (mencegah duplikat saat testing berulang)
DELETE FROM flashcard_mufrodat WHERE level_id = 1;
DELETE FROM hiwar_chat WHERE level_id = 1;
DELETE FROM ujian_soal WHERE level_id = 1;

-- 2. Insert ke flashcard_mufrodat
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(1, 'طَالِبٌ', 'Thoolibun', 'Siswa / Pelajar (L)'),
(1, 'مُدَرِّسٌ', 'Mudarrisun', 'Guru (L)'),
(1, 'اِسْمِي ...', 'Ismii ...', 'Namaku ...'),
(1, 'مِنْ أَيْنَ ؟', 'Min ayna?', 'Dari mana?'),
(1, 'بِخَيْرٍ', 'Bikhairin', 'Baik / Alhamdulillah Baik');

-- 3. Insert ke hiwar_chat (Dialog Ahmad dan Ali)
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(1, 1, 'A', 'السَّلَامُ عَلَيْكُمْ', 'Assalamu\'alaikum', 'Semoga keselamatan menyertaimu'),
(1, 2, 'B', 'وَعَلَيْكُمُ السَّلَامُ. أَهْلًا وَسَهْلًا', 'Wa\'alaikumussalam. Ahlan wa sahlan!', 'Dan semoga keselamatan bagimu juga. Selamat datang!'),
(1, 3, 'A', 'كَيْفَ حَالُكَ ؟', 'Kaifa haluka?', 'Bagaimana kabarmu?'),
(1, 4, 'B', 'بِخَيْرٍ، وَالْحَمْدُ للهِ. مَسْمُكَ ؟', 'Bikhairin, walhamdulillah. Masmuka?', 'Alhamdulillah baik. Siapa namamu?'),
(1, 5, 'A', 'اِسْمِي أَحْمَد. وَأَنْتَ ؟', 'Ismii Ahmad. Wa anta?', 'Namaku Ahmad. Dan kamu?'),
(1, 6, 'B', 'اِسْمِي عَلِيّ. مِنْ أَيْنَ أَنْتَ ياَ أَحْمَد ؟', 'Ismii \'Aliy. Min ayna anta ya Ahmad?', 'Namaku Ali. Dari mana kamu berasal wahai Ahmad?'),
(1, 7, 'A', 'أَنَا مِنْ بَانْدُونْج. وَأَنْتَ ؟', 'Ana min Baanduunj. Wa anta?', 'Aku dari Bandung. Dan kamu?'),
(1, 8, 'B', 'أَنَا مِنْ جَاكَرْتَا. سُرِرْتُ بِمَعْرِفَتِكَ', 'Ana min Jaakartaa. Surirtu bima\'rifatika.', 'Aku dari Jakarta. Senang berkenalan denganmu.');

-- 4. Insert ke ujian_soal (Boss Fight Level 1)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(1, 'pilihan_ganda', 'Bagaimana cara bertanya "Bagaimana kabarmu?" kepada guru laki-laki?', 'Min ayna anta?', 'Kaifa haluka?', 'Masmuka?', 'Ahlan wa sahlan', 'b'),
(1, 'pilihan_ganda', 'Kata "مُدَرِّسٌ" (Mudarrisun) artinya adalah...', 'Siswa', 'Kepala Sekolah', 'Guru', 'Kelas', 'c'),
(1, 'pilihan_ganda', 'Jika seseorang berkata "أَهْلًا وَسَهْلًا", maka balasan yang tepat adalah...', 'Bikhairin', 'Wa \'alaikumussalam', 'Ahlan bika', 'Syukran', 'c'),
(1, 'pilihan_ganda', 'Apa bahasa Arabnya "Namaku Ahmad"?', 'Ana Ahmad', 'Ismii Ahmad', 'Anta Ahmad', 'Hadza Ahmad', 'b');

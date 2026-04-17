-- =====================================================
-- FASIH MA - DATA LENGKAP KURIKULUM LEVEL 1 SAMPAI 8
-- Setiap level: 20 Mufrodat, 10 Hiwar, 20 Soal Ujian
-- =====================================================
USE db_fasih_ma;

-- Bersihkan semua data lama
DELETE FROM ujian_soal;
DELETE FROM hiwar_chat;
DELETE FROM flashcard_mufrodat;
DELETE FROM materi_level;

-- =====================================================
-- MATERI LEVEL (Master Data) - 8 LEVEL
-- =====================================================
INSERT INTO materi_level (id, judul, deskripsi) VALUES
(1, 'التَّعَارُف - At-Ta''aruf (Perkenalan)', 'Mempelajari cara menyapa, menanyakan kabar, dan memperkenalkan diri.'),
(2, 'الْحَيَاةُ الْمَدْرَسِيَّة - Al-Hayah Al-Madrasiyyah (Kehidupan Sekolah)', 'Mengenal lingkungan madrasah, peralatan kelas, dan jadwal pelajaran.'),
(3, 'الْأُسْرَةُ وَالْبَيْت - Al-Usrah wal Bait (Keluarga dan Rumah)', 'Mendeskripsikan anggota keluarga dan aktivitas harian di dalam rumah.'),
(4, 'الْهِوَايَةُ وَوَقْتُ الْفَرَاغ - Al-Hiwayah wa Waqtul Faragh (Hobi dan Waktu Luang)', 'Mengekspresikan kegemaran, olahraga, dan rencana akhir pekan.'),
(5, 'الطَّعَامُ وَالشَّرَاب - Ath-Tha''aam wash-Syaraab (Makanan dan Minuman)', 'Mempelajari kosakata makanan, minuman, dan percakapan di restoran.'),
(6, 'السُّوقُ وَالتَّسَوُّق - As-Suuq wat-Tasawwuq (Pasar dan Belanja)', 'Belajar tawar-menawar, angka, warna, dan transaksi jual beli.'),
(7, 'السَّفَرُ وَالسِّيَاحَة - As-Safar was-Siyaahah (Perjalanan dan Wisata)', 'Percakapan di bandara, hotel, dan tempat wisata.'),
(8, 'الْآمَالُ وَالْمُسْتَقْبَل - Al-Amaal wal Mustaqbal (Cita-cita dan Masa Depan)', 'Ujian akhir komprehensif gabungan semua level.');

-- =====================================================
-- 🟢 LEVEL 1: PERKENALAN (التَّعَارُف)
-- =====================================================

-- MUFRODAT LEVEL 1 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(1, 'طَالِبٌ', 'Thoolibun', 'Siswa / Pelajar (Laki-laki)'),
(1, 'طَالِبَةٌ', 'Thoolibatun', 'Siswa / Pelajar (Perempuan)'),
(1, 'مُدَرِّسٌ', 'Mudarrisun', 'Guru (Laki-laki)'),
(1, 'مُدَرِّسَةٌ', 'Mudarrisatun', 'Guru (Perempuan)'),
(1, 'اِسْمِي ...', 'Ismii ...', 'Namaku ...'),
(1, 'مَا اسْمُكَ ؟', 'Mas-muka?', 'Siapa namamu? (Lk)'),
(1, 'مَا اسْمُكِ ؟', 'Mas-muki?', 'Siapa namamu? (Pr)'),
(1, 'مِنْ أَيْنَ أَنْتَ ؟', 'Min ayna anta?', 'Kamu dari mana? (Lk)'),
(1, 'أَنَا مِنْ ...', 'Ana min ...', 'Saya dari ...'),
(1, 'كَيْفَ حَالُكَ ؟', 'Kaifa haaluka?', 'Bagaimana kabarmu? (Lk)'),
(1, 'بِخَيْرٍ، اَلْحَمْدُ لِلَّهِ', 'Bikhairin, alhamdulillah', 'Baik, segala puji bagi Allah'),
(1, 'أَهْلًا وَسَهْلًا', 'Ahlan wa sahlan', 'Selamat datang'),
(1, 'أَنَا', 'Ana', 'Saya'),
(1, 'أَنْتَ', 'Anta', 'Kamu (Laki-laki)'),
(1, 'أَنْتِ', 'Anti', 'Kamu (Perempuan)'),
(1, 'سُرِرْتُ بِمَعْرِفَتِكَ', 'Surirtu bima''rifatika', 'Senang berkenalan denganmu'),
(1, 'السَّلَامُ عَلَيْكُمْ', 'Assalamu''alaikum', 'Semoga keselamatan menyertaimu'),
(1, 'وَعَلَيْكُمُ السَّلَامُ', 'Wa''alaikumussalam', 'Dan semoga keselamatan bagimu juga'),
(1, 'تِلْمِيذٌ', 'Tilmidzun', 'Murid (Laki-laki)'),
(1, 'صَدِيقٌ', 'Shodiiqun', 'Teman (Laki-laki)');

-- HIWAR LEVEL 1
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(1, 1, 'A', 'السَّلَامُ عَلَيْكُمْ', 'Assalamu''alaikum', 'Semoga keselamatan menyertaimu'),
(1, 2, 'B', 'وَعَلَيْكُمُ السَّلَامُ وَرَحْمَةُ اللهِ', 'Wa''alaikumussalam warahmatullah', 'Dan semoga keselamatan dan rahmat Allah bagimu juga'),
(1, 3, 'A', 'أَهْلًا وَسَهْلًا! أَنَا أَحْمَد، أَنَا طَالِبٌ جَدِيدٌ هُنَا', 'Ahlan wa sahlan! Ana Ahmad, ana thoolibun jadiidun huna', 'Selamat datang! Aku Ahmad, aku siswa baru di sini'),
(1, 4, 'B', 'أَهْلًا بِكَ يَا أَحْمَد! اِسْمِي عَلِيّ. كَيْفَ حَالُكَ ؟', 'Ahlan bika ya Ahmad! Ismii Ali. Kaifa haaluka?', 'Halo Ahmad! Namaku Ali. Bagaimana kabarmu?'),
(1, 5, 'A', 'بِخَيْرٍ، اَلْحَمْدُ لِلَّهِ. وَأَنْتَ ؟', 'Bikhairin, alhamdulillah. Wa anta?', 'Alhamdulillah baik. Dan kamu?'),
(1, 6, 'B', 'اَلْحَمْدُ لِلَّهِ بِخَيْرٍ أَيْضًا. مِنْ أَيْنَ أَنْتَ يَا أَحْمَد ؟', 'Alhamdulillah bikhairin aidhan. Min ayna anta ya Ahmad?', 'Alhamdulillah baik juga. Dari mana kamu, Ahmad?'),
(1, 7, 'A', 'أَنَا مِنْ بَانْدُونْج. وَأَنْتَ يَا عَلِيّ، مِنْ أَيْنَ ؟', 'Ana min Baanduunj. Wa anta ya Ali, min ayna?', 'Aku dari Bandung. Dan kamu Ali, dari mana?'),
(1, 8, 'B', 'أَنَا مِنْ جَاكَرْتَا. سُرِرْتُ بِمَعْرِفَتِكَ يَا أَحْمَد!', 'Ana min Jaakartaa. Surirtu bima''rifatika ya Ahmad!', 'Aku dari Jakarta. Senang berkenalan denganmu, Ahmad!'),
(1, 9, 'A', 'وَأَنَا سُرِرْتُ بِمَعْرِفَتِكَ أَيْضًا يَا عَلِيّ!', 'Wa ana surirtu bima''rifatika aidhan ya Ali!', 'Dan aku juga senang berkenalan denganmu, Ali!'),
(1, 10, 'B', 'هَيَّا نَذْهَبُ إِلَى الْفَصْلِ مَعًا!', 'Hayyaa nadz-habu ilal fashli ma''an!', 'Ayo kita pergi ke kelas bersama!');

-- UJIAN LEVEL 1 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(1, 'pilihan_ganda', 'Apa arti dari "السَّلَامُ عَلَيْكُمْ" ?', 'Selamat pagi', 'Semoga keselamatan menyertaimu', 'Apa kabar?', 'Terima kasih', 'b'),
(1, 'pilihan_ganda', 'Bagaimana cara menanyakan "Siapa namamu?" kepada teman laki-laki?', 'Min ayna anta?', 'Kaifa haaluka?', 'Mas-muka?', 'Man anta?', 'c'),
(1, 'pilihan_ganda', 'Kata "مُدَرِّسٌ" (Mudarrisun) artinya adalah ...', 'Siswa', 'Kepala Sekolah', 'Teman', 'Guru', 'd'),
(1, 'pilihan_ganda', 'Jika seseorang berkata "أَهْلًا وَسَهْلًا", balasan yang tepat adalah ...', 'Bikhairin', 'Wa''alaikumussalam', 'Ahlan bika', 'Syukran', 'c'),
(1, 'pilihan_ganda', 'Apa bahasa Arabnya "Namaku Ahmad" ?', 'Ana Ahmad', 'Ismii Ahmad', 'Anta Ahmad', 'Hadza Ahmad', 'b'),
(1, 'pilihan_ganda', 'Kata ganti "أَنْتِ" (Anti) digunakan untuk ...', 'Saya sendiri', 'Orang laki-laki', 'Orang perempuan', 'Banyak orang', 'c'),
(1, 'pilihan_ganda', 'Apa arti "سُرِرْتُ بِمَعْرِفَتِكَ" ?', 'Sampai jumpa', 'Senang berkenalan denganmu', 'Aku rindu kamu', 'Selamat tinggal', 'b'),
(1, 'pilihan_ganda', 'Bagaimana cara menjawab pertanyaan "كَيْفَ حَالُكَ" dengan sopan?', 'Ana min Jakarta', 'Ismii Ahmad', 'Bikhairin, alhamdulillah', 'Ahlan wa sahlan', 'c'),
(1, 'pilihan_ganda', 'Apa bahasa Arab dari "Siswa Perempuan"?', 'Mudarrisatun', 'Thoolibatun', 'Ukhtun', 'Shodiiqatun', 'b'),
(1, 'pilihan_ganda', 'Kata "تِلْمِيذٌ" (Tilmidzun) berarti ...', 'Guru', 'Orang tua', 'Murid', 'Teman', 'c'),
(1, 'pilihan_ganda', '"مِنْ أَيْنَ أَنْتَ ؟" artinya adalah ...', 'Siapa namamu?', 'Kamu dari mana?', 'Bagaimana kabarmu?', 'Kamu mau kemana?', 'b'),
(1, 'pilihan_ganda', 'Apa bahasa Arab dari "Saya"?', 'Anta', 'Anti', 'Huwa', 'Ana', 'd'),
(1, 'pilihan_ganda', 'Kata "صَدِيقٌ" (Shodiiqun) artinya ...', 'Musuh', 'Teman', 'Guru', 'Siswa', 'b'),
(1, 'pilihan_ganda', 'Jika Ali berkata "أَنَا مِنْ جَاكَرْتَا", itu artinya ...', 'Aku suka Jakarta', 'Aku pergi ke Jakarta', 'Aku dari Jakarta', 'Aku tinggal di Jakarta', 'c'),
(1, 'pilihan_ganda', 'Apa perbedaan "مُدَرِّسٌ" dan "مُدَرِّسَةٌ"?', 'Mudarris = guru lk, Mudarrisah = guru pr', 'Keduanya sama', 'Mudarris = dosen, Mudarrisah = guru', 'Mudarris = siswa, Mudarrisah = siswi', 'a'),
(1, 'pilihan_ganda', 'Balasan yang tepat untuk "السَّلَامُ عَلَيْكُمْ" adalah ...', 'Ahlan wa sahlan', 'Wa''alaikumussalam', 'Bikhairin', 'Syukran jazilan', 'b'),
(1, 'pilihan_ganda', 'Apa arti dari "أَهْلًا بِكَ"?', 'Selamat tinggal', 'Terima kasih', 'Selamat datang untukmu', 'Apa kabar?', 'c'),
(1, 'pilihan_ganda', '"طَالِبٌ جَدِيدٌ" artinya adalah ...', 'Siswa lama', 'Siswa pintar', 'Siswa baru', 'Siswa rajin', 'c'),
(1, 'pilihan_ganda', 'Kata ganti "أَنْتَ" (Anta) digunakan untuk ...', 'Saya sendiri', 'Laki-laki yang diajak bicara', 'Perempuan yang diajak bicara', 'Orang ketiga', 'b'),
(1, 'pilihan_ganda', 'Apa bahasa Arab dari "Selamat datang"?', 'Assalamu''alaikum', 'Ahlan wa sahlan', 'Bikhairin', 'Surirtu bima''rifatika', 'b');

-- =====================================================
-- 🟡 LEVEL 2: KEHIDUPAN SEKOLAH
-- =====================================================

-- MUFRODAT LEVEL 2 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(2, 'فَصْلٌ', 'Fashlun', 'Kelas / Ruang Kelas'),
(2, 'سَبُّورَةٌ', 'Sabburatun', 'Papan Tulis'),
(2, 'قَلَمٌ', 'Qolamun', 'Pena / Pulpen'),
(2, 'كِتَابٌ', 'Kitaabun', 'Buku'),
(2, 'كُرَاسَةٌ', 'Kurraasatun', 'Buku Tulis'),
(2, 'مَكْتَبَةٌ', 'Maktabatun', 'Perpustakaan'),
(2, 'دَرْسٌ', 'Darsun', 'Pelajaran'),
(2, 'مَدْرَسَةٌ', 'Madrasatun', 'Sekolah / Madrasah'),
(2, 'مِمْحَاةٌ', 'Mimhaatun', 'Penghapus'),
(2, 'حَقِيبَةٌ', 'Haqiibatun', 'Tas Sekolah'),
(2, 'مِسْطَرَةٌ', 'Mistaratun', 'Penggaris'),
(2, 'كُرْسِيٌّ', 'Kursiyyun', 'Kursi'),
(2, 'مَكْتَبٌ', 'Maktabun', 'Meja Tulis'),
(2, 'جَدْوَلٌ', 'Jadwalun', 'Jadwal'),
(2, 'اِمْتِحَانٌ', 'Imtihaanun', 'Ujian'),
(2, 'وَاجِبٌ', 'Waajibun', 'Tugas / PR'),
(2, 'مُدِيرٌ', 'Mudiirun', 'Kepala Sekolah'),
(2, 'مَلْعَبٌ', 'Mal''abun', 'Lapangan'),
(2, 'مَعْمَلٌ', 'Ma''malun', 'Laboratorium'),
(2, 'مُصَلَّى', 'Mushollaa', 'Musholla / Tempat Sholat');

-- HIWAR LEVEL 2
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(2, 1, 'A', 'السَّلَامُ عَلَيْكُمْ يَا زَيْنَب! هَلْ عِنْدَكِ جَدْوَلُ الدُّرُوسِ ؟', 'Assalamu''alaikum ya Zainab! Hal ''indaki jadwalud duruus?', 'Assalamualaikum Zainab! Apakah kamu punya jadwal pelajaran?'),
(2, 2, 'B', 'وَعَلَيْكُمُ السَّلَامُ يَا فَاطِمَة! نَعَمْ، عِنْدِي. مَاذَا تُرِيدِينَ ؟', 'Wa''alaikumussalam ya Fatimah! Na''am, ''indii. Maadzaa turidiina?', 'Waalaikumsalam Fatimah! Ya, aku punya. Apa yang kamu inginkan?'),
(2, 3, 'A', 'مَا دَرْسُنَا الْآنَ ؟', 'Maa darsunaa al-aana?', 'Apa pelajaran kita sekarang?'),
(2, 4, 'B', 'دَرْسُنَا الْآنَ هُوَ اللُّغَةُ الْعَرَبِيَّةُ فِي الْفَصْلِ الثَّالِثِ', 'Darsunaa al-aana huwal lughatul ''arabiyyatu fil fashlits tsaalitsi', 'Pelajaran kita sekarang adalah Bahasa Arab di Kelas 3'),
(2, 5, 'A', 'جَمِيلٌ! وَأَيْنَ الْمَكْتَبَةُ ؟ أُرِيدُ أَنْ أَسْتَعِيرَ كِتَابًا', 'Jamiilun! Wa aynal maktabatu? Uriidu an asta''iira kitaaban', 'Bagus! Dan di mana perpustakaan? Aku ingin meminjam buku'),
(2, 6, 'B', 'الْمَكْتَبَةُ بِجَانِبِ الْمُصَلَّى. هَلْ تَحْتَاجِينَ قَلَمًا أَيْضًا ؟', 'Al-maktabatu bijaanibil mushollaa. Hal tahtaajiina qolaman aidhan?', 'Perpustakaan di samping musholla. Apakah kamu butuh pena juga?'),
(2, 7, 'A', 'نَعَمْ، أَحْتَاجُ قَلَمًا وَكُرَّاسَةً. شُكْرًا يَا زَيْنَب!', 'Na''am, ahtaaju qolaman wa kurraasatan. Syukran ya Zainab!', 'Ya, aku butuh pena dan buku tulis. Terima kasih Zainab!'),
(2, 8, 'B', 'عَفْوًا يَا فَاطِمَة! هَيَّا نَذْهَبُ إِلَى الْفَصْلِ قَبْلَ الدَّرْسِ', 'Afwan ya Fatimah! Hayyaa nadz-habu ilal fashli qoblad darsi', 'Sama-sama Fatimah! Ayo kita ke kelas sebelum pelajaran dimulai'),
(2, 9, 'A', 'هَلْ أَحْضَرْتِ الْوَاجِبَ ؟', 'Hal ahdhortil waajiba?', 'Apakah kamu sudah membawa PR?'),
(2, 10, 'B', 'نَعَمْ! الْوَاجِبُ فِي حَقِيبَتِي. لَا تَنْسَيْ حَقِيبَتَكِ!', 'Na''am! Al-waajibu fii haqiibatii. Laa tansay haqiibataki!', 'Sudah! PR-nya di dalam tasku. Jangan lupa tasmu!');

-- UJIAN LEVEL 2 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Papan Tulis" ?', 'Maktabun', 'Sabburatun', 'Kursiyyun', 'Fashlun', 'b'),
(2, 'pilihan_ganda', 'Kata "مَكْتَبَةٌ" (Maktabatun) artinya adalah ...', 'Meja Tulis', 'Papan Tulis', 'Perpustakaan', 'Kelas', 'c'),
(2, 'pilihan_ganda', '"حَقِيبَةٌ" (Haqiibatun) dalam bahasa Indonesia berarti ...', 'Buku', 'Penghapus', 'Penggaris', 'Tas Sekolah', 'd'),
(2, 'pilihan_ganda', 'Apa perbedaan antara "مَكْتَبٌ" dan "مَكْتَبَةٌ" ?', 'Keduanya sama', 'Maktab = Meja, Maktabah = Perpustakaan', 'Maktab = Buku, Maktabah = Toko', 'Maktab = Kelas, Maktabah = Ruangan', 'b'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Pelajaran" ?', 'Fashlun', 'Kitaabun', 'Darsun', 'Jadwalun', 'c'),
(2, 'pilihan_ganda', 'Kata "وَاجِبٌ" (Waajibun) berarti ...', 'Ujian Harian', 'Tugas / PR', 'Jadwal', 'Buku Catatan', 'b'),
(2, 'pilihan_ganda', '"أَيْنَ الْمَكْتَبَةُ ؟" artinya ...', 'Apa nama perpustakaan?', 'Siapa di perpustakaan?', 'Di mana perpustakaan?', 'Kapan ke perpustakaan?', 'c'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Laboratorium" ?', 'Mushollaa', 'Mal''abun', 'Ma''malun', 'Maktabatun', 'c'),
(2, 'pilihan_ganda', 'Kata "قَلَمٌ" (Qolamun) artinya ...', 'Pensil', 'Pena / Pulpen', 'Penghapus', 'Penggaris', 'b'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Buku"?', 'Kurraasatun', 'Kitaabun', 'Qolamun', 'Darsun', 'b'),
(2, 'pilihan_ganda', '"مُدِيرٌ" (Mudiirun) berarti ...', 'Guru', 'Siswa', 'Kepala Sekolah', 'Penjaga', 'c'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Kursi"?', 'Maktabun', 'Kursiyyun', 'Fashlun', 'Sabburatun', 'b'),
(2, 'pilihan_ganda', 'Kata "اِمْتِحَانٌ" (Imtihaanun) berarti ...', 'PR', 'Pelajaran', 'Ujian', 'Jadwal', 'c'),
(2, 'pilihan_ganda', '"مَلْعَبٌ" (Mal''abun) artinya adalah ...', 'Kelas', 'Kantin', 'Lapangan', 'Musholla', 'c'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Penggaris"?', 'Mimhaatun', 'Qolamun', 'Mistaratun', 'Haqiibatun', 'd'),
(2, 'pilihan_ganda', 'Kata "كُرَاسَةٌ" (Kurraasatun) berarti ...', 'Buku Cetak', 'Buku Tulis', 'Kamus', 'Majalah', 'b'),
(2, 'pilihan_ganda', '"مِمْحَاةٌ" (Mimhaatun) dalam bahasa Indonesia ...', 'Penghapus', 'Penggaris', 'Pensil', 'Lem', 'a'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Jadwal"?', 'Darsun', 'Waajibun', 'Jadwalun', 'Imtihaanun', 'c'),
(2, 'pilihan_ganda', '"هَلْ عِنْدَكِ كِتَابٌ ؟" artinya ...', 'Apakah kamu punya buku?', 'Di mana bukumu?', 'Berapa harga buku?', 'Siapa punya buku?', 'a'),
(2, 'pilihan_ganda', 'Apa bahasa Arab dari "Musholla"?', 'Ma''malun', 'Maktabatun', 'Mushollaa', 'Mal''abun', 'c');

-- =====================================================
-- 🟠 LEVEL 3: KELUARGA DAN RUMAH
-- =====================================================

-- MUFRODAT LEVEL 3 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(3, 'أَبٌ', 'Abun', 'Ayah'),
(3, 'أُمٌّ', 'Ummun', 'Ibu'),
(3, 'أَخٌ', 'Akhun', 'Saudara Laki-laki'),
(3, 'أُخْتٌ', 'Ukhtun', 'Saudara Perempuan'),
(3, 'جَدٌّ', 'Jaddun', 'Kakek'),
(3, 'جَدَّةٌ', 'Jaddatun', 'Nenek'),
(3, 'بَيْتٌ', 'Baitun', 'Rumah'),
(3, 'غُرْفَةُ النَّوْمِ', 'Ghurfatun naum', 'Kamar Tidur'),
(3, 'غُرْفَةُ الجُلُوسِ', 'Ghurfatul juluus', 'Ruang Tamu'),
(3, 'مَطْبَخٌ', 'Mathbakhun', 'Dapur'),
(3, 'حَمَّامٌ', 'Hammaaumun', 'Kamar Mandi'),
(3, 'حَدِيقَةٌ', 'Hadiiqatun', 'Kebun / Taman'),
(3, 'يَقْرَأُ', 'Yaqro-u', 'Dia (Lk) membaca'),
(3, 'يَأْكُلُ', 'Ya''kulu', 'Dia (Lk) makan'),
(3, 'يَنَامُ', 'Yanaamu', 'Dia (Lk) tidur'),
(3, 'يَطْبُخُ', 'Yathbukhu', 'Dia (Lk) memasak'),
(3, 'يُسَاعِدُ', 'Yusaa''idu', 'Dia (Lk) membantu'),
(3, 'عَائِلَةٌ', '''Aa-ilatun', 'Keluarga'),
(3, 'كَبِيرٌ', 'Kabiirun', 'Besar'),
(3, 'صَغِيرٌ', 'Shoghiirun', 'Kecil');

-- HIWAR LEVEL 3
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(3, 1, 'A', 'يَا خَالِد! هَلْ تُرِيدُ أَنْ تَأْتِيَ إِلَى بَيْتِي لِلدِّرَاسَةِ مَعًا ؟', 'Ya Khalid! Hal turiidu an ta''tiya ilaa baitii lid-diraasati ma''an?', 'Khalid! Maukah kamu datang ke rumahku untuk belajar bersama?'),
(3, 2, 'B', 'بِكُلِّ سُرُورٍ يَا عُمَر! كَيْفَ بَيْتُكَ ؟', 'Bikulli sururin ya Umar! Kaifa baituka?', 'Dengan senang hati, Umar! Bagaimana rumahmu?'),
(3, 3, 'A', 'بَيْتِي كَبِيرٌ. فِيهِ غُرْفَةُ النَّوْمِ وَغُرْفَةُ الجُلُوسِ وَالْمَطْبَخُ', 'Baitii kabiirun. Fiihi ghurfatun naum wa ghurfatul juluus wal mathbakh', 'Rumahku besar. Ada kamar tidur, ruang tamu, dan dapur'),
(3, 4, 'B', 'مَاشَاءَ اللهُ! مَنْ فِي بَيْتِكَ ؟', 'Maasyaa-allah! Man fii baitika?', 'Masya Allah! Siapa saja di rumahmu?'),
(3, 5, 'A', 'أَبِي وَأُمِّي وَأَخِي الصَّغِيرُ وَأُخْتِي', 'Abii wa ummii wa akhis shoghiiru wa ukhtii', 'Ayahku, ibuku, adik laki-lakiku, dan kakak perempuanku'),
(3, 6, 'B', 'مَاذَا يَعْمَلُ أَبُوكَ ؟', 'Maadzaa ya''malu abuuka?', 'Apa pekerjaan ayahmu?'),
(3, 7, 'A', 'أَبِي مُدَرِّسٌ. وَأُمِّي تَطْبُخُ طَعَامًا لَذِيذًا كُلَّ يَوْمٍ', 'Abii mudarrisun. Wa ummii tathbukhu tho''aaman ladziidzan kulla yaumin', 'Ayahku seorang guru. Dan ibuku memasak makanan enak setiap hari'),
(3, 8, 'B', 'رَائِعٌ! أَيْنَ نَدْرُسُ ؟ فِي غُرْفَةِ الجُلُوسِ ؟', 'Roo-i''un! Ayna nadrusu? Fii ghurfatil juluus?', 'Hebat! Di mana kita belajar? Di ruang tamu?'),
(3, 9, 'A', 'نَعَمْ، نَدْرُسُ فِي غُرْفَةِ الجُلُوسِ. أُمِّي سَتُحَضِّرُ لَنَا الشَّايَ', 'Na''am, nadrusu fii ghurfatil juluus. Ummii satuhaddiru lanaasy syaay', 'Ya, kita belajar di ruang tamu. Ibuku akan menyiapkan teh untuk kita'),
(3, 10, 'B', 'شُكْرًا يَا عُمَر! أَنَا فِي الطَّرِيقِ الْآنَ', 'Syukran ya Umar! Ana fit thoriiqil aana', 'Terima kasih Umar! Aku sedang di jalan sekarang');

-- UJIAN LEVEL 3 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Ibu" ?', 'Ukhtun', 'Jaddatun', 'Ummun', 'Abun', 'c'),
(3, 'pilihan_ganda', 'Kata "مَطْبَخٌ" (Mathbakhun) artinya ...', 'Kamar Tidur', 'Ruang Tamu', 'Kamar Mandi', 'Dapur', 'd'),
(3, 'pilihan_ganda', 'Apa arti dari kata kerja "يَقْرَأُ" (Yaqro-u) ?', 'Makan', 'Membaca', 'Tidur', 'Memasak', 'b'),
(3, 'pilihan_ganda', '"غُرْفَةُ النَّوْمِ" artinya adalah ...', 'Ruang Tamu', 'Kamar Mandi', 'Kamar Tidur', 'Dapur', 'c'),
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Kakek" ?', 'Abun', 'Akhun', 'Jaddun', 'Ummun', 'c'),
(3, 'pilihan_ganda', 'Kata "يَطْبُخُ" (Yathbukhu) berarti ...', 'Membaca', 'Menulis', 'Memasak', 'Bermain', 'c'),
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Saudara Perempuan" ?', 'Jaddatun', 'Ummun', 'Ukhtun', 'Bintun', 'c'),
(3, 'pilihan_ganda', '"بَيْتٌ كَبِيرٌ" artinya adalah ...', 'Rumah kecil', 'Rumah besar', 'Rumah baru', 'Rumah tua', 'b'),
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Nenek"?', 'Ummun', 'Ukhtun', 'Jaddatun', 'Abun', 'c'),
(3, 'pilihan_ganda', 'Kata "يَنَامُ" (Yanaamu) berarti ...', 'Makan', 'Membaca', 'Memasak', 'Tidur', 'd'),
(3, 'pilihan_ganda', '"حَدِيقَةٌ" (Hadiiqatun) artinya ...', 'Kamar Mandi', 'Kebun / Taman', 'Dapur', 'Garasi', 'b'),
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Ayah"?', 'Akhun', 'Jaddun', 'Ummun', 'Abun', 'd'),
(3, 'pilihan_ganda', '"عَائِلَةٌ" (''Aa-ilatun) berarti ...', 'Teman', 'Keluarga', 'Tetangga', 'Saudara', 'b'),
(3, 'pilihan_ganda', 'Kata "يُسَاعِدُ" (Yusaa''idu) artinya ...', 'Membantu', 'Bermain', 'Tidur', 'Makan', 'a'),
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Kamar Mandi"?', 'Mathbakhun', 'Hammaaumun', 'Ghurfatun naum', 'Hadiiqatun', 'b'),
(3, 'pilihan_ganda', '"يَأْكُلُ" (Ya''kulu) berarti ...', 'Minum', 'Makan', 'Tidur', 'Membaca', 'b'),
(3, 'pilihan_ganda', 'Apa arti "صَغِيرٌ" (Shoghiirun)?', 'Besar', 'Tinggi', 'Kecil', 'Panjang', 'c'),
(3, 'pilihan_ganda', 'Apa bahasa Arab dari "Saudara Laki-laki"?', 'Abun', 'Akhun', 'Jaddun', 'Shodiiqun', 'b'),
(3, 'pilihan_ganda', '"غُرْفَةُ الجُلُوسِ" artinya ...', 'Kamar Tidur', 'Ruang Tamu', 'Dapur', 'Kamar Mandi', 'b'),
(3, 'pilihan_ganda', 'Apa arti "كَبِيرٌ" (Kabiirun)?', 'Kecil', 'Besar', 'Baru', 'Lama', 'b');

-- =====================================================
-- 🔴 LEVEL 4: HOBI DAN WAKTU LUANG
-- =====================================================

-- MUFRODAT LEVEL 4 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(4, 'كُرَةُ القَدَمِ', 'Kuratul Qodam', 'Sepak Bola'),
(4, 'رِحْلَةٌ', 'Rihlatun', 'Jalan-jalan / Piknik'),
(4, 'قِرَاءَةٌ', 'Qiroo-atun', 'Membaca (Kegiatan)'),
(4, 'يَلْعَبُ', 'Yal''abu', 'Bermain'),
(4, 'يَوْمُ العُطْلَةِ', 'Yaumul ''Uthlah', 'Hari Libur'),
(4, 'سِبَاحَةٌ', 'Sibaahatun', 'Berenang'),
(4, 'رَسْمٌ', 'Rosmun', 'Menggambar'),
(4, 'مُوسِيقَى', 'Muusiiqoo', 'Musik'),
(4, 'هِوَايَةٌ', 'Hiwaayatun', 'Hobi'),
(4, 'كُرَةُ السَّلَّةِ', 'Kuratus sallati', 'Bola Basket'),
(4, 'رِيَاضَةٌ', 'Riyaadhatun', 'Olahraga'),
(4, 'مَلْعَبٌ', 'Mal''abun', 'Lapangan'),
(4, 'مَكْتَبَةٌ', 'Maktabatun', 'Toko Buku / Perpustakaan'),
(4, 'يُحِبُّ', 'Yuhibbu', 'Dia (Lk) suka'),
(4, 'يُسَافِرُ', 'Yusaafiru', 'Dia (Lk) bepergian'),
(4, 'أُسْبُوعٌ', 'Usbuu''un', 'Minggu (Pekan)'),
(4, 'نِهَايَةُ الأُسْبُوعِ', 'Nihaayatul usbuu''i', 'Akhir Pekan'),
(4, 'وَقْتُ الفَرَاغِ', 'Waqtul farooghi', 'Waktu Luang'),
(4, 'تَصْوِيرٌ', 'Tashwiirun', 'Fotografi'),
(4, 'طَبْخٌ', 'Thobkhun', 'Memasak (Hobi)');

-- HIWAR LEVEL 4
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(4, 1, 'A', 'يَا إِبْرَاهِيم! غَدًا يَوْمُ العُطْلَةِ. مَاذَا تُرِيدُ أَنْ تَفْعَلَ ؟', 'Ya Ibrahim! Ghodan yaumul ''uthlah. Maadzaa turiidu an taf''ala?', 'Ibrahim! Besok hari libur. Apa yang ingin kamu lakukan?'),
(4, 2, 'B', 'أُرِيدُ أَنْ أَلْعَبَ كُرَةَ القَدَمِ فِي المَلْعَبِ. هَلْ تُحِبُّ كُرَةَ القَدَمِ ؟', 'Uriidu an al''aba kuratal qodami fil mal''abi. Hal tuhibbu kuratal qodami?', 'Aku ingin bermain sepak bola di lapangan. Apakah kamu suka sepak bola?'),
(4, 3, 'A', 'نَعَمْ أُحِبُّهَا! وَلَكِنْ أُحِبُّ القِرَاءَةَ أَيْضًا', 'Na''am uhibbuhaa! Walaakin uhibbul qiroo-ata aidhan', 'Iya aku suka! Tapi aku juga suka membaca'),
(4, 4, 'B', 'فِكْرَةٌ جَمِيلَةٌ! أَنَا أَيْضًا أُرِيدُ كِتَابًا عَنِ الرِّيَاضَةِ', 'Fikratun jamiilah! Ana aidhan uriidu kitaaban ''anir riyaadhah', 'Ide bagus! Aku juga ingin buku tentang olahraga'),
(4, 5, 'A', 'مَا هِوَايَتُكَ الأُخْرَى يَا إِبْرَاهِيم ؟', 'Maa hiwaayatukal ukhroo ya Ibrahim?', 'Apa hobi lainmu, Ibrahim?'),
(4, 6, 'B', 'أُحِبُّ السِّبَاحَةَ وَالتَّصْوِيرَ. وَأَنْتَ ؟', 'Uhibbus sibaahataa wat tashwiira. Wa anta?', 'Aku suka berenang dan fotografi. Dan kamu?'),
(4, 7, 'A', 'أُحِبُّ الرَّسْمَ وَالطَّبْخَ. أَطْبُخُ مَعَ أُمِّي كُلَّ نِهَايَةِ أُسْبُوعٍ', 'Uhibbur rosma wath thobkha. Athbukhu ma''a ummii kulla nihaayati usbuu''in', 'Aku suka menggambar dan memasak. Aku memasak bersama ibuku setiap akhir pekan'),
(4, 8, 'B', 'رَائِعٌ! إِذَنْ خُطَّتُنَا: المَكْتَبَةُ ثُمَّ المَلْعَبُ!', 'Roo-i''un! Idzan khuttotunaa: al-maktabatu tsummal mal''abu!', 'Keren! Jadi rencana kita: toko buku lalu lapangan!'),
(4, 9, 'A', 'مُمْتَازٌ! نَلْتَقِي السَّاعَةَ التَّاسِعَةَ صَبَاحًا', 'Mumtaaz! Naltaqii as-saa''ata at-taasi''ata shobaahan', 'Sempurna! Kita bertemu jam 9 pagi'),
(4, 10, 'B', 'اِتَّفَقْنَا! إِلَى اللِّقَاءِ غَدًا!', 'Ittafaqnaa! Ilal liqoo-i ghodan!', 'Deal! Sampai jumpa besok!');

-- UJIAN LEVEL 4 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Sepak Bola" ?', 'Kuratus sallati', 'Kuratul Qodam', 'Riyaadhatun', 'Sibaahatun', 'b'),
(4, 'pilihan_ganda', 'Kata "رِحْلَةٌ" (Rihlatun) artinya ...', 'Hari Libur', 'Akhir Pekan', 'Jalan-jalan / Piknik', 'Olahraga', 'c'),
(4, 'pilihan_ganda', '"يَلْعَبُ كُرَةَ القَدَمِ" artinya ...', 'Bermain Bola Basket', 'Bermain Sepak Bola', 'Menonton Bola', 'Membeli Bola', 'b'),
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Berenang" ?', 'Riyaadhatun', 'Hiwaayatun', 'Sibaahatun', 'Qiroo-atun', 'c'),
(4, 'pilihan_ganda', 'Kata "نِهَايَةُ الأُسْبُوعِ" berarti ...', 'Hari Senin', 'Akhir Pekan', 'Awal Bulan', 'Hari Libur Nasional', 'b'),
(4, 'pilihan_ganda', 'Apa arti kata "يُحِبُّ" (Yuhibbu) ?', 'Membenci', 'Bermain', 'Suka / Mencintai', 'Pergi', 'c'),
(4, 'pilihan_ganda', '"مَا هِوَايَتُكَ ؟" artinya ...', 'Apa pekerjaanmu?', 'Apa hobimu?', 'Apa makananmu?', 'Bagaimana kabarmu?', 'b'),
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Fotografi" ?', 'Rosmun', 'Muusiiqoo', 'Tashwiirun', 'Thobkhun', 'c'),
(4, 'pilihan_ganda', 'Kata "رَسْمٌ" (Rosmun) artinya ...', 'Menulis', 'Menggambar', 'Membaca', 'Bermain', 'b'),
(4, 'pilihan_ganda', '"وَقْتُ الفَرَاغِ" artinya ...', 'Waktu belajar', 'Waktu kerja', 'Waktu luang', 'Waktu tidur', 'c'),
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Bola Basket"?', 'Kuratul Qodam', 'Kuratus sallati', 'Riyaadhatun', 'Sibaahatun', 'b'),
(4, 'pilihan_ganda', '"يُسَافِرُ" (Yusaafiru) berarti ...', 'Bermain', 'Belajar', 'Bepergian', 'Berenang', 'c'),
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Olahraga"?', 'Hiwaayatun', 'Riyaadhatun', 'Sibaahatun', 'Qiroo-atun', 'b'),
(4, 'pilihan_ganda', 'Kata "مُوسِيقَى" (Muusiiqoo) artinya ...', 'Seni', 'Tari', 'Musik', 'Puisi', 'c'),
(4, 'pilihan_ganda', '"أُسْبُوعٌ" (Usbuu''un) berarti ...', 'Hari', 'Bulan', 'Tahun', 'Minggu (Pekan)', 'd'),
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Hari Libur"?', 'Nihaayatul usbuu''i', 'Yaumul ''Uthlah', 'Waqtul farooghi', 'Usbuu''un', 'b'),
(4, 'pilihan_ganda', '"قِرَاءَةٌ" (Qiroo-atun) artinya ...', 'Menulis', 'Menggambar', 'Membaca', 'Bermain', 'c'),
(4, 'pilihan_ganda', 'Apa bahasa Arab dari "Memasak (hobi)"?', 'Rosmun', 'Tashwiirun', 'Sibaahatun', 'Thobkhun', 'd'),
(4, 'pilihan_ganda', 'Kata "هِوَايَةٌ" (Hiwaayatun) berarti ...', 'Pekerjaan', 'Hobi', 'Kegiatan', 'Tugas', 'b'),
(4, 'pilihan_ganda', '"مَلْعَبٌ" (Mal''abun) artinya ...', 'Sekolah', 'Rumah', 'Lapangan', 'Taman', 'c');

-- =====================================================
-- 🟤 LEVEL 5: MAKANAN DAN MINUMAN
-- =====================================================

-- MUFRODAT LEVEL 5 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(5, 'طَعَامٌ', 'Tho''aamun', 'Makanan'),
(5, 'شَرَابٌ', 'Syaroobun', 'Minuman'),
(5, 'أَرُزٌّ', 'Aruzzun', 'Nasi'),
(5, 'خُبْزٌ', 'Khubzun', 'Roti'),
(5, 'لَحْمٌ', 'Lahmun', 'Daging'),
(5, 'دَجَاجٌ', 'Dajaajun', 'Ayam'),
(5, 'سَمَكٌ', 'Samakun', 'Ikan'),
(5, 'خُضْرَاوَاتٌ', 'Khudhrowaatun', 'Sayur-sayuran'),
(5, 'فَاكِهَةٌ', 'Faakihatun', 'Buah-buahan'),
(5, 'مَاءٌ', 'Maa-un', 'Air'),
(5, 'شَايٌ', 'Syaayun', 'Teh'),
(5, 'حَلِيبٌ', 'Haliibun', 'Susu'),
(5, 'عَصِيرٌ', '''Ashiirun', 'Jus'),
(5, 'قَهْوَةٌ', 'Qohwatun', 'Kopi'),
(5, 'مَطْعَمٌ', 'Math''amun', 'Restoran'),
(5, 'لَذِيذٌ', 'Ladzidzun', 'Lezat / Enak'),
(5, 'جَائِعٌ', 'Jaa-i''un', 'Lapar'),
(5, 'عَطْشَانُ', '''Athsyaanu', 'Haus'),
(5, 'فُطُورٌ', 'Futhuurun', 'Sarapan'),
(5, 'غَدَاءٌ', 'Ghodaa-un', 'Makan Siang');

-- HIWAR LEVEL 5
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(5, 1, 'A', 'يَا عَلِيّ! أَنَا جَائِعٌ جِدًّا. هَلْ تُرِيدُ أَنْ نَأْكُلَ مَعًا ؟', 'Ya Ali! Ana jaa-i''un jiddan. Hal turiidu an na''kula ma''an?', 'Ali! Aku sangat lapar. Maukah kamu makan bersama?'),
(5, 2, 'B', 'نَعَمْ! أَنَا جَائِعٌ أَيْضًا. أَيْنَ نَأْكُلُ ؟', 'Na''am! Ana jaa-i''un aidhan. Ayna na''kulu?', 'Ya! Aku juga lapar. Di mana kita makan?'),
(5, 3, 'A', 'هُنَاكَ مَطْعَمٌ جَدِيدٌ بِجَانِبِ المَدْرَسَةِ. الطَّعَامُ هُنَاكَ لَذِيذٌ', 'Hunaaka math''amun jadiidun bijaanibil madrasati. Ath-tho''aamu hunaaka ladzidzun', 'Ada restoran baru di samping sekolah. Makanannya enak'),
(5, 4, 'B', 'مُمْتَازٌ! مَاذَا تُرِيدُ أَنْ تَأْكُلَ ؟', 'Mumtaaz! Maadzaa turiidu an ta''kula?', 'Sempurna! Apa yang ingin kamu makan?'),
(5, 5, 'A', 'أُرِيدُ أَرُزًّا مَعَ دَجَاجٍ وَخُضْرَاوَاتٍ', 'Uriidu aruzzan ma''a dajaaajin wa khudhrowaatin', 'Aku mau nasi dengan ayam dan sayur-sayuran'),
(5, 6, 'B', 'وَأَنَا أُرِيدُ أَرُزًّا مَعَ سَمَكٍ. وَمَاذَا نَشْرَبُ ؟', 'Wa ana uriidu aruzzan ma''a samakin. Wa maadzaa nasyrabu?', 'Dan aku mau nasi dengan ikan. Dan apa yang kita minum?'),
(5, 7, 'A', 'أُرِيدُ عَصِيرَ بُرْتُقَالٍ. وَأَنْتَ ؟', 'Uriidu ''ashiira burtuqoolin. Wa anta?', 'Aku mau jus jeruk. Dan kamu?'),
(5, 8, 'B', 'أُرِيدُ شَايًا حَارًّا. بَعْدَ الأَكْلِ نَأْكُلُ فَاكِهَةً', 'Uriidu syaayan haarran. Ba''dal akli na''kulu faakihatan', 'Aku mau teh panas. Setelah makan kita makan buah'),
(5, 9, 'A', 'فِكْرَةٌ رَائِعَةٌ! هَيَّا نَذْهَبُ الْآنَ', 'Fikratun roo-i''atun! Hayyaa nadz-habu al-aana', 'Ide hebat! Ayo kita pergi sekarang'),
(5, 10, 'B', 'هَيَّا! بِسْمِ اللهِ', 'Hayyaa! Bismillah', 'Ayo! Bismillah');

-- UJIAN LEVEL 5 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Nasi"?', 'Khubzun', 'Aruzzun', 'Lahmun', 'Samakun', 'b'),
(5, 'pilihan_ganda', 'Kata "دَجَاجٌ" (Dajaajun) artinya ...', 'Ikan', 'Daging', 'Ayam', 'Kambing', 'c'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Air"?', 'Syaayun', 'Haliibun', 'Qohwatun', 'Maa-un', 'd'),
(5, 'pilihan_ganda', '"مَطْعَمٌ" (Math''amun) berarti ...', 'Dapur', 'Kantin', 'Restoran', 'Warung', 'c'),
(5, 'pilihan_ganda', 'Apa arti dari "لَذِيذٌ" (Ladzidzun)?', 'Pedas', 'Asin', 'Manis', 'Lezat / Enak', 'd'),
(5, 'pilihan_ganda', 'Kata "جَائِعٌ" (Jaa-i''un) artinya ...', 'Kenyang', 'Lapar', 'Haus', 'Capek', 'b'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Teh"?', 'Qohwatun', 'Syaayun', 'Haliibun', '''Ashiirun', 'b'),
(5, 'pilihan_ganda', '"خُبْزٌ" (Khubzun) artinya ...', 'Nasi', 'Mie', 'Roti', 'Kue', 'c'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Ikan"?', 'Dajaajun', 'Lahmun', 'Samakun', 'Aruzzun', 'c'),
(5, 'pilihan_ganda', '"فَاكِهَةٌ" (Faakihatun) berarti ...', 'Sayur-sayuran', 'Buah-buahan', 'Daging', 'Roti', 'b'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Kopi"?', 'Syaayun', 'Haliibun', 'Qohwatun', 'Maa-un', 'c'),
(5, 'pilihan_ganda', 'Kata "عَطْشَانُ" (''Athsyaanu) artinya ...', 'Lapar', 'Capek', 'Haus', 'Senang', 'c'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Susu"?', '''Ashiirun', 'Haliibun', 'Syaayun', 'Maa-un', 'b'),
(5, 'pilihan_ganda', '"غَدَاءٌ" (Ghodaa-un) berarti ...', 'Sarapan', 'Makan Siang', 'Makan Malam', 'Camilan', 'b'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Sarapan"?', 'Ghodaa-un', 'Futhuurun', 'Tho''aamun', 'Syaroobun', 'b'),
(5, 'pilihan_ganda', '"خُضْرَاوَاتٌ" (Khudhrowaatun) artinya ...', 'Buah', 'Daging', 'Sayur-sayuran', 'Roti', 'c'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Daging"?', 'Samakun', 'Dajaajun', 'Lahmun', 'Aruzzun', 'c'),
(5, 'pilihan_ganda', 'Kata "شَرَابٌ" (Syaroobun) berarti ...', 'Makanan', 'Minuman', 'Buah', 'Sayur', 'b'),
(5, 'pilihan_ganda', '"عَصِيرٌ" (''Ashiirun) artinya ...', 'Teh', 'Air', 'Jus', 'Susu', 'c'),
(5, 'pilihan_ganda', 'Apa bahasa Arab dari "Makanan"?', 'Syaroobun', 'Tho''aamun', 'Math''amun', 'Futhuurun', 'b');

-- =====================================================
-- 🔵 LEVEL 6: PASAR DAN BELANJA
-- =====================================================

-- MUFRODAT LEVEL 6 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(6, 'سُوقٌ', 'Suuqun', 'Pasar'),
(6, 'دُكَّانٌ', 'Dukkaanun', 'Toko'),
(6, 'ثَمَنٌ', 'Tsamanun', 'Harga'),
(6, 'نُقُودٌ', 'Nuquudun', 'Uang'),
(6, 'رَخِيصٌ', 'Rokhiishun', 'Murah'),
(6, 'غَالٍ', 'Ghoolin', 'Mahal'),
(6, 'يَشْتَرِي', 'Yasytarii', 'Membeli'),
(6, 'يَبِيعُ', 'Yabii''u', 'Menjual'),
(6, 'مَلَابِسُ', 'Malaabisu', 'Pakaian'),
(6, 'حِذَاءٌ', 'Hidzaa-un', 'Sepatu'),
(6, 'قَمِيصٌ', 'Qomiishun', 'Baju / Kemeja'),
(6, 'سِرْوَالٌ', 'Sirwaalun', 'Celana'),
(6, 'أَحْمَرُ', 'Ahmaru', 'Merah'),
(6, 'أَبْيَضُ', 'Abyadhu', 'Putih'),
(6, 'أَسْوَدُ', 'Aswadu', 'Hitam'),
(6, 'أَزْرَقُ', 'Azroqu', 'Biru'),
(6, 'أَخْضَرُ', 'Akhdoru', 'Hijau'),
(6, 'كَمْ', 'Kam', 'Berapa'),
(6, 'هَذَا', 'Haadzaa', 'Ini (Lk)'),
(6, 'هَذِهِ', 'Haadzihi', 'Ini (Pr)');

-- HIWAR LEVEL 6
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(6, 1, 'A', 'السَّلَامُ عَلَيْكُمْ! أُرِيدُ أَنْ أَشْتَرِيَ قَمِيصًا', 'Assalamu''alaikum! Uriidu an asytariya qomiishon', 'Assalamualaikum! Saya ingin membeli baju'),
(6, 2, 'B', 'وَعَلَيْكُمُ السَّلَامُ! أَهْلًا وَسَهْلًا. أَيَّ لَوْنٍ تُرِيدُ ؟', 'Wa''alaikumussalam! Ahlan wa sahlan. Ayya launin turiid?', 'Waalaikumsalam! Selamat datang. Warna apa yang kamu inginkan?'),
(6, 3, 'A', 'أُرِيدُ قَمِيصًا أَزْرَقَ. كَمْ ثَمَنُهُ ؟', 'Uriidu qomiishon azroqo. Kam tsamanuhu?', 'Saya ingin baju biru. Berapa harganya?'),
(6, 4, 'B', 'ثَمَنُهُ خَمْسُونَ أَلْفًا', 'Tsamanuhu khamsuuna alfan', 'Harganya lima puluh ribu'),
(6, 5, 'A', 'غَالٍ جِدًّا! هَلْ مُمْكِنٌ أَرْخَصُ ؟', 'Ghoolinجiddan! Hal yumkinun arkhosh?', 'Mahal sekali! Bisa lebih murah?'),
(6, 6, 'B', 'حَسَنًا، أَرْبَعُونَ أَلْفًا. هَذَا رَخِيصٌ جِدًّا', 'Hasanan, arba''uuna alfan. Haadzaa rokhiishun jiddan', 'Baiklah, empat puluh ribu. Ini sudah sangat murah'),
(6, 7, 'A', 'طَيِّبٌ! وَأُرِيدُ أَيْضًا سِرْوَالًا أَسْوَدَ', 'Thoyyib! Wa uriidu aidhan sirwaalan aswada', 'Baik! Dan saya juga ingin celana hitam'),
(6, 8, 'B', 'السِّرْوَالُ ثَمَنُهُ سِتُّونَ أَلْفًا', 'As-sirwaalu tsamanuhu sittuuna alfan', 'Celana harganya enam puluh ribu'),
(6, 9, 'A', 'حَسَنًا، آخُذُ القَمِيصَ وَالسِّرْوَالَ. كَمِ المَجْمُوعُ ؟', 'Hasanan, aakhudzu al-qomiisha was-sirwaala. Kamil majmuu''u?', 'Baik, saya ambil baju dan celana. Berapa totalnya?'),
(6, 10, 'B', 'المَجْمُوعُ مِئَةُ أَلْفٍ. شُكْرًا لَكَ!', 'Al-majmuu''u mi-atu alfin. Syukran laka!', 'Totalnya seratus ribu. Terima kasih!');

-- UJIAN LEVEL 6 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Pasar"?', 'Dukkaanun', 'Suuqun', 'Math''amun', 'Maktabatun', 'b'),
(6, 'pilihan_ganda', 'Kata "غَالٍ" (Ghoolin) artinya ...', 'Murah', 'Mahal', 'Bagus', 'Jelek', 'b'),
(6, 'pilihan_ganda', '"كَمْ ثَمَنُهُ ؟" artinya ...', 'Apa namanya?', 'Di mana tempatnya?', 'Berapa harganya?', 'Berapa jumlahnya?', 'c'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Membeli"?', 'Yabii''u', 'Yasytarii', 'Yuhibbu', 'Yusaafiru', 'b'),
(6, 'pilihan_ganda', '"أَزْرَقُ" (Azroqu) artinya ...', 'Merah', 'Hijau', 'Biru', 'Hitam', 'c'),
(6, 'pilihan_ganda', 'Kata "رَخِيصٌ" (Rokhiishun) berarti ...', 'Mahal', 'Murah', 'Bagus', 'Besar', 'b'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Sepatu"?', 'Qomiishun', 'Sirwaalun', 'Malaabisu', 'Hidzaa-un', 'd'),
(6, 'pilihan_ganda', '"نُقُودٌ" (Nuquudun) berarti ...', 'Harga', 'Uang', 'Pasar', 'Toko', 'b'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Hitam"?', 'Ahmaru', 'Abyadhu', 'Aswadu', 'Azroqu', 'c'),
(6, 'pilihan_ganda', '"يَبِيعُ" (Yabii''u) artinya ...', 'Membeli', 'Menjual', 'Membawa', 'Memakai', 'b'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Celana"?', 'Qomiishun', 'Hidzaa-un', 'Sirwaalun', 'Malaabisu', 'c'),
(6, 'pilihan_ganda', '"أَحْمَرُ" (Ahmaru) artinya ...', 'Biru', 'Hijau', 'Merah', 'Putih', 'c'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Putih"?', 'Aswadu', 'Abyadhu', 'Akhdoru', 'Azroqu', 'b'),
(6, 'pilihan_ganda', 'Kata "دُكَّانٌ" (Dukkaanun) berarti ...', 'Pasar', 'Restoran', 'Toko', 'Mall', 'c'),
(6, 'pilihan_ganda', '"أَخْضَرُ" (Akhdoru) artinya ...', 'Merah', 'Biru', 'Hijau', 'Kuning', 'c'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Baju / Kemeja"?', 'Sirwaalun', 'Qomiishun', 'Hidzaa-un', 'Malaabisu', 'b'),
(6, 'pilihan_ganda', '"ثَمَنٌ" (Tsamanun) berarti ...', 'Jumlah', 'Harga', 'Uang', 'Diskon', 'b'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Pakaian"?', 'Qomiishun', 'Malaabisu', 'Sirwaalun', 'Hidzaa-un', 'b'),
(6, 'pilihan_ganda', '"هَذَا" (Haadzaa) digunakan untuk ...', 'Kata tunjuk perempuan', 'Kata tunjuk laki-laki', 'Kata ganti orang', 'Kata tanya', 'b'),
(6, 'pilihan_ganda', 'Apa bahasa Arab dari "Berapa"?', 'Maadzaa', 'Ayna', 'Kam', 'Man', 'c');

-- =====================================================
-- 🟣 LEVEL 7: PERJALANAN DAN WISATA
-- =====================================================

-- MUFRODAT LEVEL 7 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(7, 'سَفَرٌ', 'Safarun', 'Perjalanan'),
(7, 'مَطَارٌ', 'Mathoorun', 'Bandara'),
(7, 'فُنْدُقٌ', 'Funduqun', 'Hotel'),
(7, 'تَذْكِرَةٌ', 'Tadzkirotun', 'Tiket'),
(7, 'طَائِرَةٌ', 'Thoo-irotun', 'Pesawat'),
(7, 'قِطَارٌ', 'Qithoorun', 'Kereta Api'),
(7, 'سَيَّارَةٌ', 'Sayyaarotun', 'Mobil'),
(7, 'حَافِلَةٌ', 'Haafilatun', 'Bus'),
(7, 'خَرِيطَةٌ', 'Khoriithotun', 'Peta'),
(7, 'جَوَازُ سَفَرٍ', 'Jawaazu safarin', 'Paspor'),
(7, 'بَحْرٌ', 'Bahrun', 'Laut'),
(7, 'جَبَلٌ', 'Jabalun', 'Gunung'),
(7, 'شَاطِئٌ', 'Syaathi-un', 'Pantai'),
(7, 'مَدِينَةٌ', 'Madiinatun', 'Kota'),
(7, 'قَرْيَةٌ', 'Qoryatun', 'Desa'),
(7, 'سِيَاحَةٌ', 'Siyaahatun', 'Wisata / Pariwisata'),
(7, 'سَائِحٌ', 'Saa-ihun', 'Turis / Wisatawan'),
(7, 'مُتْحَفٌ', 'Muthafun', 'Museum'),
(7, 'صُورَةٌ', 'Shuurotun', 'Foto / Gambar'),
(7, 'ذِكْرَى', 'Dzikroo', 'Kenangan / Souvenir');

-- HIWAR LEVEL 7
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(7, 1, 'A', 'يَا حَسَن! هَلْ سَافَرْتَ فِي العُطْلَةِ ؟', 'Ya Hasan! Hal saafarta fil ''uthlati?', 'Hasan! Apakah kamu bepergian saat liburan?'),
(7, 2, 'B', 'نَعَمْ! سَافَرْتُ إِلَى بَالِي بِالطَّائِرَةِ', 'Na''am! Saafartu ilaa Baali bith-thoo-irati', 'Ya! Aku pergi ke Bali naik pesawat'),
(7, 3, 'A', 'رَائِعٌ! كَيْفَ كَانَتِ الرِّحْلَةُ ؟', 'Roo-i''un! Kaifa kaanatir rihlathu?', 'Keren! Bagaimana perjalanannya?'),
(7, 4, 'B', 'كَانَتْ مُمْتَازَةً! ذَهَبْتُ إِلَى الشَّاطِئِ وَالمُتْحَفِ', 'Kaanat mumtaazatan! Dzahabtu ilas syaathi-i wal muthafi', 'Luar biasa! Aku pergi ke pantai dan museum'),
(7, 5, 'A', 'هَلْ أَخَذْتَ صُوَرًا كَثِيرَةً ؟', 'Hal akhadz-ta shuwaron katsiiratan?', 'Apakah kamu mengambil banyak foto?'),
(7, 6, 'B', 'طَبْعًا! أَخَذْتُ صُوَرًا لِلْبَحْرِ وَالجَبَلِ. جَمِيلَةٌ جِدًّا', 'Thob''an! Akhadz-tu shuwaron lil-bahri wal-jabali. Jamiilatan jiddan', 'Tentu! Aku ambil foto laut dan gunung. Sangat indah'),
(7, 7, 'A', 'أَيْنَ سَكَنْتَ ؟ فِي فُنْدُقٍ ؟', 'Ayna sakanta? Fii funduqin?', 'Di mana kamu menginap? Di hotel?'),
(7, 8, 'B', 'نَعَمْ، فِي فُنْدُقٍ قَرِيبٍ مِنَ الشَّاطِئِ', 'Na''am, fii funduqin qoriibin minasy syaathi-i', 'Ya, di hotel dekat pantai'),
(7, 9, 'A', 'أُرِيدُ أَنْ أُسَافِرَ أَيْضًا. هَلْ تَذْكِرَةُ الطَّائِرَةِ غَالِيَةٌ ؟', 'Uriidu an usaafira aidhan. Hal tadzkirotuth thoo-irati ghooliyatun?', 'Aku juga ingin bepergian. Apakah tiket pesawat mahal?'),
(7, 10, 'B', 'لَيْسَتْ غَالِيَةً إِذَا حَجَزْتَ مُبَكِّرًا. سَافِرْ إِنْ شَاءَ اللهُ!', 'Laisat ghooliyatan idzaa hajaz-ta mubakkiran. Saafir insyaa-allah!', 'Tidak mahal kalau pesan lebih awal. Bepergian insya Allah!');

-- UJIAN LEVEL 7 (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Bandara"?', 'Funduqun', 'Mathoorun', 'Muthafun', 'Madiinatun', 'b'),
(7, 'pilihan_ganda', '"فُنْدُقٌ" (Funduqun) berarti ...', 'Restoran', 'Pasar', 'Hotel', 'Museum', 'c'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Pesawat"?', 'Qithoorun', 'Sayyaarotun', 'Haafilatun', 'Thoo-irotun', 'd'),
(7, 'pilihan_ganda', '"شَاطِئٌ" (Syaathi-un) artinya ...', 'Gunung', 'Pantai', 'Laut', 'Danau', 'b'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Tiket"?', 'Khoriithotun', 'Jawaazu safarin', 'Tadzkirotun', 'Shuurotun', 'c'),
(7, 'pilihan_ganda', 'Kata "بَحْرٌ" (Bahrun) berarti ...', 'Pantai', 'Sungai', 'Laut', 'Danau', 'c'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Kereta Api"?', 'Thoo-irotun', 'Qithoorun', 'Haafilatun', 'Sayyaarotun', 'b'),
(7, 'pilihan_ganda', '"جَبَلٌ" (Jabalun) artinya ...', 'Laut', 'Pantai', 'Hutan', 'Gunung', 'd'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Paspor"?', 'Tadzkirotun', 'Khoriithotun', 'Jawaazu safarin', 'Shuurotun', 'c'),
(7, 'pilihan_ganda', '"سَيَّارَةٌ" (Sayyaarotun) berarti ...', 'Bus', 'Kereta', 'Sepeda', 'Mobil', 'd'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Museum"?', 'Funduqun', 'Muthafun', 'Madiinatun', 'Mathoorun', 'b'),
(7, 'pilihan_ganda', '"حَافِلَةٌ" (Haafilatun) artinya ...', 'Mobil', 'Pesawat', 'Bus', 'Kereta', 'c'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Kota"?', 'Qoryatun', 'Madiinatun', 'Suuqun', 'Baitun', 'b'),
(7, 'pilihan_ganda', '"قَرْيَةٌ" (Qoryatun) berarti ...', 'Kota', 'Desa', 'Negara', 'Provinsi', 'b'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Peta"?', 'Shuurotun', 'Tadzkirotun', 'Khoriithotun', 'Dzikroo', 'c'),
(7, 'pilihan_ganda', '"سِيَاحَةٌ" (Siyaahatun) artinya ...', 'Perjalanan', 'Wisata', 'Belanja', 'Olahraga', 'b'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Turis / Wisatawan"?', 'Musaafirun', 'Saa-ihun', 'Thoolibun', 'Muhandisun', 'b'),
(7, 'pilihan_ganda', '"صُورَةٌ" (Shuurotun) berarti ...', 'Peta', 'Tiket', 'Foto / Gambar', 'Kenangan', 'c'),
(7, 'pilihan_ganda', 'Apa bahasa Arab dari "Perjalanan"?', 'Siyaahatun', 'Safarun', 'Rihlatun', 'Hiwaayatun', 'b'),
(7, 'pilihan_ganda', '"ذِكْرَى" (Dzikroo) artinya ...', 'Peta', 'Tiket', 'Foto', 'Kenangan / Souvenir', 'd');

-- =====================================================
-- ⭐ LEVEL 8: CITA-CITA DAN MASA DEPAN (UJIAN AKHIR KOMPREHENSIF)
-- =====================================================

-- MUFRODAT LEVEL 8 (20 kata)
INSERT INTO flashcard_mufrodat (level_id, arab, latin, arti) VALUES
(8, 'طَبِيبٌ', 'Thobiibun', 'Dokter (Laki-laki)'),
(8, 'طَبِيبَةٌ', 'Thobiibatun', 'Dokter (Perempuan)'),
(8, 'مُهَنْدِسٌ', 'Muhandisun', 'Insinyur (Laki-laki)'),
(8, 'مُحَامٍ', 'Muhaamin', 'Pengacara'),
(8, 'صَحَفِيٌّ', 'Shohafiyyun', 'Wartawan'),
(8, 'جَامِعَةٌ', 'Jaami''atun', 'Universitas'),
(8, 'كُلِّيَّةٌ', 'Kulliyyatun', 'Fakultas'),
(8, 'أُرِيدُ أَنْ أَكُونَ ...', 'Uriidu an akuuna ...', 'Saya ingin menjadi ...'),
(8, 'مُسْتَقْبَلٌ', 'Mustaqbalun', 'Masa Depan'),
(8, 'آمَالٌ', 'Aamaalun', 'Cita-cita / Harapan'),
(8, 'شَهَادَةٌ', 'Syahaadatun', 'Ijazah / Sertifikat'),
(8, 'تَخَرَّجَ', 'Takharroja', 'Lulus / Wisuda'),
(8, 'عَالِمٌ', '''Aalimun', 'Ilmuwan / Ulama'),
(8, 'رَائِدُ أَعْمَالٍ', 'Roo-idu a''maalin', 'Pengusaha'),
(8, 'مُعَلِّمٌ', 'Mu''allimun', 'Pengajar / Guru'),
(8, 'دِرَاسَةٌ', 'Diraasatun', 'Studi / Belajar'),
(8, 'نَجَاحٌ', 'Najaahun', 'Keberhasilan / Sukses'),
(8, 'اِجْتِهَادٌ', 'Ijtihaadun', 'Kerja Keras / Usaha'),
(8, 'حُلْمٌ', 'Hulmun', 'Mimpi / Impian'),
(8, 'إِنْ شَاءَ اللهُ', 'Insyaa-allah', 'Jika Allah berkehendak');

-- HIWAR LEVEL 8
INSERT INTO hiwar_chat (level_id, urutan, karakter, arab, latin, arti) VALUES
(8, 1, 'A', 'يَا مُحَمَّد! نَحْنُ الْآنَ فِي الصَّفِّ الثَّالِثِ عَشَرَ. مَاذَا تُرِيدُ أَنْ تَكُونَ بَعْدَ التَّخَرُّجِ ؟', 'Ya Muhammad! Nahnu al-aana fish shoffits tsaalitsa ''asyaro. Maadzaa turiidu an takuuna ba''dat takharruji?', 'Muhammad! Kita sekarang sudah kelas XII. Apa yang ingin kamu jadi setelah lulus?'),
(8, 2, 'B', 'أُرِيدُ أَنْ أَكُونَ طَبِيبًا إِنْ شَاءَ اللهُ. سَأَدْخُلُ كُلِّيَّةَ الطِّبِّ فِي الجَامِعَةِ', 'Uriidu an akuuna thobiiban insyaa-allah. Sa-adkhulu kulliyyatoth thibbi fil jaami''ati', 'Aku ingin menjadi dokter insya Allah. Aku akan masuk Fakultas Kedokteran di Universitas'),
(8, 3, 'A', 'مَاشَاءَ اللهُ! لِمَاذَا تُرِيدُ أَنْ تَكُونَ طَبِيبًا ؟', 'Maasyaa-allah! Limaadzaa turiidu an takuuna thobiiban?', 'Masya Allah! Kenapa kamu ingin menjadi dokter?'),
(8, 4, 'B', 'لِأَنَّنِي أُرِيدُ أَنْ أُسَاعِدَ النَّاسَ وَأُعَالِجَ المَرْضَى. وَأَنْتَ يَا عَبْدُ اللهِ ؟', 'Li-annanii uriidu an usaa''idannaasa wa u''aalijal mardhoo. Wa anta ya Abdullah?', 'Karena aku ingin membantu orang dan mengobati orang sakit. Dan kamu, Abdullah?'),
(8, 5, 'A', 'أُرِيدُ أَنْ أَكُونَ مُهَنْدِسًا. أُحِبُّ الرِّيَاضِيَّاتِ وَالتَّصْمِيمَ', 'Uriidu an akuuna muhandisan. Uhibbur riyaadhiyyaata wat tasmiima', 'Aku ingin menjadi insinyur. Aku suka matematika dan desain'),
(8, 6, 'B', 'فِكْرَةٌ رَائِعَةٌ! فِي أَيِّ جَامِعَةٍ تُرِيدُ أَنْ تَدْرُسَ ؟', 'Fikratun roo-i''atun! Fii ayyi jaami''atin turiidu an tadrusa?', 'Ide hebat! Di universitas mana kamu ingin belajar?'),
(8, 7, 'A', 'أُرِيدُ أَنْ أَدْرُسَ فِي جَامِعَةِ بَانْدُونْج. وَبَعْدَ ذَلِكَ أُرِيدُ أَنْ أُصْبِحَ رَائِدَ أَعْمَالٍ', 'Uriidu an adrusa fii jaami''ati Baanduunj. Wa ba''da dzaalika uriidu an ushbiha roo-ida a''maalin', 'Aku ingin belajar di Universitas Bandung. Dan setelah itu aku ingin menjadi pengusaha'),
(8, 8, 'B', 'يَجِبُ عَلَيْنَا الاِجْتِهَادُ فِي الدِّرَاسَةِ لِتَحْقِيقِ أَحْلَامِنَا', 'Yajibu ''alaynal ijtihaadu fid diraasati litahqiiqi ahlaamina', 'Kita harus kerja keras dalam belajar untuk mewujudkan mimpi kita'),
(8, 9, 'A', 'صَحِيحٌ! النَّجَاحُ يَحْتَاجُ إِلَى اِجْتِهَادٍ وَدُعَاءٍ', 'Shohiihun! An-najaaahu yahtaaju ilaa ijtihaaadin wa du''aa-in', 'Benar! Kesuksesan butuh kerja keras dan doa'),
(8, 10, 'B', 'إِنْ شَاءَ اللهُ نَنْجَحُ جَمِيعًا! بِالتَّوْفِيقِ يَا عَبْدُ اللهِ!', 'Insyaa-allah nanjahu jamii''an! Bit taufiiq ya Abdullah!', 'Insya Allah kita semua berhasil! Semoga sukses ya Abdullah!');

-- UJIAN LEVEL 8 - KOMPREHENSIF GABUNGAN SEMUA LEVEL (20 soal)
INSERT INTO ujian_soal (level_id, tipe_soal, pertanyaan, opsi_a, opsi_b, opsi_c, opsi_d, jawaban_benar) VALUES
(8, 'pilihan_ganda', 'Apa bahasa Arab dari "Saya ingin menjadi dokter" ?', 'Uriidu kitaaban', 'Uriidu an akuuna thobiiban', 'Ana thobiibun', 'Uriidu an adz-haba', 'b'),
(8, 'pilihan_ganda', 'Kata "جَامِعَةٌ" (Jaami''atun) artinya ...', 'Sekolah Dasar', 'Madrasah', 'Universitas', 'Perpustakaan', 'c'),
(8, 'pilihan_ganda', '[Level 1] Apa arti "كَيْفَ حَالُكَ" ?', 'Siapa namamu?', 'Bagaimana kabarmu?', 'Dari mana kamu?', 'Mau ke mana?', 'b'),
(8, 'pilihan_ganda', '[Level 2] Kata "سَبُّورَةٌ" berarti ...', 'Penghapus', 'Papan Tulis', 'Buku Tulis', 'Tas', 'b'),
(8, 'pilihan_ganda', '[Level 3] Apa bahasa Arab dari "Dapur" ?', 'Ghurfatun naum', 'Hammaaumun', 'Hadiiqatun', 'Mathbakhun', 'd'),
(8, 'pilihan_ganda', '[Level 4] Apa arti "نِهَايَةُ الأُسْبُوعِ" ?', 'Awal Minggu', 'Akhir Pekan', 'Hari Libur', 'Setiap Hari', 'b'),
(8, 'pilihan_ganda', '[Level 5] Apa bahasa Arab dari "Nasi"?', 'Khubzun', 'Aruzzun', 'Lahmun', 'Samakun', 'b'),
(8, 'pilihan_ganda', '[Level 6] "كَمْ ثَمَنُهُ ?" artinya ...', 'Apa namanya?', 'Di mana?', 'Berapa harganya?', 'Berapa banyak?', 'c'),
(8, 'pilihan_ganda', '[Level 7] Apa bahasa Arab dari "Bandara"?', 'Funduqun', 'Mathoorun', 'Muthafun', 'Madiinatun', 'b'),
(8, 'pilihan_ganda', 'Apa bahasa Arab dari "Insinyur" ?', 'Thobiibun', 'Mu''allimun', 'Muhandisun', 'Muhaamin', 'c'),
(8, 'pilihan_ganda', 'Apa arti dari "اِجْتِهَادٌ" (Ijtihaadun) ?', 'Kemalasan', 'Kerja Keras / Usaha', 'Keberuntungan', 'Kecerdasan', 'b'),
(8, 'pilihan_ganda', 'Kata "شَهَادَةٌ" (Syahaadatun) berarti ...', 'Sertifikat / Ijazah', 'Universitas', 'Fakultas', 'Masa Depan', 'a'),
(8, 'pilihan_ganda', 'Apa makna dari "إِنْ شَاءَ اللهُ" ?', 'Segala puji bagi Allah', 'Maha Suci Allah', 'Jika Allah berkehendak', 'Tidak ada daya selain Allah', 'c'),
(8, 'pilihan_ganda', '[Level 5] "جَائِعٌ" artinya ...', 'Kenyang', 'Lapar', 'Haus', 'Capek', 'b'),
(8, 'pilihan_ganda', '[Level 6] Apa bahasa Arab dari "Murah"?', 'Ghoolin', 'Rokhiishun', 'Jamiilun', 'Kabiirun', 'b'),
(8, 'pilihan_ganda', '[Level 7] "طَائِرَةٌ" (Thoo-irotun) berarti ...', 'Bus', 'Kereta', 'Kapal', 'Pesawat', 'd'),
(8, 'pilihan_ganda', 'Apa bahasa Arab dari "Pengusaha"?', 'Thobiibun', 'Roo-idu a''maalin', 'Muhandisun', 'Mu''allimun', 'b'),
(8, 'pilihan_ganda', '"حُلْمٌ" (Hulmun) artinya ...', 'Harapan', 'Mimpi / Impian', 'Usaha', 'Keberhasilan', 'b'),
(8, 'pilihan_ganda', 'Apa bahasa Arab dari "Masa Depan"?', 'Aamaalun', 'Najaahun', 'Mustaqbalun', 'Diraasatun', 'c'),
(8, 'pilihan_ganda', '"نَجَاحٌ" (Najaahun) berarti ...', 'Kegagalan', 'Keberhasilan / Sukses', 'Kerja Keras', 'Cita-cita', 'b');

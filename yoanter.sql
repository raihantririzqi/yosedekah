-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2024 at 09:30 AM
-- Server version: 8.0.30
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yoanter`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_akun`
--

CREATE TABLE `acc_akun` (
  `id` int NOT NULL,
  `nama_akun` varchar(100) NOT NULL,
  `kode_akun` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `acc_akun`
--

INSERT INTO `acc_akun` (`id`, `nama_akun`, `kode_akun`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Bahan Bakar', 'BBM', '2024-03-08 12:16:36', '2024-03-08 12:16:36', NULL),
(15, 'Alat Kantor', 'AKT', '2024-03-08 13:26:22', '2024-03-08 13:26:22', NULL),
(16, 'Kas Masuk', 'KMSK', '2024-03-08 14:09:29', '2024-03-08 14:09:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `acc_operasional`
--

CREATE TABLE `acc_operasional` (
  `id` int NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_akun` int NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `jumlah` int NOT NULL,
  `tipe` enum('debit','kredit') NOT NULL,
  `kas_masuk` int NOT NULL DEFAULT '0',
  `kas_keluar` int NOT NULL DEFAULT '0',
  `saldo` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `acc_operasional`
--

INSERT INTO `acc_operasional` (`id`, `tanggal`, `id_akun`, `tujuan`, `jumlah`, `tipe`, `kas_masuk`, `kas_keluar`, `saldo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, '2024-03-08 21:29:21', 16, 'Kas Masuk', 1, 'kredit', 100000, 0, 100000, '2024-03-08 14:29:21', '2024-03-08 14:29:21', NULL),
(9, '2024-03-08 21:29:58', 14, 'beli bahan bakar', 1, 'debit', 0, 20000, 80000, '2024-03-08 14:29:58', '2024-03-08 14:29:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'staff',
  `grup` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `kota` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pusat',
  `pass_laravel` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_name`, `password`, `email`, `image`, `level`, `grup`, `kota`, `pass_laravel`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '5b2de813b23de82181467ebb0b9b2bea23f67ce7', 'admin@gmail.com', '8a05fddeb97089ef6b909034eb02643a.jpg', 'admin', '1', 'pusat', '$2y$12$vz37P/Zo7LMw81F/kzIZ3OJsbNpCwzQIkM7ACWDZty4imz7BCSgkO', NULL, NULL, NULL),
(3, 'newstaff', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'staff@gojasa.com', '18de9e01948270838e27abeddfc885d4.jpg', 'staff', '1', 'pusat', '0', NULL, NULL, NULL),
(5, 'admin', '5b2de813b23de82181467ebb0b9b2bea23f67ce7', 'admin@gmail.com', '8a05fddeb97089ef6b909034eb02643a.jpg', 'admin', '1', 'pusat', '0', NULL, NULL, NULL),
(6, 'newstaff', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'staff@gojasa.com', '18de9e01948270838e27abeddfc885d4.jpg', 'staff', '1', 'pusat', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `akses`
--

CREATE TABLE `akses` (
  `id` int NOT NULL,
  `perizinan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `akses`
--

INSERT INTO `akses` (`id`, `perizinan`, `kode`, `grup`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'hapus', 'dashboard_hapus', '1', NULL, NULL, NULL),
(2, 'batalkan', 'dashboard_batal', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `no` int NOT NULL,
  `iduser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jalan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `alamat`
--

INSERT INTO `alamat` (`no`, `iduser`, `nama`, `jalan`, `alamat`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'P1946144648', 'Mall Surya', 'Surya Supermarket Jatibarang', 'Jl. Mayor Dasuki No.50, Jatibarang, Kec. Jatibarang, Kabupaten Indramayu, Jawa Barat 45273, Indonesia', '-6.4667901', '108.2979564', NULL, NULL, NULL),
(2, 'P1946144648', 'Rumah', 'Maswend', 'JL.Bypass mawar Motor Ujungaris - Ds.Ujungaris, G7RP+X99, Rt04/Rw03, Kec. Widasari, Kabupaten Indramayu, Jawa Barat 45271, Indonesia', '-6.457590799999999', '108.2859709', NULL, NULL, NULL),
(3, 'P1946144648', 'Kantor', 'Jatibarang', 'G8F7+QCQ, Jatibarang, Kec. Jatibarang, Kabupaten Indramayu, Jawa Barat 45273, Indonesia', '-6.4755341', '108.3136115', NULL, NULL, NULL),
(4, 'P1946144648', 'Toko Surya', 'Surya Supermarket Jatibarang', 'Jl. Mayor Dasuki No.50, Jatibarang, Kec. Jatibarang, Kabupaten Indramayu, Jawa Barat 45273, Indonesia', '-6.4667901', '108.2979564', NULL, NULL, NULL),
(5, 'P1946144648', 'Bank BRI Jtb', 'BRI KC Jatibarang', 'Jl. Siliwangi No.3, Jatibarang, Kec. Jatibarang, Kabupaten Indramayu, Jawa Barat 45273, Indonesia', '-6.4744117', '108.3036562', NULL, NULL, NULL),
(6, 'P25059', 'Surya Mall', 'Surya Supermarket Jatibarang', 'Jl. Mayor Dasuki No.50, Jatibarang, Kec. Jatibarang, Kabupaten Indramayu, Jawa Barat 45273, Indonesia', '-6.4668647', '108.2984882', NULL, NULL, NULL),
(7, 'P25059', 'Rumah', 'Maswend', 'JL.Bypass mawar Motor Ujungaris - Ds.Ujungaris, G7RP+X99, Rt04/Rw03, Kec. Widasari, Kabupaten Indramayu, Jawa Barat 45271, Indonesia', '-6.457590799999999', '108.2859709', NULL, NULL, NULL),
(8, 'P95972', 'Rumah', 'Maswend', 'JL.Bypass mawar Motor Ujungaris - Ds.Ujungaris, G7RP+X99, Rt04/Rw03, Kec. Widasari, Kabupaten Indramayu, Jawa Barat 45271, Indonesia', '-6.457590799999999', '108.2859709', NULL, NULL, NULL),
(9, 'P95972', 'Surya Mall', 'Surya Supermarket Jatibarang', 'Jl. Mayor Dasuki No.50, Jatibarang, Kec. Jatibarang, Kabupaten Indramayu, Jawa Barat 45273, Indonesia', '-6.4668647', '108.2984882', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int NOT NULL,
  `app_email` varchar(500) NOT NULL,
  `app_contact` varchar(500) NOT NULL,
  `app_website` varchar(500) NOT NULL,
  `app_description` text NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `app_aboutus` text NOT NULL,
  `email_subject` varchar(500) NOT NULL,
  `email_subject_confirm` varchar(500) NOT NULL,
  `email_text1` text NOT NULL,
  `email_text2` text NOT NULL,
  `email_text3` text NOT NULL,
  `email_text4` text NOT NULL,
  `app_logo` varchar(500) NOT NULL,
  `smtp_host` varchar(500) NOT NULL,
  `smtp_port` varchar(500) NOT NULL,
  `smtp_username` varchar(500) NOT NULL,
  `smtp_password` varchar(500) NOT NULL,
  `smtp_from` varchar(500) NOT NULL,
  `smtp_secure` varchar(250) NOT NULL,
  `app_name` varchar(500) NOT NULL,
  `app_address` text NOT NULL,
  `app_linkgoogle` varchar(500) NOT NULL,
  `app_currency` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `app_currency_text` varchar(10) NOT NULL,
  `geocode_key` varchar(255) DEFAULT NULL,
  `map_key` varchar(250) NOT NULL,
  `fcm_key` varchar(250) NOT NULL,
  `duitku_merchant` varchar(255) DEFAULT NULL,
  `duitku_key` varchar(255) DEFAULT NULL,
  `duitku_mode` int DEFAULT '0',
  `duitku_status` int DEFAULT '1',
  `maintenance` varchar(1) DEFAULT '0',
  `isotp` int NOT NULL,
  `jasaapp` varchar(255) DEFAULT '0',
  `background` varchar(255) DEFAULT '#4c84ff',
  `digi_user` varchar(255) DEFAULT NULL,
  `digi_api` varchar(255) DEFAULT NULL,
  `digi_mode` varchar(255) DEFAULT NULL,
  `digi_status` varchar(255) DEFAULT NULL,
  `upreff` varchar(255) DEFAULT '100',
  `rewardreff` varchar(255) DEFAULT '100',
  `os_appid` varchar(255) DEFAULT '1234',
  `os_restapi` varchar(255) DEFAULT '1234',
  `os_channel` varchar(255) DEFAULT '1234',
  `os_template` varchar(255) DEFAULT '1234',
  `os_channel_chat` varchar(255) DEFAULT '1234',
  `os_template_chat` varchar(255) DEFAULT '1234',
  `mode` varchar(255) DEFAULT 'Firebase',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `app_email`, `app_contact`, `app_website`, `app_description`, `app_privacy_policy`, `app_aboutus`, `email_subject`, `email_subject_confirm`, `email_text1`, `email_text2`, `email_text3`, `email_text4`, `app_logo`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smtp_from`, `smtp_secure`, `app_name`, `app_address`, `app_linkgoogle`, `app_currency`, `app_currency_text`, `geocode_key`, `map_key`, `fcm_key`, `duitku_merchant`, `duitku_key`, `duitku_mode`, `duitku_status`, `maintenance`, `isotp`, `jasaapp`, `background`, `digi_user`, `digi_api`, `digi_mode`, `digi_status`, `upreff`, `rewardreff`, `os_appid`, `os_restapi`, `os_channel`, `os_template`, `os_channel_chat`, `os_template_chat`, `mode`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin@yoanter.com', '0812910810182', 'https://yoanter.com', 'Satu Perjalanan Penuh Kebaikan', '<p class=\"MsoNormal\">Kebijakan Privasi berikut ini menjelaskan bagaimana kami mengumpulkan, menggunakan, memindahkan, mengungkapkan dan melindungi informasi pribadi anda yang dapat diidentifikasi yang diperoleh melalui Aplikasi YOANTER kami (sebagaimana didefinisikan di bawah). Mohon anda membaca Kebijakan ini dengan seksama untuk memastikan bahwa anda memahami bagaimana ketentuan Kebijakan ini kami berlakukan. Kebijakan ini disertakan sebagai bagian dari Ketentuan Penggunaan kami. Kebijakan ini mencakup hal-hal sebagai berikut:<br><br>Definisi<br>Informasi yang kami kumpulkan<br>Penggunaan informasi yang kami kumpulkan<br>Pemberian informasi yang kami kumpulkan<br>Penahanan informasi yang kami kumpulkan<br>Keamanan<br>Perubahan atas Kebijakan Privasi ini<br>Lain-lain<br>Pengakuan dan persetujuan<br>Berhenti menerima e-mail<br>Cara untuk menghubungi kami<br><br>Penggunaan anda atas aplikasi dan layanan kami tunduk pada Ketentuan Penggunaan dan Kebijakan ini dan mengindikasikan persetujuan anda terhadap Ketentuan Penggunaan dan Kebijakan tersebut.<br><br>Definisi<br>“Kami” berarti PT Yosi Digital Literasi Indonesia, suatu perusahaan yang didirikan berdasarkan hukum Negara Republik Indonesia.<br>“Aplikasi” berarti suatu aplikasi piranti lunak yang telah kami kembangkan yang merupakan suatu sarana untuk menemukan Layanan yang disediakan oleh pihak ketiga.<br>“Penyedia Layanan” berarti suatu pihak ketiga pengendara sepeda motor (pengemudi ojek) yang menyediakan Layanan melalui Aplikasi.<br>“Layanan” berarti layanan transportasi dengan menggunakan sepeda motor yang ditawarkan oleh Penyedia Layanan melalui Aplikasi yang dapat mencakup (i) layanan kurir instan, (ii) transportasi, (iii) pengiriman makanan dan (iv) pembelanjaan pribadi.<br>“Informasi Pribadi” berarti informasi mengenai anda yang secara pribadi dapat diidentifikasi yang dikumpulkan melalui Aplikasi, seperti nama, alamat, tanggal lahir, pekerjaan, nomor telepon, alamat surat elektronik (e-mail) anda dan/atau sejenisnya, dan informasi lain yang mungkin dapat mengidentifikasi orang tertentu yang sedang menggunakan Aplikasi.<br>“Situs web” berarti situs web kami di <a href=\"https://www.yoanter.com/\" target=\"_blank\" rel=\"noopener\">https://www.yoanter.com</a><br>Informasi yang Kami Kumpulkan<br>Kami mengumpulkan Informasi Pribadi tertentu dari anda agar Aplikasi dapat menemukan Layanan dari Penyedia Layanan. Anda akan langsung memberikan Informasi Pribadi (sebagai contoh, saat anda mendaftar) dan beberapa informasi akan secara otomatis dikumpulkan ketika anda menggunakan Aplikasi.<br>Ketika anda mengunjungi Situs web kami, administrator situs web kami akan memproses data teknis seperti alamat IP anda, halaman web yang pernah anda kunjungi, browser internet yang anda gunakan, halaman web yang sebelumnya /selanjutnya anda kunjungi dan durasi setiap kunjungan/sesi yang memungkinkan kami untuk mengirimkan fungsi-fungsi Situs web. Sebagai tambahan, dalam beberapa hal, browser dapat menyarankan anda agar geo-location anda memungkinkan kami untuk memberikan anda suatu pengalaman yang lebih baik. Dengan data teknis ini administrator-administrator Situs web kami dapat mengelola Situs web, misalnya dengan menyelesaikan kesulitan-kesulitan teknis atau memperbaiki kemampuan untuk dapat diaksesnya bagian-baigan tertentu dari Situs web. Dengan cara ini, kami dapat memastikan bahwa Anda dapat (terus) menemukan informasi pada Situs web dengan cara yang cepat dan sederhana.<br>Informasi yang Anda berikan secara langsung.<br>Pada saat mendaftar pada Aplikasi, anda akan memberikan kepada kami alamat surat elektronik / surel (email), nama, nomor telepon, dan sandi akun anda.<br>Ketika anda menggunakan Aplikasi untuk menemukan suatu layanan, anda memberikan informasi pada kami, yaitu lokasi dan tujuan anda. Anda juga memberikan informasi kepada kami mengenai barang yang anda kirim/antar dan/atau beli dan biaya pembelanjaan anda ketika anda menggunakan layanan kurir instan atau pembelanjaan pribadi. Ketika anda menggunakan Aplikasi kami, kami juga akan memproses data teknis anda seperti alamat IP, Identitas (ID) Perangkat atau alamat MAC, dan informasi mengenai pabrikan, model, dan sistem operasi dari perangkat bergerak/mobile device anda. Kami menggunakan data ini untuk memungkinkan kami untuk mengirimkan fungsi-fungsi dari Aplikasi, menyelesaikan kesulitan-kesulitan teknis, menyediakan bagi anda versi Aplikasi yang benar dan terkini dan untuk meningkatkan fungsi Aplikasi.<br>Kami akan meminta nomor telepon seseorang yang dapat dihubungi oleh Penyedia Layanan untuk melengkapi pesanan anda ketika anda menggunakan Aplikasi untuk menemukan suatu layanan kurir instan. Anda harus mendapatkan persetujuan terlebih dahulu dari orang yang nomor teleponnya anda berikan pada kami untuk memberikan nomor teleponnya pada kami dan untuk kami memberikan nomor telepon tersebut kepada Penyedia Layanan.<br>Ketika Anda mengisi ulang (TOP UP) YoAnter Credit anda, kami akan mengumpulkan informasi seperti nama bank dimana rekening anda dibuka, nama pemegang rekening, dan jumlah yang anda transfer untuk pengisian ulang (TOP UP).<br>Anda dapat memberikan kode rujukan (referral code) kepada teman anda melalui Aplikasi, dimana, kami hanya akan menyiapkan suatu pesan untuk anda kirimkan atau anda terbitkan melalui penyedia media sosial atau surel anda. Anda dapat mengubah pesan yang telah kami siapkan sebelum anda mengirimkannya. Kami tidak akan mengumpulkan data teman anda.<br>Informasi yang kami kumpulkan ketika anda menggunakan Aplikasi.<br>Ketika anda menggunakan Aplikasi melalui perangkat bergerak / mobile device anda, kami akan melacak dan mengumpulkan informasi geo-location secara real-time. Kami menggunakan informasi ini untuk memungkinkan anda untuk melihat Penyedia Layanan yang berada di daerah anda yang dekat dengan lokasi anda, mengatur lokasi penjemputan dan mengirimkan informasinya kepada Penyedia Layanan yang diminta, dan untuk melihat Penyedia Layanan yang diminta mendekat di suatu peta secara real-time. Kami juga dapat menggunakan informasi geo-location secara real-time ini untuk memberikan bantuan, menyelesaikan kesulitan-kesulitan teknis atau usaha yang mungkin timbul pada saat anda menggunakan Aplikasi. Anda dapat mematikan informasi pelacak geo-location pada tingkatan perangkat untuk sementara waktu. Perangkat bergerak/mobile anda akan memberitahukan anda ketika geo-location anda dilacak dengan menampilkan simbol panah GPS.<br>Kami juga melacak dan mengumpulkan informasi geo-location Penyedia Layanan. Ini berarti bahwa kami juga mengumpulkan informasi ketika anda bepergian dengan Penyedia Layanan. Kami juga akan menggunakan informasi geo-location Penyedia Layanan dalam bentuk tanpa nama dan keseluruhan untuk mendapatkan informasi statistic dan informasi pengelolaan dan untuk menyediakan untuk anda fungsi Aplikasi yang ditingkatkan.<br>Penggunaan Informasi yang Kami Kumpulkan<br>Kami menggunakan surel, nama, nomor telepon, dan sandi akun anda untuk memverifikasi kepemilikan anda atas suatu akun, untuk berkomunikasi dengan anda sehubungan dengan pesanan anda dan untuk memberikan anda informasi mengenai Aplikasi. Kami juga dapat menggunakan nama, surel, dan nomor telepon anda untuk mengirimkan pesan, pembaharuan yang bersifat umum atas Aplikasi, penawaran-penawaran khusus atau promosi-promosi. Kami juga akan mengirimkan surel kepada anda yang meminta anda untuk berlangganan Daftar Surat Menyurat (Mailing List) kami. Anda dapat setiap saat memilih untuk tidak menerima informasi mengenai pembahrauan ini.<br>Kami menggunakan geo-location dan tujuan anda untuk menemukan Penyedia Layanan yang berada di sekitar anda, untuk membantu Penyedia Layanan untuk memperhitungkan biaya dan untuk menganalisa pola penggunaan Aplikasi untuk meningkatkan kinerja Aplikasi.<br>Kami menggunakan informasi seperti barang-barang yang anda kirimkan/diantarkan dan/atau beli dan biaya pembelanjaan anda untuk menentukan apakah Aplikasi dapat menerima pesanan anda berdasarkan Ketentuan Penggunaan.<br>Kami menggunakan informasi seperti nama bank dimana rekening anda dibuat, nama dimana rekening tersebut disimpan dan jumlah yang ditransfer untuk isi ulang (TOP UP) untuk memastikan pembayaran yang anda lakukan untuk YoAnter Credits.<br>Kami menggunakan Informasi Pribadi dalam bentuk tanpa nama dan secara keseluruhan untuk memantau lebih dekat fitur-fitur mana dari Layanan yang paling sering digunakan, untuk menganalisa pola penggunaan dan untuk menentukan apakah kami akan menawarkan atau fokus pada Layanan kami. Anda dengan ini setuju bahwa data anda akan digunakan oleh pemrosesan data internal kami untuk memberikan Layanan yang lebih baik kepada anda.<br>Pemberian Informasi yang Kami Kumpulkan<br>Setelah menerima pesanan anda, kami akan memberikan informasi seperti nama, nomor telepon, lokasi, tujuan, geo-location, barang yang akan dikirimkan/diantar atau dibeli dan/atau biaya pembelanjaan anda kepada Penyedia Layanan yang menerima permintaan anda atas Layanan. Informasi ini dibutuhkan oleh Penyedia Layanan untuk menghubungi anda, dan/atau menemukan anda dan/atau memenuhi pesanan anda.<br>Kami juga akan memberikan nomor telepon dari pihak yang dapat dihubungi yang telah anda berikan kepada kami kepada Penyedia Layanan ketika anda menggunakan Aplikasi untuk menemukan layanan kurir instan.<br>Anda dengan ini setuju dan memberikan wewenang pada kami untuk memberikan Informasi Pribadi anda kepada Penyedia Layanan sebagai suatu bagian dari ketentuan Layanan. Walaupun informasi pribadi anda secara otomatis akan dihapus dari perangkat bergerak milik Penyedia Layanan setelah anda menggunakan Layanan, terdapat kemungkinan dimana Penyedia Layanan dapat menyimpan data anda di perangkat mereka dengan cara apapun. Kami tidak bertanggung jawab atas penyimpanan data dengan cara tersebut dan anda setuju untuk membela, memberikan ganti rugi dan membebaskan kami dan kami tidak akan bertanggung jawab atas segala penyalahgunaan Informasi Pribadi anda oleh Penyedia Layanan setelah berakhirnya Layanan yang diberikan.<br>Kami dapat mempekerjakan perusahaan-perusahaan dan orang perorangan pihak ketiga untuk memfasilitasi atau memberikan Aplikasi dan layanan-layanan tertentu atas nama kami, untuk memberikan bantuan konsumen, memberikan informasi geo-location kepada Penyedia Layanan kami, untuk melaksanakan layanan-layanan terkait dengan Situs web (misalnya tanpa pembatasan, layanan pemeliharaan, pengelolaan database, analisis web dan penyempurnaan fitur-fitur Situs web) atau untuk membantu kami dalam menganalisa bagaimana Layanan kami digunakan atau untuk penasihat profesional dan auditor eksternal kami, termasuk penasihat hukum, penasihat keuangan, dan konsultan-konsultan. Para pihak ketiga ini hanya memiliki akses atas informasi pribadi anda untuk melakukan tugas-tugas tersebut atas nama kami dan secara kontraktual terikat untuk tidak mengungkapkan atau menggunakan informasi pribadi tersebut untuk tujuan lain apapun.<br>Kami tidak membagikan Informasi Pribadi anda kepada pihak manapun selain kepada Penyedia Layanan terkait dan perusahaan dan individu pihak ketiga yang disebutkan di bagian 4.4 di atas, tanpa persetujuan dari anda. Namun demikian, kami akan mengungkapkan Informasi Pribadi anda sepanjang dimintakan secara hukum, atau diperlukan untuk tunduk pada ketentuan perundang-undangan, peraturan-peraturan dan pemerintah, atau dalam hal terjadi sengketa, atau segala bentuk proses hukum antara anda dan kami, atau antara anda dan pengguna lain sehubungan dengan, atau terkait dengan Layanan, atau dalam keadaan darurat yang berkaitan dengan kesehatan dan/atau keselamatan anda.<br>Informasi Pribadi anda dapat dialihkan, disimpan, digunakan, dan diproses di suatu yurisdiksi selain Indonesia dimana server-server kami berada. Anda memahami dan setuju atas pengalihan Informasi Pribadi anda ke luar Indonesia.<br>Kami tidak menjual atau menyewakan Informasi Pribadi anda kepada pihak ketiga.<br>Penahanan Informasi yang Kami Kumpulkan<br><br>Kami akan menahan informasi anda hingga anda menghapus akun anda pada Aplikasi.<br><br>Keamanan<br><br>Kami tidak menjamin keamanan database kami dan kami juga tidak menjamin bahwa data yang anda berikan tidak akan ditahan/terganggu ketika sedang dikirimkan kepada kami. Setiap pengiriman informasi oleh anda kepada kami merupakan risiko anda sendiri. Anda tidak boleh mengungkapkan sandi anda kepada siapapun. Bagaimanapun efektifnya suatu teknologi, tidak ada sistem keamanan yang tidak dapat ditembus.<br><br>Perubahan atas Kebijakan Privasi ini<br><br>Kami dapat mengubah Kebijakan ini untuk mencerminkan perubahan dalam kegiatan kami. Jika kami mengubah Kebijakan ini, kami akan memberitahu anda melalui email atau dengan cara pemberitahuan di Situs web 1 hari sebelum perubahan berlaku. Kami menghimbau anda untuk meninjau halaman ini secara berkala untuk mengetahui informasi terbaru tentang bagaimana ketentuan Kebijakan ini kami berlakukan.<br><br>Lain-lain<br>Bahasa. Kebijakan ini dibuat dalam bahasa Inggris dan bahasa Indonesia, versi keduanya akan mengikat anda dan kami. Jika terdapat ketidaksesuaian antara versi bahasa Indonesia dan versi bahasa Inggris, maka versi bahasa Indonesia yang akan berlaku.<br>Hukum yang mengatur dan yurisdiksi. Kebijakan Privasi ini diatur oleh dan untuk ditafsirkan dalam hukum Negara Republik Indonesia. Setiap dan seluruh sengketa yang timbul dari kebijakan privasi ini akan diatur oleh yurisdiksi eksklusif dari Pengadilan Negeri Jakarta Selatan.<br>Pengakuan dan Persetujuan<br>Dengan menggunakan Aplikasi, anda mengakui bahwa anda telah membaca dan memahami Kebijakan ini dan Ketentuan Penggunaan dan setuju dan sepakat terhadap penggunaan, praktek, pemrosesan dan pengalihan informasi pribadi anda oleh kami sebagaimana dinyatakan di dalam Kebijakan ini.<br>Anda juga menyatakan bahwa anda memiliki hak untuk membagikan seluruh informasi yang telah anda berikan kepada kami dan untuk memberikan hak kepada kami untuk menggunakan dan membagikan informasi tersebut kepada Penyedia Layanan.<br>Berhenti menerima e-mail<br><br>Kami memiliki kebijakan untuk memilih masuk/keluar dari database. Jika Anda ingin berhenti menerima email dari kami, silahkan klik link unsubscribe yang disertakan pada masing-masing e-mail.<br><br>Cara untuk Menghubungi Kami<br><br>Jika Anda memiliki pertanyaan lebih lanjut tentang privasi dan keamanan informasi Anda dan ingin memperbarui atau menghapus data Anda maka silakan hubungi kami di: <a href=\"mailto:info@yoanter.com\" target=\"_blank\" rel=\"noopener\">info@yoanter.com</a> atau telepon ke: (0812-9108-0182)<br><br>YoAnter<br>Jalan Yosudarso No.29 Rt 09 Rw 02 Kota Metro Lampung 34111</p>', '<p class=\"MsoNormal\">YoAnter menjadi semangat baru dalam memberikan perjalan untuk kebaikkan. Kenapa perjalan untuk kebaikkan dengan yoanter menjadikan kesempatan untuk saling berbagi kepada yang membutuhkan yoanter menjadikan kesempatan Pembeli, Pengguna, dan Driver untuk 2.5% sabagai ladang amal sedekah dengan begitu kemudahan dalam berbagi hanya dalam satu aplikasi.</p>\r\n<p class=\"MsoNormal\"> </p>\r\n<p class=\"MsoNormal\">Yoanter memberikan peluang kepada seluruh masyarakat Indonesia untuk berkembang Bersama dalam pembangunan yang saling bergotong royong, serta meningkatkan ekonomi keluarga untuk mencapai kesejahteraan  Bersama.</p>\r\n<p class=\"MsoNormal\"> </p>\r\n<p class=\"MsoNormal\">Aplikasi YoAnter memiliki layanan transportasi untuk memberikan kemudahaan bagi masyarakat dalam melaksanakan pekerjaan dan bisnis seperti pengantaran, pemesanan makanan, pengiriman dokumen, belanja harian, pembayaran pulsa, internet, pln, dll</p>\r\n<p class=\"MsoNormal\"> </p>\r\n<p class=\"MsoNormal\">Visi</p>\r\n<p class=\"MsoNormal\">Setiap perjalan menjadikan kebaikkan untuk seluruh pengguna</p>\r\n<p class=\"MsoNormal\">Misi</p>\r\n<p class=\"MsoListParagraphCxSpFirst\">&lt;!-- [if !supportLists]--&gt;1.       &lt;!--[endif]--&gt;Membangun kebaikkan dalam perjalanan</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\">&lt;!-- [if !supportLists]--&gt;2.       &lt;!--[endif]--&gt;Memberikan kemudahan untuk kesejahteraan</p>\r\n<p class=\"MsoListParagraphCxSpLast\">&lt;!-- [if !supportLists]--&gt;3.       &lt;!--[endif]--&gt;Menjadi pelopor kebaikan dalam perjalanan anda</p>', 'Atur Ulang Kata Sandi', 'Pendaftaran Diterima', '<div style=\"text-align: justify;\">Kami telah menerima permintaan Anda untuk mengatur ulang kata sandi. Harap konfirmasi melalui tombol di bawah ini:</div>', '<div style=\"text-align: justify;\">Abaikan email ini jika Anda tidak pernah meminta untuk menyetel ulang sandi. Untuk pertanyaan, silakan hubungi</div>', '<div style=\"text-align: justify;\">Terima kasih telah mendaftarkan diri anda sebagai driver kami, kami telah menerima, silakan klik tombol di bawah ini untuk mengatur ulang kata sandi Anda:</div>', '<p>Abaikan email ini jika Anda tidak pernah meminta untuk menyetel ulang sandi. Untuk pertanyaan, silakan hubungi</p>', '977ddb19745c21f6c54986111e537596.png', 'mail.yoanter.com', '465', 'admin@yoanter.com', 'yoanterajabos12QWASZX#', 'YoAnter', 'ssl', 'YoAnter', '<p>Jalan Yosudarso No.29 Rt. 09 Rw. 02 Kota Metro lampung 34111</p>', 'https://play.google.com/', 'Rp', 'IDR', 'AIzaSyBLrW7IzWzbII0Sex8zrRmCyAZRT7iWqUs', 'AIzaSyBLrW7IzWzbII0Sex8zrRmCyAZRT7iWqUs', 'AAAAj6f00pA:APA91bEnnFWwZKGXPVsjEpzKQNAXmqOCPaeCzN4L0UA6_cqNj22IW6fe9sii9eaVfO77XIp9BssNeSUCQQ6d80lGCNwGB_Bs2MmT_et_wlhGZpwKvVTiDLC6GAR_zRfqDxuu3PVLIXbF', 'DS17900', '94ce6408a9b494c8da315acd32a1baa9', 0, 1, '0', 0, '0', '#0060fa', 'malajuD75eZg', 'dev-4ed5ff50-57a7-11ee-94b8-7d33cbbf148d', '1', '1', '200', '1000', '31ccca0f-f0ef-4d60-af96-90f7ac7b023a', 'NGM3NTAxOTAtM2ZhYi00Y2VjLWI1NGQtYzRkMDg2MWJmMGJh', '875da3d8-3d24-4c7c-a84d-ed132797f130', '9605a06f-283c-41d7-82f9-c28ea9a0f0cb', 'a57eb321-d8e9-4e14-9e2e-1e4119939dd6', '2eb18b61-4aed-4a3a-bacf-af8833a5685d', 'Onesignal', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int UNSIGNED NOT NULL,
  `kota` varchar(200) NOT NULL,
  `promo` varchar(200) NOT NULL,
  `rate1` varchar(200) NOT NULL,
  `rate2` varchar(200) NOT NULL,
  `rate3` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int UNSIGNED NOT NULL,
  `id_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `foto_berita` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_berita` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_berita` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `id_kategori`, `title`, `content`, `foto_berita`, `created_berita`, `status_berita`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Taman Cimanuk Indramayu, Taman Bersejarah Di Hilir Sungai Cimanuk', '<p>Taman Cimanuk Indramayu memberikan sebuah gambaran tentang pengelolaan, dan penataan kawasan tepian sungai, sehingga menjadi lokasi yang menarik, nyaman, dan aman, sebagi sebuah destinasi wisata.</p>\r\n<p>Taman Cimanuk Indramayu, atau dalam penulisannya Taman Tjimanoek Indramayu, adalah kawasan taman cantik, yang terletak di hilir Sungai Cimanuk.</p>\r\n<figure id=\"attachment_35560\" class=\"wp-caption alignnone\" aria-describedby=\"caption-attachment-35560\"><img class=\"size-full wp-image-35560 perfmatters-lazy entered pmloaded\" title=\"taman cimanuk indramayu\" src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/taman-cimanuk-indramayu.jpg\" sizes=\"(max-width: 800px) 100vw, 800px\" srcset=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/taman-cimanuk-indramayu.jpg 800w, https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/taman-cimanuk-indramayu-400x300.jpg 400w\" alt=\"taman cimanuk indramayu\" width=\"800\" height=\"600\" data-src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/taman-cimanuk-indramayu.jpg\" data-srcset=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/taman-cimanuk-indramayu.jpg 800w, https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/taman-cimanuk-indramayu-400x300.jpg 400w\" data-sizes=\"(max-width: 800px) 100vw, 800px\" data-ll-status=\"loaded\">\r\n<figcaption id=\"caption-attachment-35560\" class=\"wp-caption-text\">taman cimanuk indramayu. google maps. sumber: <a href=\"https://maps.google.com/maps/contrib/113360692267841285120\" target=\"_blank\" rel=\"noopener nofollow\">Yudi M Nur</a></figcaption>\r\n</figure>\r\n<p>Perlu diketahui bahwa Sungai Cimanuk adalah salah-satu sungai terpanjang yang terletak di provinsi Jawa Barat, dan memiliki nilai sejarah yang tinggi, karena pernah menjadi pelabuhan ke dua terbesar setelah Sunda Kelapa.</p>\r\n<p>Pelabuhan tersebut terletak di Kabupaten Indramayu, sebagai hilir dari Sungai Cimanuk. Adapun hulu dari sungai tersebut berada di Kabupaten Garut, Provinsi Jawa Barat.</p>\r\n<p>Meskipun saat ini arsitektur dari pelabuhan tersebut nyaris tidak ada bekasnya, tetapi fakta sejarah, serta sebuah bendera, menjadi sebuah penegasan bahwa Cimanuk memiliki peranan penting kala itu.</p>\r\n<p>Dan kini, Taman Cimanuk Indramayu menjadi sebuah mahakarya di hilir Cimanuk, yang dikemas secara kekinian, dan cocok sebagai tempat wisata keluarga di Indramayu.</p>\r\n<h2><span id=\"Lokasi_Dan_Alamat_Taman_Cimanuk_Indramayu\">Lokasi Dan Alamat Taman Cimanuk Indramayu</span></h2>\r\n<ul>\r\n<li>Lokasi Taman Cimanuk Indramayu terletak di dekat tugu 0 kilometer Kabupaten Indramayu, dan di dekat Masjid Agung Indramayu.</li>\r\n<li>Alamat Taman Cimanuk Indramayu berada di Desa Penganjang, Kecamatan Sindang, Kabupaten Indramayu, Provinsi Jawa Barat.</li>\r\n</ul>\r\n<h2><span id=\"Rute_Menuju_Taman_Cimanuk_Indramayu\">Rute Menuju Taman Cimanuk Indramayu</span></h2>\r\n<p>Jalan menuju Taman Cimanuk Indramayu cukup mudah, karena lokasinya sangat strategis, dekat dengan alun-alun Kabupaten Indramayu, dekat dengan Masjid Agung Indramayu, dan Tugu 0 Kilometer.</p>\r\n<p>Adapun jarak dari alun-alun Kabupaten Indramayu, Jawa Barat ke Taman Cimanuk Indramayu sekitar 500 meteran, hanya beberapa menit saja meskipun dengan berjalan kaki.</p>\r\n<p>Untuk bisa sampai di Taman Cimanuk Indramayu bisa diakses dengan menggunakan kendaraan roda dua, maupun roda empat, hingga area parkiran utamanya.</p>\r\n<h2><span id=\"Harga_Tiket_Masuk_Taman_Cimanuk_Indramayu\">Harga Tiket Masuk Taman Cimanuk Indramayu</span></h2>\r\n<ul>\r\n<li>Tiket masuk Taman Cimanuk Indramayu gratis.</li>\r\n<li>Para pengunjung diharuskan membayar tiket, jika ingin naik becak air.</li>\r\n</ul>\r\n<h2><span id=\"Jam_Buka_Taman_Cimanuk_Indramayu\">Jam Buka Taman Cimanuk Indramayu</span></h2>\r\n<ul>\r\n<li>Taman Cimanuk Indramayu buka selama 24 jam, kecuali becak air.</li>\r\n<li>Taman Cimanuk Indramayu beroperasional setiap hari.</li>\r\n</ul>\r\n<h2><span id=\"Fasilitas_Di_Taman_Cimanuk_Indramayu\">Fasilitas Di Taman Cimanuk Indramayu</span></h2>\r\n<figure id=\"attachment_35561\" class=\"wp-caption alignnone\" aria-describedby=\"caption-attachment-35561\"><img class=\"size-full wp-image-35561 perfmatters-lazy entered pmloaded\" title=\"fasilitas di taman cimanuk indramayu\" src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/fasilitas-di-taman-cimanuk-indramayu.jpg\" alt=\"fasilitas di taman cimanuk indramayu\" width=\"800\" height=\"450\" data-src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/fasilitas-di-taman-cimanuk-indramayu.jpg\" data-ll-status=\"loaded\">\r\n<figcaption id=\"caption-attachment-35561\" class=\"wp-caption-text\">fasilitas di taman cimanuk indramayu. google maps. sumber: <a href=\"https://maps.google.com/maps/contrib/107261035273355982708\" target=\"_blank\" rel=\"noopener nofollow\">Thini Syifa</a></figcaption>\r\n</figure>\r\n<p>Fasilitas wisata di Taman Cimanuk Indramayu adalah sebagai berikut:</p>\r\n<ul>\r\n<li>Area parkir,</li>\r\n<li>Toilet,</li>\r\n<li>Becak air,</li>\r\n<li>Spot kuliner,</li>\r\n<li>Tempat duduk yang nyaman,</li>\r\n<li>Jalur trekking.</li>\r\n</ul>\r\n<h2><span id=\"Daya_Tarik_Taman_Cimanuk_Indramayu\">Daya Tarik Taman Cimanuk Indramayu</span></h2>\r\n<h3>1. Becak Air</h3>\r\n<figure id=\"attachment_35562\" class=\"wp-caption alignnone\" aria-describedby=\"caption-attachment-35562\"><img class=\"size-full wp-image-35562 perfmatters-lazy entered pmloaded\" title=\"wahana becak air\" src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/wahana-becak-air.jpg\" alt=\"wahana becak air\" width=\"800\" height=\"450\" data-src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/wahana-becak-air.jpg\" data-ll-status=\"loaded\">\r\n<figcaption id=\"caption-attachment-35562\" class=\"wp-caption-text\">wahana becak air. google maps. sumber: <a href=\"https://maps.google.com/maps/contrib/111908488491314215471\" target=\"_blank\" rel=\"noopener nofollow\">Oki Fajar Rochman</a></figcaption>\r\n</figure>\r\n<p>Taman Cimanuk Indramayu menyajikan wahana wisata berupa becak air, sebagai sebuah moda transportasi menyusuri area Sungai Cimanuk.</p>\r\n<p>Sungainya bersih, serta aliran airnya juga tenang, sehingga membuat nyaman pengujung yang melakukan aktivitas wisata naik becak tersebut.</p>\r\n<p>Para pengunjung diharuskan membayar tiket sewa, dan terminal becak air tersebut lokasinya berada di bawah jembatan, dan terdapat sebuah turunan tangga untuk bisa sampai ke tempat pembelian tiket.</p>\r\n<h3>2. Jalur Trekking</h3>\r\n<figure id=\"attachment_35563\" class=\"wp-caption alignnone\" aria-describedby=\"caption-attachment-35563\"><img class=\"size-full wp-image-35563 perfmatters-lazy entered pmloaded\" title=\"jalur trekking instagramable\" src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/jalur-trekking-instagramable.jpg\" alt=\"jalur trekking instagramable\" width=\"800\" height=\"1067\" data-src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/jalur-trekking-instagramable.jpg\" data-ll-status=\"loaded\">\r\n<figcaption id=\"caption-attachment-35563\" class=\"wp-caption-text\">jalur trekking instagramable. google maps. sumber: <a href=\"https://maps.google.com/maps/contrib/113715769610088251044\" target=\"_blank\" rel=\"noopener nofollow\">Nur Evie</a></figcaption>\r\n</figure>\r\n<p>Daya tarik selanjutnya dari Taman Cimanuk Indramayu adalah jalur trekkingnya yang panjang, tertata secara baik, serta dihias, dan menjadikannya spot yang bagus untuk selfie.</p>\r\n<p>Saat ini, tembok tebing di samping jalur trekking tersebut dipenuhi dengan beragam lukisan. Ada juga tempat duduk di samping sungai yang sangat nyaman.</p>\r\n<p>Area tersebut aman sebagai destinasi wisata keluarga. Karena di jalur trekking tersebut terdapat pagar pembatas di tepi Sungai Cimanuk.</p>\r\n<p>Bagi anda yang hobi dengan tanaman hias, atau bunga-bunga, maka di Taman Cimanuk Indramayu bisa anda temukan orang-orang yang menjual hal tersebut.</p>\r\n<h3>3. Spot Kuliner</h3>\r\n<figure id=\"attachment_35564\" class=\"wp-caption alignnone\" aria-describedby=\"caption-attachment-35564\"><img class=\"size-full wp-image-35564 perfmatters-lazy entered pmloaded\" title=\"malam di taman cimanuk\" src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/malam-di-taman-cimanuk.jpg\" sizes=\"(max-width: 800px) 100vw, 800px\" srcset=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/malam-di-taman-cimanuk.jpg 800w, https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/malam-di-taman-cimanuk-400x300.jpg 400w\" alt=\"malam di taman cimanuk\" width=\"800\" height=\"600\" data-src=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/malam-di-taman-cimanuk.jpg\" data-srcset=\"https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/malam-di-taman-cimanuk.jpg 800w, https://www.nativeindonesia.com/foto/taman-cimanuk-indramayu/malam-di-taman-cimanuk-400x300.jpg 400w\" data-sizes=\"(max-width: 800px) 100vw, 800px\" data-ll-status=\"loaded\">\r\n<figcaption id=\"caption-attachment-35564\" class=\"wp-caption-text\">malam di taman cimanuk. google maps. sumber: <a href=\"https://maps.google.com/maps/contrib/111532489328634944284\" target=\"_blank\" rel=\"noopener nofollow\">rama karunia</a></figcaption>\r\n</figure>\r\n<p>Saat sore menuju malam, maka kawasan Taman Cimanuk Indramayu mulai dipenuhi para pengunjung, terutama muda-mudi. Karena Taman Cimanuk Indramayu adalah salah-satu tempat yang enak untuk nongkrong.</p>\r\n<p>Salah-satu alasannya adalah terdapat spot kuliner. Suasananya sangat nyaman, terletak di samping Sungai Cimanuk, serta dilengkapi dengan tempat duduk yang nggak bakal ngebosenin buat nongkrong.</p>', 'ebaef29d3f1c4ff2661942d6ba0d4842.jpg', '2023-06-30 13:54:55', '1', NULL, NULL, NULL),
(2, '1', 'Wisata Batu Lawang Cirebon', '<p><span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang menjadi <a href=\"https://sikidang.com/tempat-wisata-di-cirebon/\">tempat wisata baru di Cirebon</a> yang rekomended dengan keindahan alam dan spot selfienya. Sajian keindahan panorama yang dikemas dengan spot foto instagramable membuat tempat satu ini selalu ramai dikunjungi oleh wisatawan.</span></p>\r\n<p>Kabupaten Cirebon memang menyajikan wisata yang tidak sehits kota-kota lain di Jawa Barat seperti Bandung, Bogor dan lainnya. Namun banyak yang tidak tahu jika anda destinasi rekomended yang layak untuk dikunjungi ketika hari libur tiba.</p>\r\n<div class=\"td-g-rec td-g-rec-id-content_inline tdi_2 td_block_template_1\"> </div>\r\n<p>Selain wisata sejarahnya, Kabupaten Cirebon juga menyajikan tarikan alam yang mempesona. Salah satunya yaitu wisata alam <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang dengan keindahan yang menenangkan. Rasa jenuh dan penat akan aktivitas sehari-hari bisa anda  relaksasi dengan berlibur di tempat menarik satu ini.</span></p>\r\n<p>Rasakan keseruan liburan dengan sajian alam <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang, tidak hanya mempesona saja namun juga bisa anda nikmati dengan biaya murah meriah. Sangat rekomended untuk wisata anak dan keluarga ketika berlibur di Cirebon Jawa Barat. Jika anda berencana mengunjungi destinasi Cirebon satu ini, ada baiknya anda simak beberapa informasi Batu Lawang berikut ini untuk referensi.</span></p>\r\n<h2>Harga Tiket Masuk <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang</span></h2>\r\n<figure id=\"attachment_6229\" class=\"wp-caption aligncenter\" aria-describedby=\"caption-attachment-6229\"><img class=\"size-full wp-image-6229\" src=\"https://sikidang.com/wp-content/uploads/Harga-Tiket-Masuk-Batu-Lawang.jpg\" sizes=\"(max-width: 600px) 100vw, 600px\" srcset=\"https://sikidang.com/wp-content/uploads/Harga-Tiket-Masuk-Batu-Lawang.jpg 600w, https://sikidang.com/wp-content/uploads/Harga-Tiket-Masuk-Batu-Lawang-300x200.jpg 300w\" alt=\"Harga Tiket Masuk Batu Lawang\" width=\"600\" height=\"400\">\r\n<figcaption id=\"caption-attachment-6229\" class=\"wp-caption-text\">foto: https://www.instagram.com/makymujahid/</figcaption>\r\n</figure>\r\n<p>Alam Cirebon yang indah mempesona dengan berjalannya waktu sudah dimanfaatkan untuk potensi wisata. Tidak terkecuali <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang, dengan pengelolaan yang baik tempat wisata ini menjadi magnet wisata baru di Cirebon.</span></p>\r\n<p>Untuk menikmati suasan serta spot wisata yang ada di <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang pun anda tidak perlu kehilangan banyak biaya. Karena dengan harga tiket masuk Rp.7.000/orang anda sudah bisa menikmati sajian alam mempesona di Batu Lawang.</span></p>\r\n<p>Untuk biaya retribusi parkir kendaraan di <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang sendiri yaitu Rp.2.000 untuk sepeda motor dan Rp.5000 ketika menggunakan mobil. (Harga tiket masuk wisata alam Batu Lawang dan biaya lainnya bisa berubah-ubah).</span></p>\r\n<p>Sedangkan operasional wisata dari <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang Cirebon buka setiap hari mulai dari jam 07.00 – 17.00 WIB. Sehingga anda bisa berkunjung kapan saja dan menikmati pesona keindahan Batu Lawang bersama keluarga tercinta.</span></p>\r\n<h2><span id=\"Alamat_dan_Rute_Lokasi\" class=\"ez-toc-section\"></span>Alamat dan Rute Lokasi</h2>\r\n<figure id=\"attachment_6230\" class=\"wp-caption aligncenter\" aria-describedby=\"caption-attachment-6230\"><img class=\"size-full wp-image-6230\" src=\"https://sikidang.com/wp-content/uploads/Alamat-dan-Rute-Lokasi-Batu-Lawang.jpg\" sizes=\"(max-width: 600px) 100vw, 600px\" srcset=\"https://sikidang.com/wp-content/uploads/Alamat-dan-Rute-Lokasi-Batu-Lawang.jpg 600w, https://sikidang.com/wp-content/uploads/Alamat-dan-Rute-Lokasi-Batu-Lawang-300x200.jpg 300w\" alt=\"Alamat dan Rute Lokasi Batu Lawang\" width=\"600\" height=\"400\" loading=\"lazy\">\r\n<figcaption id=\"caption-attachment-6230\" class=\"wp-caption-text\">foto: https://www.instagram.com/eny_zulfaa/</figcaption>\r\n</figure>\r\n<p>Menjadi objek wisata baru di Cirebon tidak membuat <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang susah dikunjungi, karena lokasinya mudah dijangkau dengan akses jalan yang sudah baik. Untuk alamatnya sendiri Batu Lawang berada di Cupang, Kec. Gempol, Cirebon, Jawa Barat.</span></p>\r\n<p>Anda bisa mengunjungi tempat wisata keluarga di Cirebon satu ini menggunakan kendaraan dengan menempuh waktu sekitar 1 jam perjalanan. Karena lokasi wisata alam <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang jika anda berangkat dari pusat kota Cirebon kurang lebih 28 km.</span></p>\r\n<p>Rekomendasi tempat piknik keluarga di Cirebon yang sayang untuk anda lewatkan ketika hari libur. Jika anda berencana berkunjung ke wana wisata <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang, akses peta lokasi di bawah ini untuk mendapatkan rute perjalanan terbaik menuju kesana.</span></p>\r\n<h2>Fasilitas</h2>\r\n<figure id=\"attachment_6231\" class=\"wp-caption aligncenter\" aria-describedby=\"caption-attachment-6231\"><img class=\"size-full wp-image-6231\" src=\"https://sikidang.com/wp-content/uploads/fasilitas-di-Batu-Lawang.jpg\" sizes=\"(max-width: 600px) 100vw, 600px\" srcset=\"https://sikidang.com/wp-content/uploads/fasilitas-di-Batu-Lawang.jpg 600w, https://sikidang.com/wp-content/uploads/fasilitas-di-Batu-Lawang-300x200.jpg 300w\" alt=\"fasilitas di Batu Lawang\" width=\"600\" height=\"400\" loading=\"lazy\">\r\n<figcaption id=\"caption-attachment-6231\" class=\"wp-caption-text\">foto: https://www.instagram.com/_aguste/</figcaption>\r\n</figure>\r\n<p>Destinasi wisata <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang Cirebon dilengkapi dengan beberapa fasilitas pendukung wisata. Berikut beberapa fasilitas yang bisa anda nikmati di Batu Lawang ketika berkunjung bersama orang tercinta.</span></p>\r\n<ul>\r\n<li>Area parkir kendaraan wisata</li>\r\n<li>Mushola</li>\r\n<li>Toilet</li>\r\n<li>Warung wisata</li>\r\n<li>Gazebo</li>\r\n<li>Spot foto instagenic</li>\r\n<li>Wahana permainan seru</li>\r\n</ul>\r\n<p>Dapatkan liburan impian anda yang seru dan menyenangkan di <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang dengan menikmati fasilitas dan spot wisata yang ada.</span></p>\r\n<h2><span id=\"Spot_Wisata_di_Batu_Lawang\" class=\"ez-toc-section\"></span>Spot Wisata di <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang</span></h2>\r\n<figure id=\"attachment_6232\" class=\"wp-caption aligncenter\" aria-describedby=\"caption-attachment-6232\"><img class=\"size-full wp-image-6232\" src=\"https://sikidang.com/wp-content/uploads/Spot-Wisata-di-Batu-Lawang.jpg\" sizes=\"(max-width: 600px) 100vw, 600px\" srcset=\"https://sikidang.com/wp-content/uploads/Spot-Wisata-di-Batu-Lawang.jpg 600w, https://sikidang.com/wp-content/uploads/Spot-Wisata-di-Batu-Lawang-300x200.jpg 300w\" alt=\"Spot Wisata di Batu Lawang\" width=\"600\" height=\"400\" loading=\"lazy\">\r\n<figcaption id=\"caption-attachment-6232\" class=\"wp-caption-text\">foto: https://www.instagram.com/rudi_cikalbalerias140/</figcaption>\r\n</figure>\r\n<p>Selain menikmati alam yang indah untuk mereaksasi jiwa dan pikiran yang penuh dengan kepenatan. Banyak aktivitas menarik lainnya yang bisa anda nikmati ketika berlibur di <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang.</span></p>\r\n<p>Seperti rekreasi dan piknik bersama keluarga dengan sajian alam yang mempesona, berburu foto instagenic dan lainnya. Banyak juga wahana permainan alam yang bisa anda nikmati untuk merasakan liburan yang lebih berkualitas dan menyenangkan di <span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Batu Lawang Cirebon Jawa Barat.</span></p>', '46153e8826514014b453ab432ce927b1.jpg', '2023-06-30 13:57:48', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `berkas_driver`
--

CREATE TABLE `berkas_driver` (
  `id_berkas` int NOT NULL,
  `id_driver` varchar(250) NOT NULL,
  `foto_ktp` varchar(250) NOT NULL,
  `foto_sim` varchar(250) NOT NULL,
  `foto_kendaraan` varchar(250) NOT NULL,
  `foto_plat` varchar(255) NOT NULL,
  `id_sim` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `berkas_driver`
--

INSERT INTO `berkas_driver` (`id_berkas`, `id_driver`, `foto_ktp`, `foto_sim`, `foto_kendaraan`, `foto_plat`, `id_sim`, `created`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 'D1707175508', '1707175438-23676.jpg', '1707175438-94556.jpg', '1707175438-92039.jpg', '1707175438-14033.jpg', '559494', '2024-02-05 23:23:58', NULL, NULL, NULL),
(20, 'D1707196743', '1707196648-90656.jpg', '1707196648-93288.jpg', '1707196648-6848.jpg', '1707196648-36707.jpg', '000225350102', '2024-02-06 05:17:28', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_item`
--

CREATE TABLE `category_item` (
  `id_kategori_item` int NOT NULL,
  `nama_kategori_item` varchar(250) NOT NULL,
  `foto_kategori_item` varchar(250) NOT NULL DEFAULT 'noimage.jpg',
  `id_merchant` varchar(250) NOT NULL,
  `created_cat_item` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `all_category` varchar(50) NOT NULL,
  `status_kategori` varchar(5) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_item`
--

INSERT INTO `category_item` (`id_kategori_item`, `nama_kategori_item`, `foto_kategori_item`, `id_merchant`, `created_cat_item`, `all_category`, `status_kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'Pindang Baung', '1707106426-62397.jpg', '12953', '2024-02-05 04:13:46', '0', '1', NULL, NULL, NULL),
(14, 'Pindang Baung Kepala', '1707176437-69466.jpg', '19572', '2024-02-05 23:40:37', '0', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_merchant`
--

CREATE TABLE `category_merchant` (
  `id_kategori_merchant` int NOT NULL,
  `nama_kategori` varchar(250) NOT NULL,
  `foto_kategori` varchar(250) NOT NULL,
  `id_fitur` varchar(200) NOT NULL,
  `status_kategori` varchar(100) NOT NULL,
  `isall` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_merchant`
--

INSERT INTO `category_merchant` (`id_kategori_merchant`, `nama_kategori`, `foto_kategori`, `id_fitur`, `status_kategori`, `isall`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jepang', '49edbd2f27585e7d88c9dde1e8552c0e.jpeg', '3', '1', 0, NULL, NULL, NULL),
(2, 'Tradisional', '08784264f702446023d7926d0b0c1e7d.jpg', '3', '1', 0, NULL, NULL, NULL),
(3, 'Cafe', '48527e4bd1b982d40d435ccc7fa72a38.jpg', '3', '1', 0, NULL, NULL, NULL),
(4, 'Buah', '11f0a4f0245576b2215a5666db841ef7.jpg', '4', '1', 0, NULL, NULL, NULL),
(5, 'Kelontong', 'e048b570f10dc9e2ca7a3e4c64356291.jpg', '4', '1', 0, NULL, NULL, NULL),
(6, 'Ikan Bakar', 'cbeaa165754a2d6d7817f82d37702e0f.jpeg', '3', '1', 0, NULL, NULL, NULL),
(7, 'Bakso', 'b2e89ede9dacacbb4c7ad7afbc2a177e.jpg', '3', '1', 0, NULL, NULL, NULL),
(8, 'Ramen', '1a9c872ef5d75cd4eb0947ae40fea3ad.jpg', '3', '1', 0, NULL, NULL, NULL),
(9, 'Korean', '0d0b45c0db7619b71445cf793b4da62c.jpeg', '3', '1', 0, NULL, NULL, NULL),
(10, 'Angkringan', 'e8ba8577be7db008eaab497900a9da5c.jpg', '3', '1', 0, NULL, NULL, NULL),
(11, 'RM.Padang', '999cbe7bb227d12ee026137efbf66b8e.jpg', '3', '1', 0, NULL, NULL, NULL),
(12, 'Warteg', '02329e0404ad1c0624c8a709c8fb77e1.jpeg', '3', '1', 0, NULL, NULL, NULL),
(13, 'Rumahan', '372e72886767fba1e896338a37e3ac10.jpg', '3', '1', 0, NULL, NULL, NULL),
(14, 'Oleh Oleh', '1b155a1cc2a203da88bc0e283fb97f22.jpg', '3', '1', 0, NULL, NULL, NULL),
(15, 'Martabak', '2e57e7051d1cc123deeeca04cc4d176e.jpg', '3', '1', 0, NULL, NULL, NULL),
(16, 'Kue', 'a13d918d34af935fb27956f4c720abfe.jpg', '3', '1', 0, NULL, NULL, NULL),
(17, 'Herbal', 'e81f6eea4fa5cadc7ab532798471d0b1.jpg', '4', '1', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int NOT NULL,
  `idtrans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idcust` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `iddriver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pesan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isread` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `fotochat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `jam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `chat_merchant`
--

CREATE TABLE `chat_merchant` (
  `id` int NOT NULL,
  `idtrans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idmerc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `iddriver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pesan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isread` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `fotochat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `jam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `config_driver`
--

CREATE TABLE `config_driver` (
  `id_driver` varchar(200) NOT NULL,
  `latitude` varchar(30) NOT NULL DEFAULT '0',
  `longitude` varchar(30) NOT NULL DEFAULT '0',
  `bearing` varchar(250) NOT NULL DEFAULT '0',
  `uang_belanja` int NOT NULL DEFAULT '1',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `target` int NOT NULL DEFAULT '0',
  `isreset` int NOT NULL DEFAULT '0',
  `nextday` date NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '4',
  `reject` varchar(255) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `config_driver`
--

INSERT INTO `config_driver` (`id_driver`, `latitude`, `longitude`, `bearing`, `uang_belanja`, `update_at`, `target`, `isreset`, `nextday`, `status`, `reject`, `created_at`, `updated_at`, `deleted_at`) VALUES
('D1707175508', '-4.909085', '105.2063439', '26.96336', 1, '2024-03-09 09:28:44', 0, 0, '2024-03-09', '1', '0', NULL, NULL, NULL),
('D1707196743', '-5.1373386', '105.2926122', '119.8973', 1, '2024-03-09 09:28:52', 0, 0, '2024-03-09', '4', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config_user`
--

CREATE TABLE `config_user` (
  `id_user` varchar(200) NOT NULL,
  `latitude` varchar(30) NOT NULL DEFAULT '0',
  `longitude` varchar(30) NOT NULL DEFAULT '0',
  `bearing` varchar(250) NOT NULL DEFAULT '0',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `digi_brand`
--

CREATE TABLE `digi_brand` (
  `id` int NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Pulsa',
  `fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ikon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iszone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `digi_brand`
--

INSERT INTO `digi_brand` (`id`, `kode`, `nama`, `brand`, `keterangan`, `type`, `fee`, `ikon`, `iszone`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '469198', 'Telkomsel', 'TELKOMSEL', 'Pulsa Telkomsels', 'Pulsa', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(3, '706402', 'Telkomsel Internet', 'TELKOMSEL', 'Paket Internet Telkomsel', 'Data', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(4, '568008', 'XL', 'XL', 'Pulsa XL', 'Pulsa', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(5, '680281', 'Indosat', 'INDOSAT', 'Pulsa Indosat', 'Pulsa', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(6, '279036', 'Axis', 'AXIS', 'Pulsa Axis', 'Pulsa', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(7, '668487', 'Axis Internet', 'AXIS', 'Paket Internet Axis', 'Data', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(8, '654956', 'PLN', 'PLN', 'Topup PLN', 'Pln', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(9, '336849', 'Tri', 'TRI', 'Pulsa Tri', 'Pulsa', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(10, '662150', 'Tri Internet', 'TRI', 'Paket Internet Tri', 'Data', '200', '61697f389539042b1178cbcf97ad3dd9.png', '0', '1', NULL, NULL, NULL),
(14, '26294', 'Dana', 'DANA', 'Topup Dana', 'E-Money', '200', 'e334ed90de7e082d62675c2c211939a3.png', '0', '1', NULL, NULL, NULL),
(15, '14707', 'Ovo', 'OVO', 'Topup Ovo', 'E-Money', '200', '2ad3ecd597ad76ee2ebd3dad5995d20f.png', '0', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `digi_history`
--

CREATE TABLE `digi_history` (
  `id` int NOT NULL,
  `reffid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idpelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1234',
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `upharga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tujuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1234',
  `refund` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tanggal` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sukses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `digi_history`
--

INSERT INTO `digi_history` (`id`, `reffid`, `provider`, `sku`, `idpelanggan`, `token`, `harga`, `upharga`, `tujuan`, `sn`, `refund`, `tanggal`, `status`, `sukses`) VALUES
(1, '7KT3Z', 'Xl 10.000', 'xld10', 'P1946144648', '1234', '10000', '200', '087800001230', '1234', '0', '2023-10-23 10:21:29', 'Sukses', '1'),
(2, 'HN0WG', 'PLN 20.000', 'PLN20', 'P1946144648', '1234', '0', '0', '86037731147', '1234', '0', '2023-12-02 17:09:49', 'Gagal', '0'),
(3, 'CX0DE', 'Xl 10.000', 'xld10', 'P1946144648', '1234', '0', '200', '087800001230', '1234', '0', '2023-12-04 14:25:41', 'Gagal', '0'),
(4, '5CQO0', 'Three 10.000', 'TR10', 'P1946144648', '1234', '0', '200', '08991585001', '1234', '0', '2023-12-04 14:27:01', 'Gagal', '0'),
(5, 'DHPPD', 'Xl 10.000', 'xld10', 'P1946144648', '1234', '0', '200', '087800001230', '1234', '0', '2023-12-04 14:29:10', 'Gagal', '0'),
(6, '7JVO0', 'Xl 10.000', 'xld10', 'P1946144648', '1234', '10000', '200', '087800001230', '1234', '0', '2023-12-04 14:31:20', 'Sukses', '1');

-- --------------------------------------------------------

--
-- Table structure for table `digi_kategori`
--

CREATE TABLE `digi_kategori` (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ikon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '500',
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Prabayar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `digi_kategori`
--

INSERT INTO `digi_kategori` (`id`, `nama`, `kategori`, `ikon`, `status`, `adm`, `tipe`) VALUES
(1, 'Pulsa', 'Pulsa', '978ec5fec6c220d3583412e6ddca8236.png', '1', '500', 'Prabayar'),
(2, 'Data', 'Data', '6eb123892c985c4d57d8f23a513c63a8.png', '1', '500', 'Prabayar'),
(3, 'Listrik', 'PLN', '63ac087fe049d1499394863c8cc7d2b3.png', '1', '500', 'Prabayar'),
(5, 'E-Money', 'E-Money', 'f857fdd19f1e9704573eef4707ee54e1.png', '1', '500', 'Prabayar');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` varchar(200) NOT NULL,
  `nama_driver` varchar(20) NOT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `countrycode` varchar(20) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `job` int NOT NULL,
  `gender` varchar(250) DEFAULT 'Male',
  `alamat_driver` text NOT NULL,
  `kendaraan` int DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reg_id` varchar(250) NOT NULL DEFAULT '1234',
  `status` char(1) DEFAULT '2',
  `point` varchar(250) NOT NULL DEFAULT '0',
  `Kota` varchar(250) NOT NULL DEFAULT 'all',
  `uplink` varchar(255) NOT NULL DEFAULT 'Admin',
  `prioritas` int DEFAULT '0',
  `ostoken` varchar(255) DEFAULT '12345'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `nama_driver`, `no_ktp`, `tgl_lahir`, `no_telepon`, `countrycode`, `phone`, `email`, `password`, `foto`, `rating`, `job`, `gender`, `alamat_driver`, `kendaraan`, `created_at`, `update_at`, `reg_id`, `status`, `point`, `Kota`, `uplink`, `prioritas`, `ostoken`) VALUES
('D1707175508', 'adi', '546565', '2024-02-06', '62123456123456', '+62', '123456123456', 'adicitycom@gmail.com', '5b2de813b23de82181467ebb0b9b2bea23f67ce7', '1707175438-4446.jpg', 4.2, 17, 'Male', 'Jalan Yosudarso No.29 Kota Metro Lampung 34111', 12, '2024-02-05 23:23:58', '2024-02-19 18:16:44', 'eyAU2ZqlTq-a9vz0FZQVUS:APA91bGHlBEYzvxgxTSt4towByCa2dN3npBLAgKaSFMKqkxbDHW-N1aghmGg__YmN7mdmVWvNXx0-CD58LBpMX9Z8jtJd0_Oxz73EyzRv9GLnlrDDry7FFCJw88Q59nzaEOhE9AZjYav', '1', '12', 'all', 'admin', 0, '1f4df594-30e2-462c-a7a8-4276d5a84871'),
('D1707196743', 'rafidnur25', '1872032502000004', '2000-02-25', '6289509132594', '+62', '89509132594', 'rafidnur25@gmail.com', 'c842a874b6026990c4d44d486e476a80515ec71a', '1707196648-10948.jpg', 0, 17, 'Laki-Laki', 'jl. Soekarno Hatta RT 12 RW 03 Kelurahan Mulyojati Kecamatan Metro Barat ', 13, '2024-02-06 05:17:28', '2024-02-06 07:41:10', 'fvB4bDYMTJS14_ZPSDcsQY:APA91bHpy4iCYDBzq1cxty2GfC0PPLB1owMYahSF0cseUBgamgxPRJmQbtPD1E5SbxfLOqaM_0IMpydBfndYwihIJm3UpRfoF5m5-RISOX4Vi9FtO4fefH5f0P8YjK7lTOB6SmkFUKQc', '1', '0', 'all', 'admin', 0, 'aeb75858-e1b8-44f1-bde0-109631a3ebc7');

-- --------------------------------------------------------

--
-- Table structure for table `driver_job`
--

CREATE TABLE `driver_job` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_job` varchar(250) NOT NULL,
  `icon` varchar(20) NOT NULL DEFAULT '1',
  `ismobil` int NOT NULL DEFAULT '0',
  `status_job` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `driver_job`
--

INSERT INTO `driver_job` (`id`, `driver_job`, `icon`, `ismobil`, `status_job`) VALUES
(18, 'Mobil', '2', 0, '1'),
(17, 'Motor', '1', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `fitur`
--

CREATE TABLE `fitur` (
  `id_fitur` int NOT NULL,
  `fitur` varchar(20) NOT NULL,
  `biaya` int NOT NULL,
  `biaya_minimum` int NOT NULL,
  `jarak_driver` varchar(255) DEFAULT '1',
  `jarak_minimum` varchar(100) NOT NULL,
  `maks_distance` varchar(250) NOT NULL,
  `wallet_minimum` varchar(100) NOT NULL,
  `komisi` varchar(200) DEFAULT '0',
  `promo` varchar(255) DEFAULT '0',
  `keterangan_biaya` varchar(50) NOT NULL,
  `driver_job` int NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `home` varchar(1) NOT NULL,
  `parkir` varchar(255) DEFAULT '0',
  `jasaapp` varchar(250) NOT NULL DEFAULT '0',
  `background` varchar(255) NOT NULL DEFAULT '#FDEBF5',
  `startcolor` varchar(255) DEFAULT '#008000',
  `endcolor` varchar(255) NOT NULL DEFAULT '#ADFF2F',
  `angel` varchar(255) DEFAULT '10',
  `tint` varchar(255) NOT NULL DEFAULT '#FDEBF5',
  `usedtint` int NOT NULL DEFAULT '0',
  `padding` int DEFAULT '0',
  `kota` varchar(255) DEFAULT 'all',
  `active` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fitur`
--

INSERT INTO `fitur` (`id_fitur`, `fitur`, `biaya`, `biaya_minimum`, `jarak_driver`, `jarak_minimum`, `maks_distance`, `wallet_minimum`, `komisi`, `promo`, `keterangan_biaya`, `driver_job`, `keterangan`, `icon`, `home`, `parkir`, `jasaapp`, `background`, `startcolor`, `endcolor`, `angel`, `tint`, `usedtint`, `padding`, `kota`, `active`) VALUES
(1, 'Motor', 2500, 5500, '10', '2', '15', '10000', '10', '1', 'KM', 17, '1 Orang', 'df61f0e862354aa86202840f877bcd6e.png', '1', '0', '0', '#42ae7b', '#c5e4fc', '#c5e4fc', '150', '#ffffff', 0, 20, 'all', '1'),
(2, 'Mobil', 10000, 15000, '1', '1', '20', '10000', '10', '1', 'KM', 18, '4 Orang', 'c2f9442fd50e49e6a83741073fc12478.png', '1', '0', '0', '#42ae7b', '#c5e4fc', '#c5e4fc', '150', '#ffffff', 0, 20, 'all', '1'),
(3, 'Kuliner', 2500, 5000, '10', '1', '15', '10000', '10', '1', 'KM', 17, 'Order Food', '1e0515dab6bb32ebce240ad48fe7a86c.png', '4', '2000', '0', '#fec13e', '#c5e4fc', '#c5e4fc', '150', '#ffffff', 0, 20, 'all', '1'),
(4, 'Toko', 5000, 20000, '1', '1', '10', '10000', '10', '1', 'KM', 17, 'Order Store', '00d44902a3cc9328fdc28879da96b1cc.png', '4', '2000', '0', '#ff6179', '#c5e4fc', '#c5e4fc', '150', '#ffffff', 0, 20, 'all', '1'),
(5, 'Kurir', 2500, 10000, '1', '1', '10', '10000', '10', '1', 'KM', 17, 'Order Send', '8204b1794853c2791cf188b840fe3c95.png', '2', '0', '0', '#303b8d', '#c5e4fc', '#c5e4fc', '150', '#ffffff', 0, 20, 'all', '1'),
(9, 'Jastip', 2500, 5000, '3', '1', '10', '10000', '5', '5', 'KM', 17, 'Belanja Lebih Mudah Dan Aman', 'd0e41af3a444b549d388734352f93ddb.png', '5', '0', '0', '#FDEBF5', '#c5e4fc', '#c5e4fc', '150', '#e4e0ff', 0, 20, 'all', '1'),
(11, 'Pindahan', 15000, 25000, '1', '1', '20', '10000', '10', '1', 'KM', 18, '6 Orang', 'e262d25d3dd25e464bb400ea488f0dc0.png', '1', '0', '0', '#42ae7b', '#c5e4fc', '#c5e4fc', '150', '#ffffff', 0, 20, 'all', '1'),
(12, 'Rental', 2500, 8000, '5', '1', '10', '10000', '5', '1', 'KM', 18, 'Maksimal 13 Orang', '864671cc1983c7d4eb7c067f3bbe63aa.png', '1', '0', '0', '#FDEBF5', '#c5e4fc', '#c5e4fc', '150', '#e4e0ff', 0, 20, 'all', '1');

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE `forgot_password` (
  `id` int NOT NULL,
  `idkey` int NOT NULL,
  `userid` varchar(200) NOT NULL,
  `token` varchar(500) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `forgot_password`
--

INSERT INTO `forgot_password` (`id`, `idkey`, `userid`, `token`, `created`) VALUES
(20, 2, 'D1707175508', 'ab039a5b94ef23bcf7bfa5665c5b8fd7922ed247', '2024-02-05 23:26:08'),
(21, 3, 'M19572', '47042a78ae1ef97fc562fb5d34c71e50dd252567', '2024-02-05 23:35:10'),
(22, 2, 'D1707196743', 'e70c984f3c2b161d7a660077b42b4598f576d8ff', '2024-02-06 05:18:40');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pelanggan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `group`, `level`) VALUES
(1, 'Pelanggan', 'pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `history_transaksi`
--

CREATE TABLE `history_transaksi` (
  `nomor` bigint UNSIGNED NOT NULL,
  `id_transaksi` varchar(250) NOT NULL,
  `id_driver` varchar(200) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `proses` int NOT NULL DEFAULT '0',
  `gender` int NOT NULL DEFAULT '1',
  `verif` varchar(255) DEFAULT '321654'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `history_transaksi`
--

INSERT INTO `history_transaksi` (`nomor`, `id_transaksi`, `id_driver`, `waktu`, `status`, `catatan`, `proses`, `gender`, `verif`) VALUES
(81, '21269', 'D1707175508', '2024-02-06 00:01:49', 4, NULL, 0, 1, '5399'),
(82, '13704', 'D1707175508', '2024-02-06 02:30:30', 4, NULL, 0, 1, '2748'),
(83, '26005', 'D0', '2024-02-06 05:21:14', 1, NULL, 0, 1, '6318'),
(84, '11108', 'D1707196743', '2024-02-06 05:21:45', 4, NULL, 0, 1, '321654'),
(85, '28295', 'D1707175508', '2024-02-06 13:00:00', 4, NULL, 0, 1, '321654'),
(86, '19097', 'D1707175508', '2024-02-06 13:09:11', 4, NULL, 0, 1, '321654'),
(87, '21149', 'D1707175508', '2024-02-06 13:22:26', 4, NULL, 0, 1, '321654'),
(88, '10886', 'D1707175508', '2024-02-06 13:24:00', 4, NULL, 0, 1, '321654'),
(89, '20777', 'D0', '2024-02-07 03:41:10', 1, NULL, 0, 1, '321654'),
(90, '25067', 'D0', '2024-02-08 05:29:45', 1, NULL, 0, 1, '321654'),
(91, '11891', 'D0', '2024-02-15 14:14:49', 1, NULL, 0, 1, '6869'),
(92, '20940', 'D0', '2024-02-15 14:18:37', 5, NULL, 0, 1, '875'),
(93, '10852', 'D0', '2024-02-15 14:19:56', 5, NULL, 0, 1, '3828'),
(94, '29361', 'D0', '2024-02-15 14:21:17', 1, NULL, 0, 1, '321654'),
(95, '28328', 'D0', '2024-02-15 14:23:06', 1, NULL, 0, 1, '321654'),
(96, '12881', 'D0', '2024-02-15 14:23:27', 1, NULL, 0, 1, '6101'),
(97, '29725', 'D0', '2024-02-15 14:25:17', 1, NULL, 0, 1, '7024'),
(98, '26354', 'D0', '2024-02-15 14:26:37', 1, NULL, 0, 1, '784'),
(99, '19756', 'D0', '2024-02-15 16:03:09', 1, NULL, 0, 1, '321654'),
(100, '13885', 'D0', '2024-02-15 16:04:00', 5, NULL, 0, 1, '1942'),
(101, '16323', 'D0', '2024-02-15 16:06:05', 5, NULL, 0, 1, '222'),
(102, '25247', 'D0', '2024-02-15 16:06:31', 5, NULL, 0, 1, '2531'),
(103, '23944', 'D1707175508', '2024-02-15 16:07:15', 4, NULL, 0, 1, '321654'),
(104, '19494', 'D1707175508', '2024-02-15 16:09:21', 4, NULL, 0, 1, '750'),
(105, '12502', 'D1707175508', '2024-02-15 16:11:48', 4, NULL, 0, 1, '5844'),
(106, '25875', 'D1707175508', '2024-02-15 16:14:37', 4, NULL, 0, 1, '4467'),
(107, '15896', 'D0', '2024-02-19 10:01:34', 1, NULL, 0, 1, '3777'),
(108, '14235', 'D0', '2024-02-19 10:02:40', 1, NULL, 0, 1, '321654'),
(109, '22694', 'D0', '2024-02-19 10:03:06', 1, NULL, 0, 1, '5206'),
(110, '17204', 'D0', '2024-02-19 10:05:06', 1, NULL, 0, 1, '2428'),
(111, '20698', 'D0', '2024-02-19 10:08:07', 1, NULL, 0, 1, '3692'),
(112, '27806', 'D1707175508', '2024-02-19 10:08:39', 4, NULL, 0, 1, '282'),
(113, '13063', 'D0', '2024-02-19 10:09:45', 1, NULL, 0, 1, '321654'),
(114, '28880', 'D0', '2024-02-19 10:10:41', 1, NULL, 0, 1, '321654'),
(115, '23917', 'D0', '2024-02-19 10:11:24', 1, NULL, 0, 1, '321654'),
(116, '18049', 'D0', '2024-02-19 17:42:03', 1, NULL, 0, 1, '321654'),
(117, '17421', 'D0', '2024-02-19 17:42:31', 1, NULL, 0, 1, '321654'),
(118, '17975', 'D1707175508', '2024-02-19 17:43:48', 4, NULL, 0, 1, '321654'),
(119, '29241', 'D1707175508', '2024-02-19 17:49:52', 4, NULL, 0, 1, '321654'),
(120, '16674', 'D0', '2024-02-19 17:53:59', 1, NULL, 0, 1, '321654'),
(121, '25242', 'D0', '2024-02-19 17:55:32', 1, NULL, 0, 1, '321654'),
(122, '11092', 'D1707175508', '2024-02-19 17:57:48', 5, NULL, 0, 1, '321654'),
(123, '15083', 'D1707175508', '2024-02-19 17:59:59', 4, NULL, 0, 1, '321654'),
(124, '18046', 'D0', '2024-02-19 18:21:03', 1, NULL, 0, 1, '321654'),
(125, '11342', 'D1707175508', '2024-02-19 18:23:37', 5, NULL, 0, 1, '321654'),
(126, '21417', 'D1707175508', '2024-02-19 18:57:28', 4, NULL, 0, 1, '321654'),
(127, '27929', 'D0', '2024-02-19 18:59:44', 1, NULL, 0, 1, '321654'),
(128, '26418', 'D0', '2024-02-19 19:13:24', 1, NULL, 0, 1, '321654'),
(129, '20498', 'D1707175508', '2024-02-19 19:13:57', 4, NULL, 0, 1, '321654'),
(130, '21950', 'D0', '2024-02-19 19:20:54', 1, NULL, 0, 1, '321654'),
(131, '19447', 'D1707175508', '2024-02-19 19:22:03', 5, NULL, 0, 1, '321654'),
(132, '22297', 'D1707175508', '2024-02-19 20:25:20', 4, NULL, 0, 1, '321654'),
(133, '24909', 'D1707175508', '2024-02-22 10:13:30', 4, NULL, 0, 1, '321654'),
(134, '23524', 'D1707175508', '2024-02-22 10:20:23', 4, NULL, 0, 1, '321654'),
(135, '13202', 'D1707175508', '2024-02-22 10:35:33', 4, NULL, 0, 1, '480'),
(136, '26643', 'D0', '2024-02-22 10:41:40', 1, NULL, 0, 1, '9671'),
(137, '14280', 'D1707175508', '2024-02-22 10:42:06', 4, NULL, 0, 1, '8586'),
(138, '12972', 'D1707175508', '2024-02-22 13:55:56', 4, NULL, 0, 1, '321654'),
(139, '11457', 'D1707175508', '2024-02-22 13:58:43', 4, NULL, 0, 1, '67'),
(140, '29317', 'D0', '2024-02-22 14:02:05', 1, NULL, 0, 1, '5699'),
(141, '29101', 'D0', '2024-02-22 14:03:27', 1, NULL, 0, 1, '4512'),
(142, '13100', 'D0', '2024-02-22 14:04:12', 1, NULL, 0, 1, '4232'),
(143, '29347', 'D0', '2024-02-22 14:04:42', 1, NULL, 0, 1, '9990'),
(144, '14502', 'D0', '2024-02-22 14:05:38', 1, NULL, 0, 1, '6903'),
(145, '15301', 'D1707175508', '2024-02-22 14:07:49', 4, NULL, 0, 1, '458'),
(146, '22977', 'D1707175508', '2024-02-22 14:09:49', 4, NULL, 0, 1, '9072'),
(147, '26956', 'D0', '2024-02-22 14:14:55', 1, NULL, 0, 1, '321654'),
(148, '29775', 'D0', '2024-02-22 14:15:59', 1, NULL, 0, 1, '321654'),
(149, '19842', 'D1707175508', '2024-02-22 14:18:02', 4, NULL, 0, 1, '321654'),
(150, '25014', 'D1707175508', '2024-02-22 14:26:25', 4, NULL, 0, 1, '8403');

-- --------------------------------------------------------

--
-- Table structure for table `inbok`
--

CREATE TABLE `inbok` (
  `no` int UNSIGNED NOT NULL,
  `id` varchar(255) NOT NULL,
  `idpesan` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `konten` text,
  `date` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int NOT NULL,
  `id_merchant` varchar(250) NOT NULL,
  `nama_item` varchar(250) NOT NULL,
  `harga_item` int NOT NULL,
  `harga_promo` int NOT NULL,
  `kategori_item` varchar(200) NOT NULL,
  `deskripsi_item` text NOT NULL,
  `foto_item` varchar(250) NOT NULL,
  `created_item` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_item` varchar(10) NOT NULL,
  `status_promo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `id_merchant`, `nama_item`, `harga_item`, `harga_promo`, `kategori_item`, `deskripsi_item`, `foto_item`, `created_item`, `status_item`, `status_promo`) VALUES
(18, '19572', 'Pindang Baung Kepala ', 15000, 0, '14', 'Pindang Baung Kepala ', '1707176460-77041.jpg', '2024-02-05 23:41:00', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_news`
--

CREATE TABLE `kategori_news` (
  `id_kategori_news` int NOT NULL,
  `kategori` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_news`
--

INSERT INTO `kategori_news` (`id_kategori_news`, `kategori`, `created`) VALUES
(1, 'Wisata', '2023-06-30 13:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_k` bigint UNSIGNED NOT NULL,
  `merek` varchar(20) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `jenis` char(1) NOT NULL,
  `nomor_kendaraan` varchar(200) NOT NULL,
  `warna` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id_k`, `merek`, `tipe`, `jenis`, `nomor_kendaraan`, `warna`) VALUES
(12, 'honda', 'matic', '', 'be 4562 fh', 'hitam'),
(13, 'Yamaha', 'Jupiter MX', '', 'BE 4115 FV', 'Merah Marun');

-- --------------------------------------------------------

--
-- Table structure for table `kodepromo`
--

CREATE TABLE `kodepromo` (
  `id_promo` int NOT NULL,
  `nama_promo` varchar(250) NOT NULL,
  `kode_promo` varchar(250) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `nominal_promo` varchar(500) NOT NULL,
  `minimal` varchar(250) NOT NULL DEFAULT '0',
  `type_promo` varchar(250) NOT NULL,
  `expired` varchar(250) NOT NULL,
  `fitur` varchar(250) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `image_promo` varchar(500) NOT NULL,
  `jenis` varchar(255) DEFAULT 'semua',
  `status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kodepromo`
--

INSERT INTO `kodepromo` (`id_promo`, `nama_promo`, `kode_promo`, `keterangan`, `nominal_promo`, `minimal`, `type_promo`, `expired`, `fitur`, `id_user`, `image_promo`, `jenis`, `status`) VALUES
(3, 'Gratis Ongkir Seribu', 'DISC1RB', 'Diskon Ongkir Rp1000', '1000', '5000', 'fix', '2024-02-28', '1', NULL, 'aa453fd40b9dcded2bf08f5a71669eb8.jpg', 'semua', '1'),
(4, 'Diskon 1RB', 'OJEK1RB', 'Diskon Ojek Rp1000', '1000', '10000', 'fix', '2023-06-30', '1', NULL, 'dda40071fc53b697fdf91a16cd885a66.jpg', 'saldo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `komisi`
--

CREATE TABLE `komisi` (
  `id` int NOT NULL,
  `id_driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `komisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `waktu` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `komisi`
--

INSERT INTO `komisi` (`id`, `id_driver`, `komisi`, `waktu`) VALUES
(6, 'D1707175508', '550', '2024-02-15 16:07:27'),
(7, 'D1707175508', '2242.5', '2024-02-15 16:10:00'),
(8, 'D1707175508', '1995', '2024-02-19 17:38:35'),
(9, 'D1707175508', '550', '2024-02-19 17:44:28'),
(10, 'D1707175508', '550', '2024-02-19 17:50:05'),
(11, 'D1707175508', '550', '2024-02-19 18:16:09'),
(12, 'D1707175508', '550', '2024-02-19 18:58:22'),
(13, 'D1707175508', '550', '2024-02-19 19:17:42'),
(14, 'D1707175508', '550', '2024-02-19 20:26:02'),
(15, 'D1707175508', '550', '2024-02-22 10:16:17'),
(16, 'D1707175508', '550', '2024-02-22 10:20:38'),
(17, 'D1707175508', '1995', '2024-02-22 10:38:31'),
(18, 'D1707175508', '1995', '2024-02-22 10:43:53'),
(19, 'D1707175508', '550', '2024-02-22 13:56:11'),
(20, 'D1707175508', '1995', '2024-02-22 14:08:47'),
(21, 'D1707175508', '1995', '2024-02-22 14:10:36'),
(22, 'D1707175508', '550', '2024-02-22 14:18:46'),
(23, 'D1707175508', '1995', '2024-02-22 14:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `landingpage`
--

CREATE TABLE `landingpage` (
  `id` int NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'favicon.png',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hero_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hero_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hero_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'hero-img.png',
  `about_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `about_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apikey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_cs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_dv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_mer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `landingpage`
--

INSERT INTO `landingpage` (`id`, `favicon`, `title`, `alamat`, `kontak`, `email`, `hero_title`, `hero_desc`, `hero_image`, `about_title`, `about_desc`, `apikey`, `link_cs`, `link_dv`, `link_mer`, `api_server`, `youtube`) VALUES
(1, 'favicon.png', 'YoAnter', 'Jalan Yosudarso No.29 Kota Metro Lampung 34111', '+62 812 9108 0182', 'admin@yoanter.com', 'Satu perjalanan penuh kebaikan <span>YoAnter</span>', 'Aktivitas Kamu Jadi Lebih Mudah , Perjalanan , Kulineran Kami Bisa .', '1ad87f361899f9b56fb8cff93aa32922.png', 'Apa Itu YoAnter ?', 'YoAnter bukan hanya aplikasi penyedia layanan transportasi, pesan antar makanan, kurir, topup-pembayaran, dan belanja kebutuhan sehari-hari. YoAnter memiliki visi misi social 2.5%  penggunaan aplikasi YoAnter untuk kegiatan sedekah.', 'AIzaSyBLrW7IzWzbII0Sex8zrRmCyAZRT7iWqUs', 'https://drive.google.com/drive/folders/16W5baomE2GBc4ezNlffBDZokmX1KQGBj?usp=sharing', 'https://drive.google.com/drive/folders/16LOhzUOW_czuep-7gAsA_DrwrbaDdevk?usp=sharing', 'https://drive.google.com/drive/folders/167n__7DZwnCLAp-1hHULUg5A5QpxBd-K?usp=sharing', 'https://panel.yoanter.com/', 'https://youtu.be/TM-I8ZXCr0Q?si=X9zs7JWoqzhWVlT1');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `no` int NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `list_bank`
--

CREATE TABLE `list_bank` (
  `id_bank` int NOT NULL,
  `nama_bank` varchar(250) NOT NULL,
  `image_bank` varchar(250) NOT NULL,
  `rekening_bank` varchar(250) NOT NULL,
  `status_bank` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `list_bank`
--

INSERT INTO `list_bank` (`id_bank`, `nama_bank`, `image_bank`, `rekening_bank`, `status_bank`) VALUES
(1, 'PT YOSI DIGITAL LITERASI', '76158582dc47054e20465afdfd5db9d8.png', '1171464761', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_pelanggan`
--

CREATE TABLE `lokasi_pelanggan` (
  `id` int NOT NULL,
  `id_pelanggan` varchar(250) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `latitude` varchar(250) NOT NULL,
  `longitude` varchar(250) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `utama` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `id_merchant` varchar(250) NOT NULL,
  `id_fitur` varchar(100) NOT NULL,
  `nama_merchant` varchar(250) NOT NULL,
  `alamat_merchant` varchar(250) NOT NULL,
  `latitude_merchant` varchar(250) NOT NULL,
  `longitude_merchant` varchar(250) NOT NULL,
  `jam_buka` varchar(250) NOT NULL,
  `jam_tutup` varchar(250) NOT NULL,
  `category_merchant` varchar(100) NOT NULL,
  `foto_merchant` varchar(250) NOT NULL,
  `telepon_merchant` varchar(250) NOT NULL,
  `deskripsi_merchant` text NOT NULL,
  `phone_merchant` varchar(250) NOT NULL,
  `country_code_merchant` varchar(20) NOT NULL,
  `status_merchant` varchar(250) NOT NULL,
  `open_merchant` varchar(20) NOT NULL,
  `token_merchant` varchar(500) DEFAULT '1234',
  `ostoken` varchar(255) DEFAULT '1234'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`id_merchant`, `id_fitur`, `nama_merchant`, `alamat_merchant`, `latitude_merchant`, `longitude_merchant`, `jam_buka`, `jam_tutup`, `category_merchant`, `foto_merchant`, `telepon_merchant`, `deskripsi_merchant`, `phone_merchant`, `country_code_merchant`, `status_merchant`, `open_merchant`, `token_merchant`, `ostoken`) VALUES
('19572', '3', 'Pindang Baung ', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '-4.9090857693653716', '105.20631462335587', '01:34', '23:34', '2', 'Merchant-19572.jpg', '6212341234', '', '12341234', '+62', '1', '', 'ew1P8dm5Rwa1f15BKH7SHe:APA91bEk7EEyHbXLn1lW8z8nRbIfeAzVqu4AS6u0bnYGmMGz1K_e5sfseLHiwNcTzvyN6JKaKNKpLL_42fS6TqYt8EjwYd1j-N3zuyGiTrA1MU5l495umh4_61Dy-fdWuLtmqGl6WQDI', 'b4acb0b6-d878-43aa-adaa-dbde5f62b3f4');

-- --------------------------------------------------------

--
-- Table structure for table `midtrans`
--

CREATE TABLE `midtrans` (
  `no` int UNSIGNED NOT NULL,
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mitra`
--

CREATE TABLE `mitra` (
  `id_mitra` varchar(200) NOT NULL,
  `nama_mitra` varchar(250) NOT NULL,
  `jenis_identitas_mitra` varchar(250) NOT NULL,
  `nomor_identitas_mitra` varchar(250) NOT NULL,
  `alamat_mitra` varchar(250) NOT NULL,
  `email_mitra` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `telepon_mitra` varchar(250) NOT NULL,
  `phone_mitra` varchar(250) NOT NULL,
  `country_code_mitra` varchar(250) NOT NULL,
  `id_merchant` varchar(250) NOT NULL,
  `partner` varchar(250) NOT NULL,
  `status_mitra` varchar(10) NOT NULL,
  `created_mitra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mitra`
--

INSERT INTO `mitra` (`id_mitra`, `nama_mitra`, `jenis_identitas_mitra`, `nomor_identitas_mitra`, `alamat_mitra`, `email_mitra`, `password`, `telepon_mitra`, `phone_mitra`, `country_code_mitra`, `id_merchant`, `partner`, `status_mitra`, `created_mitra`) VALUES
('M19572', 'sari', 'KTP', '123456', 'metro', 'sari@gmail.com', '5b2de813b23de82181467ebb0b9b2bea23f67ce7', '6212341234', '12341234', '+62', '19572', '0', '1', '2024-02-05 23:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ikon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `nama`, `keterangan`, `harga`, `ikon`, `status`) VALUES
(3, 'Lainnya', 'Kirim Paket Dengan Ukuran Tidak Lebih Dari 2kg Yaah', '2500', 'b3df4a5e87457a326629154b9cdbcb3c.png', '1'),
(4, 'Dokumen', 'Tidak Menerima Surat Tanah / Rumah', '5000', 'fc3f5e40218a8904b29283df18bb0de8.png', '1'),
(5, 'Buah', 'Kirim Buah Tidak lebih Dari 25kg yah', '12000', '1959a312177d4ab140538258eec5798d.png', '1'),
(6, 'Elektronik', 'Pastikan Bisa Di Angkut Oleh Kendaraan Roda dua yah', '8500', '72b8dad0f9c0c1784b7568730aa998ad.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `payusettings`
--

CREATE TABLE `payusettings` (
  `id` int NOT NULL,
  `payu_key` varchar(250) NOT NULL,
  `payu_id` varchar(250) NOT NULL,
  `payu_salt` varchar(250) NOT NULL,
  `payu_debug` varchar(250) NOT NULL,
  `active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` varchar(200) NOT NULL,
  `fullnama` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `countrycode` varchar(20) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis` varchar(255) DEFAULT 'Laki-Laki',
  `tgl_lahir` varchar(50) NOT NULL,
  `rating_pelanggan` double NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `token` varchar(250) DEFAULT '1234',
  `fotopelanggan` varchar(500) NOT NULL,
  `refferal` varchar(255) NOT NULL,
  `ostoken` varchar(255) DEFAULT '12345'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `fullnama`, `email`, `no_telepon`, `countrycode`, `phone`, `password`, `created_on`, `jenis`, `tgl_lahir`, `rating_pelanggan`, `status`, `token`, `fotopelanggan`, `refferal`, `ostoken`) VALUES
('P21543', 'andika', 'andika@gmail.com', '621234512345', '+62', '1234512345', '5b2de813b23de82181467ebb0b9b2bea23f67ce7', '2024-02-05 23:28:16', 'Laki-Laki', '2024-02-06', 0, 1, 'erfdUDuhQfatTpU1bTqziL:APA91bE4HpKHk1IPQlAFnqKhmRCZZymRH9zesUoYTOxxJ2OvqqD63uEhsj1yhK6n7bj_hHWkT1VCxk1c56ipEMVA6OQrGeOnI2P6YIv_zwLGs-lIGSUoKKasUV1VPpYnE1e4gQlVn_2S', '1707175696-40452.jpg', 'OLUP5', 'f2fa4bf4-08e9-4776-849a-f9662db126df'),
('P7847', 'santi', 'santi@gmail.com', '62789', '+62', '789', 'fc1200c7a7aa52109d762a9f005b149abef01479', '2024-02-07 03:45:33', 'Perempuan', '2024-02-02', 0, 1, 'ePyrnLZAT5W3XYDGHmWelT:APA91bFKWa1Y0x0Smnrcg-BZyOAxGfVD_zuMcpj1Cckim_NtnAdsazAH3Wez2fThaa_DiBgTuBvIt9isb4aqvizIoXZlv2A3BRv7-tjsKC420-jZnzDEJFkTzEzkmeYiQrR3y9hTKhn4', '1707277533-56382.jpg', '9VNUV', '7038d29a-623e-417e-b16e-8430493afd3f'),
('P86708', 'yanti', 'yanti@gmail.com', '62987', '+62', '987', '8abcda2dba9a5c5c674e659333828582122c5f56', '2024-02-07 03:47:56', 'Perempuan', '2024-02-07', 0, 1, 'ePyrnLZAT5W3XYDGHmWelT:APA91bFKWa1Y0x0Smnrcg-BZyOAxGfVD_zuMcpj1Cckim_NtnAdsazAH3Wez2fThaa_DiBgTuBvIt9isb4aqvizIoXZlv2A3BRv7-tjsKC420-jZnzDEJFkTzEzkmeYiQrR3y9hTKhn4', '1707277676-23634.jpg', '5FWCK', '7038d29a-623e-417e-b16e-8430493afd3f');

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan`
--

CREATE TABLE `pendapatan` (
  `id` int NOT NULL,
  `id_driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `potongan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bersih` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `metode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Tunai',
  `waktu` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pendapatan`
--

INSERT INTO `pendapatan` (`id`, `id_driver`, `harga`, `potongan`, `bersih`, `metode`, `waktu`, `created_at`, `updated_at`, `deleted_at`) VALUES
(55, 'D1707175508', '22500', '2250', '20250', 'Tunai', '2024-02-06 00:08:03', NULL, NULL, NULL),
(56, 'D1707175508', '22500', '2250', '20250', 'Tunai', '2024-02-06 02:42:33', NULL, NULL, NULL),
(57, 'D1707196743', '5500', '550', '4950', 'Tunai', '2024-02-06 05:24:08', NULL, NULL, NULL),
(58, 'D1707175508', '11250', '1125', '10125', 'Tunai', '2024-02-06 13:07:56', NULL, NULL, NULL),
(59, 'D1707175508', '5500', '550', '4950', 'Tunai', '2024-02-06 13:13:37', NULL, NULL, NULL),
(60, 'D1707175508', '5500', '550', '4950', 'Tunai', '2024-02-06 13:22:36', NULL, NULL, NULL),
(61, 'D1707175508', '5500', '550', '4950', 'Tunai', '2024-02-06 13:27:46', NULL, NULL, NULL),
(62, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-15 16:07:27', NULL, NULL, NULL),
(63, 'D1707175508', '22425', '2242.5', '20182.5', 'Saldo', '2024-02-15 16:10:00', NULL, NULL, NULL),
(64, 'D1707175508', '22500', '2250', '20250', 'Tunai', '2024-02-15 16:12:56', NULL, NULL, NULL),
(65, 'D1707175508', '22500', '2250', '20250', 'Tunai', '2024-02-15 16:15:03', NULL, NULL, NULL),
(66, 'D1707175508', '19950', '1995', '17955', 'Saldo', '2024-02-19 17:38:35', NULL, NULL, NULL),
(67, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-19 17:44:28', NULL, NULL, NULL),
(68, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-19 17:50:05', NULL, NULL, NULL),
(69, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-19 18:16:09', NULL, NULL, NULL),
(70, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-19 18:58:22', NULL, NULL, NULL),
(71, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-19 19:17:42', NULL, NULL, NULL),
(72, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-19 20:26:02', NULL, NULL, NULL),
(73, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-22 10:16:17', NULL, NULL, NULL),
(74, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-22 10:20:38', NULL, NULL, NULL),
(75, 'D1707175508', '19950', '1995', '17955', 'Saldo', '2024-02-22 10:38:31', NULL, NULL, NULL),
(76, 'D1707175508', '19950', '1995', '17955', 'Saldo', '2024-02-22 10:43:53', NULL, NULL, NULL),
(77, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-22 13:56:11', NULL, NULL, NULL),
(78, 'D1707175508', '20000', '2000', '18000', 'Tunai', '2024-02-22 13:59:16', NULL, NULL, NULL),
(79, 'D1707175508', '19950', '1995', '17955', 'Saldo', '2024-02-22 14:08:47', NULL, NULL, NULL),
(80, 'D1707175508', '19950', '1995', '17955', 'Saldo', '2024-02-22 14:10:36', NULL, NULL, NULL),
(81, 'D1707175508', '5500', '550', '4950', 'Saldo', '2024-02-22 14:18:46', NULL, NULL, NULL),
(82, 'D1707175508', '19950', '1995', '17955', 'Saldo', '2024-02-22 14:27:45', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poin`
--

CREATE TABLE `poin` (
  `id` int UNSIGNED NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `poin` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `image_poin` varchar(255) DEFAULT NULL,
  `expire` date DEFAULT NULL,
  `status` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `poin`
--

INSERT INTO `poin` (`id`, `kode`, `nama`, `poin`, `keterangan`, `nilai`, `tipe`, `image_poin`, `expire`, `status`) VALUES
(3, '100000', '100000', '5', 'Tukarkan Point Anda', '5', '1', '102da2de786ad7078f56d7f738e7592e.png', '2024-01-26', '1');

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE `point` (
  `id` int UNSIGNED NOT NULL,
  `nama` varchar(200) NOT NULL,
  `id_user` varchar(200) NOT NULL DEFAULT '0',
  `point` varchar(200) DEFAULT '0',
  `tipe` varchar(200) NOT NULL,
  `reward` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT '0',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kode` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `promosi`
--

CREATE TABLE `promosi` (
  `id` bigint UNSIGNED NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_berakhir` date NOT NULL,
  `fitur_promosi` int NOT NULL,
  `link_promosi` varchar(500) DEFAULT NULL,
  `type_promosi` varchar(250) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `is_show` varchar(3) NOT NULL,
  `jenis` varchar(255) DEFAULT 'semua',
  `lokasi` varchar(255) DEFAULT 'all',
  `action` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `promosi`
--

INSERT INTO `promosi` (`id`, `tanggal_dibuat`, `tanggal_berakhir`, `fitur_promosi`, `link_promosi`, `type_promosi`, `foto`, `is_show`, `jenis`, `lokasi`, `action`) VALUES
(6, '2022-12-29 20:27:38', '2024-03-30', 1, 'service', 'service', '8774d5016ddc673208818356fbebc06e.png', '1', 'semua', 'all', 0),
(9, '2024-01-04 18:34:42', '2024-08-31', 3, 'service', 'service', '536eeae38306ed680ec452451acc2753.png', '1', 'semua', 'all', 0),
(4, '2022-12-29 20:06:15', '2024-04-29', 9, 'service', 'service', 'c10f12032182ea962ae528c44d94dea5.png', '1', 'semua', 'all', 0),
(7, '2023-08-13 17:02:30', '2024-09-30', 3, 'service', 'service', '55e3eb58717c0fa1d32a7d88e57dd3a3.png', '1', 'semua', 'all', 0),
(8, '2023-12-10 14:25:34', '2024-06-29', 5, 'service', 'service', 'e670b6231876651f9a5511980c67e2e6.png', '1', 'semua', 'all', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating_driver`
--

CREATE TABLE `rating_driver` (
  `nomor` bigint UNSIGNED NOT NULL,
  `id_pelanggan` varchar(200) NOT NULL,
  `id_driver` varchar(200) NOT NULL,
  `id_transaksi` int NOT NULL,
  `catatan` varchar(200) DEFAULT 'Good job',
  `rating` int NOT NULL,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `rating_driver`
--

INSERT INTO `rating_driver` (`nomor`, `id_pelanggan`, `id_driver`, `id_transaksi`, `catatan`, `rating`, `update_at`) VALUES
(85, 'P21543', 'D1707175508', 21269, 'Good job', 5, '2024-02-06 10:10:08'),
(86, 'P21543', 'D1707175508', 21149, 'Good job', 5, '2024-02-06 13:22:39'),
(87, 'P21543', 'D1707175508', 28295, 'Good job', 5, '2024-02-07 03:40:34'),
(88, 'P21543', 'D1707175508', 19097, 'Good job', 5, '2024-02-07 03:42:58'),
(89, 'P21543', 'D1707175508', 15083, 'Good job', 1, '2024-02-19 18:16:44');

-- --------------------------------------------------------

--
-- Table structure for table `redeem`
--

CREATE TABLE `redeem` (
  `id` int UNSIGNED NOT NULL,
  `iduser` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `poin` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refferal`
--

CREATE TABLE `refferal` (
  `id` int NOT NULL,
  `iduser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idtujuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kodeuser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kodeaccept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `refferal`
--

INSERT INTO `refferal` (`id`, `iduser`, `idtujuan`, `kodeuser`, `kodeaccept`, `reward`) VALUES
(1, 'P68150', 'P95972', 'ZN6T2', 'R3FQ9', '1'),
(2, 'P-7847', 'P21543', '9VNUV', 'OLUP5', '1'),
(3, 'P-86708', 'P21543', '5FWCK', 'OLUP5', '1');

-- --------------------------------------------------------

--
-- Table structure for table `requestjaket`
--

CREATE TABLE `requestjaket` (
  `id` int NOT NULL,
  `id_driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP,
  `diterima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `nomor` bigint UNSIGNED NOT NULL,
  `id_user` varchar(200) NOT NULL,
  `saldo` int DEFAULT '0',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`nomor`, `id_user`, `saldo`, `update_at`) VALUES
(24, 'P21543', 80050, '2024-02-05 23:28:16'),
(23, 'D1707175508', 117955, '2024-02-05 23:23:58'),
(25, 'M19572', 101995, '2024-02-05 23:34:57'),
(26, 'D1707196743', 9450, '2024-02-06 05:17:28'),
(27, 'P7847', 0, '2024-02-07 03:45:33'),
(28, 'P86708', 0, '2024-02-07 03:47:56');

-- --------------------------------------------------------

--
-- Table structure for table `status_transaksi`
--

CREATE TABLE `status_transaksi` (
  `id` bigint UNSIGNED NOT NULL,
  `status_transaksi` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `status_transaksi`
--

INSERT INTO `status_transaksi` (`id`, `status_transaksi`) VALUES
(3, 'diantar'),
(4, 'selesai'),
(5, 'batal'),
(2, 'diterima'),
(1, 'mencari'),
(6, 'menyiapkan'),
(7, 'dijalan');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no` int NOT NULL,
  `id` varchar(255) NOT NULL DEFAULT '',
  `id_pelanggan` varchar(200) NOT NULL,
  `id_driver` varchar(200) DEFAULT NULL,
  `order_fitur` tinyint NOT NULL,
  `start_latitude` varchar(20) NOT NULL,
  `start_longitude` varchar(20) NOT NULL,
  `end_latitude` varchar(20) NOT NULL,
  `end_longitude` varchar(20) NOT NULL,
  `home` varchar(255) DEFAULT '2',
  `jarak` double NOT NULL,
  `harga` int NOT NULL,
  `jasaapp` int DEFAULT '0',
  `waktu_order` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `waktu_selesai` timestamp NULL DEFAULT NULL,
  `estimasi_time` varchar(500) NOT NULL,
  `tanggal` varchar(250) DEFAULT NULL,
  `alamat_asal` varchar(500) NOT NULL,
  `alamat_tujuan` varchar(500) NOT NULL,
  `kredit_promo` int NOT NULL DEFAULT '0',
  `biaya_akhir` int DEFAULT '0',
  `pakai_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `rate` varchar(11) NOT NULL,
  `penumpang` int DEFAULT '1',
  `jenis` varchar(255) DEFAULT 'Semua',
  `isaccept` varchar(11) DEFAULT '0',
  `metode` varchar(255) DEFAULT 'tunai',
  `timeout` varchar(255) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no`, `id`, `id_pelanggan`, `id_driver`, `order_fitur`, `start_latitude`, `start_longitude`, `end_latitude`, `end_longitude`, `home`, `jarak`, `harga`, `jasaapp`, `waktu_order`, `waktu_selesai`, `estimasi_time`, `tanggal`, `alamat_asal`, `alamat_tujuan`, `kredit_promo`, `biaya_akhir`, `pakai_wallet`, `rate`, `penumpang`, `jenis`, `isaccept`, `metode`, `timeout`) VALUES
(81, '21269', 'P21543', 'D1707175508', 3, '-5.1133627498827', '105.30278027058', '-5.1169844', '105.302148', '2', 1, 7500, 0, '2024-02-06 07:01:49', '2024-02-06 07:08:03', '2 Menit', NULL, 'Jl. Yos Sudarso No.24, Metro, Kec. Metro Pusat, Kota Metro, Lampung 34111, Indonesia', 'Jl. Gotong Royong No.15, RT.015/RW.003, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34111, Indonesia', 0, 22500, 0, '5.0', 1, 'Semua', '0', '0', '0'),
(82, '13704', 'P21543', 'D1707175508', 3, '-5.1133627498827', '105.30278027058', '-5.1170091', '105.3022432', '2', 1, 7500, 0, '2024-02-06 09:30:30', '2024-02-06 09:42:33', '2 Menit', NULL, 'V8M2+4WG, Jl. Sakura, Metro, Kec. Metro Pusat, Kota Metro, Lampung 34125, Indonesia', 'Jl. Gotong Royong No.15, RT.015/RW.003, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34111, Indonesia', 0, 22500, 0, '', 1, 'Semua', '0', '0', '0'),
(83, '26005', 'P21543', NULL, 3, '-5.1133627498827', '105.30278027058', '-5.13742', '105.292628', '2', 4, 15000, 0, '2024-02-06 12:21:14', NULL, '8 Menit', NULL, 'V77V+34J, Mulyojati, Kec. Metro Bar., Kota Metro, Lampung 34121, Indonesia', 'Jl. Gotong Royong No.15, RT.015/RW.003, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34111, Indonesia', 0, 30000, 0, '', 1, 'Semua', '0', '0', '0'),
(84, '11108', 'P21543', 'D1707196743', 1, '-5.1374201345736', '105.29262810946', '-5.1327307488095', '105.29219560325', '1', 0.8, 5500, 0, '2024-02-06 12:21:45', '2024-02-06 12:24:08', '3 Menit', '06/Feb/2024', 'V77V+34J, Mulyojati, Kec. Metro Bar., Kota Metro, Lampung 34121, Indonesia', 'Jl. Pesantren No.16b, Mulyojati, Kec. Metro Bar., Kota Metro, Lampung 34125, Indonesia', 0, 5500, 0, '', 1, 'Semua', '0', '0', '0'),
(85, '28295', 'P21543', 'D1707175508', 1, '-5.1141578648874', '105.30372172594', '-5.0848672', '105.3027088', '1', 4.5, 11250, 0, '2024-02-06 20:00:00', '2024-02-06 20:07:56', '10 menit', '06/Feb/2024', 'V8P3+8G8, Jl. Jendral Sudirman, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34125, Indonesia', 'Jl. Dr. Sutomo No.28, Purwosari, Kec. Metro Utara, Kota Metro, Lampung 34114, Indonesia', 0, 11250, 0, '5.0', 1, 'Semua', '0', '0', '0'),
(86, '19097', 'P21543', 'D1707175508', 1, '-5.0916471467606', '105.30220460147', '-5.0848672', '105.3027088', '1', 1.1, 5500, 0, '2024-02-06 20:09:11', '2024-02-06 20:13:37', '3 menit', '06/Feb/2024', 'Jl. Dr. Sutomo No.130, Hadimulyo Tim., Kec. Metro Pusat, Kota Metro, Lampung 34111, Indonesia', 'Jl. Dr. Sutomo No.28, Purwosari, Kec. Metro Utara, Kota Metro, Lampung 34114, Indonesia', 0, 5500, 0, '5.0', 1, 'Semua', '0', '0', '0'),
(87, '21149', 'P21543', 'D1707175508', 1, '-5.1122236732858', '105.30756533146', '-5.114056', '105.3041532', '1', 0.9, 5500, 0, '2024-02-06 20:22:26', '2024-02-06 20:22:36', '2 menit', '06/Feb/2024', 'Jl. Diponegoro No.5, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34124, Indonesia', 'V8P3+9MC, Jl. Jendral Sudirman, Metro, Kec. Metro Pusat, Kabupaten Lampung Tengah, Lampung 34125, Indonesia', 0, 5500, 0, '5.0', 1, 'Semua', '0', '0', '0'),
(88, '10886', 'P21543', 'D1707175508', 1, '-5.11221599261', '105.30755426735', '-5.114056', '105.3041532', '1', 0.9, 5500, 0, '2024-02-06 20:24:00', '2024-02-06 20:27:46', '2 menit', '06/Feb/2024', 'Jl. Diponegoro No.5, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34124, Indonesia', 'V8P3+9MC, Jl. Jendral Sudirman, Metro, Kec. Metro Pusat, Kabupaten Lampung Tengah, Lampung 34125, Indonesia', 0, 5500, 0, '', 1, 'Semua', '0', '0', '0'),
(89, '20777', 'P21543', NULL, 9, '-5.1170274', '105.3022056', '-5.1114960123295', '105.30165910721', '5', 0.6, 5000, 0, '2024-02-07 10:41:10', NULL, '2 Menit', '07/Feb/2024', 'V8M2+4WG, Jl. Sakura, Metro, Kec. Metro Pusat, Kota Metro, Lampung 34125, Indonesia', 'Jl. Cut Nyak Dien No.94, Hadimulyo Bar., Kec. Metro Pusat, Kota Metro, Lampung 34125, Indonesia', 0, 5000, 0, '', 1, 'Semua', '0', '0', '1'),
(90, '25067', 'P21543', NULL, 1, '-5.1170117218644', '105.30224584043', '-5.1134909835328', '105.30251573771', '1', 0.5, 5500, 0, '2024-02-08 12:29:45', NULL, '2 menit', '08/Feb/2024', 'V8M2+4WG, Jl. Sakura, Metro, Kec. Metro Pusat, Kota Metro, Lampung 34125, Indonesia', 'Jl. Maulana No.42, Imopuro, Kec. Metro Pusat, Kota Metro, Lampung 34125, Indonesia', 0, 5500, 0, '', 1, 'Semua', '0', '0', '0'),
(91, '11891', 'P21543', NULL, 3, '-4.9091191739892', '105.20629785955', '-4.909129', '105.2063059', '2', 0, 5000, 0, '2024-02-15 14:14:49', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(92, '20940', 'P21543', NULL, 3, '-4.9091191739892', '105.20629785955', '-4.9091075', '105.2063179', '2', 0, 5000, 0, '2024-02-15 14:18:37', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(93, '10852', 'P21543', NULL, 3, '-4.9091191739892', '105.20629785955', '-4.9091075', '105.2063179', '2', 0, 5000, 0, '2024-02-15 14:19:56', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(94, '29361', 'P21543', NULL, 1, '-4.909107482371', '105.20631797612', '-4.9091879875089', '105.20752999932', '1', 0.1, 5500, 0, '2024-02-15 14:21:17', NULL, '1 Menit', '15/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'Perum Ex. Maria, lingkungan V, RT22 RW09, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(95, '28328', 'P21543', NULL, 1, '-4.909107482371', '105.20631797612', '-4.8965216', '105.222668', '1', 6.9, 17250, 0, '2024-02-15 14:23:06', NULL, '12 menit', '15/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'Jl. Tol Bakauheni - Terbanggi Besar, Terbanggi Besar, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung, Indonesia', 0, 17250, 1, '', 1, 'Semua', '0', '1', '0'),
(96, '12881', 'P21543', NULL, 3, '-4.9091191739892', '105.20629785955', '-4.9091307', '105.2062887', '2', 0, 5000, 0, '2024-02-15 14:23:27', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(97, '29725', 'P21543', NULL, 3, '-4.9091191739892', '105.20629785955', '-4.9091307', '105.2062887', '2', 0, 5000, 0, '2024-02-15 14:25:17', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(98, '26354', 'P21543', NULL, 3, '-4.9091191739892', '105.20629785955', '-4.9091307', '105.2062887', '2', 0, 5000, 0, '2024-02-15 14:26:37', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(99, '19756', 'P21543', NULL, 1, '-4.9324415393453', '105.20874571055', '-4.9327475148979', '105.20892810076', '1', 0, 5500, 0, '2024-02-15 16:03:09', NULL, '1 menit', '15/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3685+XJ3, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(100, '13885', 'P21543', NULL, 3, '-4.9065991244736', '105.21107252687', '-4.9324416', '105.2087457', '2', 3, 12500, 0, '2024-02-15 16:04:00', NULL, '7 Menit', NULL, 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36V6+8CV, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 125, 27375, 1, '', 1, 'Semua', '0', '1', '0'),
(101, '16323', 'P21543', NULL, 3, '-4.933555543545', '105.21022830158', '-4.9324344', '105.2087412', '2', 1, 7500, 0, '2024-02-15 16:06:05', NULL, '2 Menit', NULL, 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 22500, 0, '', 1, 'Semua', '0', '0', '0'),
(102, '25247', 'P21543', NULL, 3, '-4.933555543545', '105.21022830158', '-4.9324343', '105.2087402', '2', 1, 7500, 0, '2024-02-15 16:06:31', NULL, '2 Menit', NULL, 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 1075, 21425, 1, '', 1, 'Semua', '0', '1', '0'),
(103, '23944', 'P21543', 'D1707175508', 1, '-4.9324341905857', '105.20874034613', '-4.9324341905857', '105.20874034613', '1', 0, 5500, 0, '2024-02-15 16:07:15', '2024-02-15 09:07:27', '1 menit', '15/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(104, '19494', 'P21543', 'D1707175508', 3, '-4.933555543545', '105.21022830158', '-4.9324353', '105.2087374', '2', 1, 7500, 0, '2024-02-15 16:09:21', '2024-02-15 09:10:00', '2 Menit', NULL, 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 75, 22425, 1, '', 1, 'Semua', '0', '1', '0'),
(105, '12502', 'P21543', 'D1707175508', 3, '-4.933555543545', '105.21022830158', '-4.9324353', '105.2087374', '2', 1, 7500, 0, '2024-02-15 16:11:48', '2024-02-15 09:12:56', '2 Menit', NULL, 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 22500, 0, '', 1, 'Semua', '0', '0', '0'),
(106, '25875', 'P21543', 'D1707175508', 3, '-4.933555543545', '105.21022830158', '-4.9324353', '105.2087374', '2', 1, 7500, 0, '2024-02-15 16:14:37', '2024-02-15 09:15:03', '2 Menit', NULL, 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 22500, 0, '', 1, 'Semua', '0', '0', '0'),
(107, '15896', 'P21543', NULL, 3, '-4.933555543545', '105.21022830158', '-4.93071', '105.212035', '2', 1, 7500, 0, '2024-02-19 10:01:34', NULL, '2 Menit', NULL, '3696+PR2, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 22500, 0, '', 1, 'Semua', '0', '0', '0'),
(108, '14235', 'P21543', NULL, 1, '-4.9307099021197', '105.21203510463', '-4.9307099021197', '105.21203510463', '1', 0, 5500, 0, '2024-02-19 10:02:40', NULL, '1 Menit', '19/Feb/2024', '3696+PR2, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3696+PR2, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(109, '22694', 'P21543', NULL, 3, '-4.933555543545', '105.21022830158', '-4.93071', '105.212035', '2', 1, 7500, 0, '2024-02-19 10:03:06', NULL, '2 Menit', NULL, '3696+PR2, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '3686+H4G, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 22500, 0, '', 1, 'Semua', '0', '0', '0'),
(110, '17204', 'P21543', NULL, 3, '-4.9091171697118', '105.2062844485', '-4.906255', '105.2109133', '2', 1, 7500, 0, '2024-02-19 10:05:06', NULL, '3 Menit', NULL, 'Jalan Negara No.99 KM.67, 36V6+8CV, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 75, 22425, 1, '', 1, 'Semua', '0', '1', '0'),
(111, '20698', 'P21543', NULL, 3, '-4.9091171697118', '105.2062844485', '-4.9091274', '105.2062904', '2', 0, 5000, 0, '2024-02-19 10:08:07', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(112, '27806', 'P21543', 'D1707175508', 3, '-4.9091171697118', '105.2062844485', '-4.9091274', '105.2062904', '2', 0, 5000, 0, '2024-02-19 10:08:39', '2024-02-19 10:38:35', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(113, '13063', 'P21543', NULL, 1, '-4.9091315336996', '105.20628780127', '-4.9091315336996', '105.20628780127', '1', 0, 5500, 0, '2024-02-19 10:09:45', NULL, '1 Menit', '19/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(114, '28880', 'P21543', NULL, 1, '-4.9091315336996', '105.20628780127', '-4.9091315336996', '105.20628780127', '1', 0, 5500, 0, '2024-02-19 10:10:41', NULL, '1 menit', '19/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(115, '23917', 'P21543', NULL, 1, '-4.9091315336996', '105.20628780127', '-4.9091315336996', '105.20628780127', '1', 0, 5500, 0, '2024-02-19 10:11:24', NULL, '1 Menit', '19/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(116, '18049', 'P21543', NULL, 1, '-4.9324589091402', '105.20869206637', '-4.9324589091402', '105.20869206637', '1', 0, 5500, 0, '2024-02-19 17:42:03', NULL, '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(117, '17421', 'P21543', NULL, 1, '-4.9324589091402', '105.20869206637', '-4.9324589091402', '105.20869206637', '1', 0, 5500, 0, '2024-02-19 17:42:31', NULL, '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(118, '17975', 'P21543', 'D1707175508', 1, '-4.9324589091402', '105.20869206637', '-4.9324589091402', '105.20869206637', '1', 0, 5500, 0, '2024-02-19 17:43:48', '2024-02-19 10:44:28', '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(119, '29241', 'P21543', 'D1707175508', 1, '-4.9324502242428', '105.20869776607', '-4.9324502242428', '105.20869776607', '1', 0, 5500, 0, '2024-02-19 17:49:52', '2024-02-19 10:50:05', '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(120, '16674', 'P21543', NULL, 1, '-4.9324525624844', '105.20870279521', '-4.9324525624844', '105.20870279521', '1', 0, 5500, 0, '2024-02-19 17:53:59', NULL, '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(121, '25242', 'P21543', NULL, 1, '-4.9324525624844', '105.20870279521', '-4.9324525624844', '105.20870279521', '1', 0, 5500, 0, '2024-02-19 17:55:32', NULL, '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(122, '11092', 'P21543', 'D1707175508', 1, '-4.9324525624844', '105.20870279521', '-4.9324525624844', '105.20870279521', '1', 0, 5500, 0, '2024-02-19 17:57:48', NULL, '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(123, '15083', 'P21543', 'D1707175508', 1, '-4.9324518944154', '105.20870380104', '-4.9324518944154', '105.20870380104', '1', 0, 5500, 0, '2024-02-19 17:59:59', '2024-02-19 11:16:09', '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '1.0', 1, 'Semua', '0', '1', '0'),
(124, '18046', 'P21543', NULL, 1, '-4.9324736066587', '105.20873062313', '-4.9324736066587', '105.20873062313', '1', 0, 5500, 0, '2024-02-19 18:21:03', NULL, '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(125, '11342', 'P21543', 'D1707175508', 1, '-4.9324736066587', '105.20873062313', '-4.9324736066587', '105.20873062313', '1', 0, 5500, 0, '2024-02-19 18:23:37', NULL, '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(126, '21417', 'P21543', 'D1707175508', 1, '-4.9323967787177', '105.20877152681', '-4.9323967787177', '105.20877152681', '1', 0, 5500, 0, '2024-02-19 18:57:28', '2024-02-19 11:58:22', '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(127, '27929', 'P21543', NULL, 1, '-4.9323967787177', '105.20877152681', '-4.9323967787177', '105.20877152681', '1', 0, 5500, 0, '2024-02-19 18:59:44', NULL, '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(128, '26418', 'P21543', NULL, 1, '-4.9324148165829', '105.20872123539', '-4.9324148165829', '105.20872123539', '1', 0, 5500, 0, '2024-02-19 19:13:24', NULL, '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(129, '20498', 'P21543', 'D1707175508', 1, '-4.9324148165829', '105.20872123539', '-4.9324148165829', '105.20872123539', '1', 0, 5500, 0, '2024-02-19 19:13:57', '2024-02-19 12:17:42', '1 Menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(130, '21950', 'P21543', NULL, 1, '-4.9324148165829', '105.20872123539', '-4.9324148165829', '105.20872123539', '1', 0, 5500, 0, '2024-02-19 19:20:54', NULL, '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(131, '19447', 'P21543', 'D1707175508', 1, '-4.9324148165829', '105.20872123539', '-4.9324148165829', '105.20872123539', '1', 0, 5500, 0, '2024-02-19 19:22:03', NULL, '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(132, '22297', 'P21543', 'D1707175508', 1, '-4.932318948664', '105.20876582712', '-4.932318948664', '105.20876582712', '1', 0, 5500, 0, '2024-02-19 20:25:20', '2024-02-19 13:26:02', '1 menit', '19/Feb/2024', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 'jalan a.yani bandarjaya barat, Bandar Jaya Tim., Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(133, '24909', 'P21543', 'D1707175508', 1, '-4.9091539147962', '105.20631194115', '-4.9091539147962', '105.20631194115', '1', 0, 5500, 0, '2024-02-22 10:13:30', '2024-02-22 03:16:17', '1 Menit', '22/Feb/2024', '36Q4+XVP, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36Q4+XVP, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(134, '23524', 'P21543', 'D1707175508', 1, '-4.9091348741618', '105.20630724728', '-4.9091348741618', '105.20630724728', '1', 0, 5500, 0, '2024-02-22 10:20:23', '2024-02-22 03:20:38', '1 Menit', '22/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(135, '13202', 'P21543', 'D1707175508', 3, '-4.9090857693654', '105.20631462336', '-4.9091008', '105.2063281', '2', 0, 5000, 0, '2024-02-22 10:35:33', '2024-02-22 03:38:31', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(136, '26643', 'P21543', NULL, 3, '-4.9090857693654', '105.20631462336', '-4.9091008', '105.2063281', '2', 0, 5000, 0, '2024-02-22 10:41:40', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(137, '14280', 'P21543', 'D1707175508', 3, '-4.9090857693654', '105.20631462336', '-4.9091008', '105.2063281', '2', 0, 5000, 0, '2024-02-22 10:42:06', '2024-02-22 03:43:53', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(138, '12972', 'P21543', 'D1707175508', 1, '-4.9094679181618', '105.20688593388', '-4.9103862101348', '105.20668409765', '1', 0.5, 5500, 0, '2024-02-22 13:55:56', '2024-02-22 06:56:11', '2 Menit', '22/Feb/2024', '36Q4+XVP, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36Q4+XVP, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(139, '11457', 'P21543', 'D1707175508', 3, '-4.9090857693654', '105.20631462336', '-4.9091178', '105.2063136', '2', 0, 5000, 0, '2024-02-22 13:58:43', '2024-02-22 06:59:16', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 20000, 0, '', 1, 'Semua', '0', '0', '0'),
(140, '29317', 'P21543', NULL, 3, '-4.9090857693654', '105.20631462336', '-4.90912', '105.2063061', '2', 0, 5000, 0, '2024-02-22 14:02:05', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(141, '29101', 'P21543', NULL, 3, '-4.9090857693654', '105.20631462336', '-4.90912', '105.2063061', '2', 0, 5000, 0, '2024-02-22 14:03:27', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(142, '13100', 'P21543', NULL, 3, '-4.9090857693654', '105.20631462336', '-4.9091198', '105.2063024', '2', 0, 5000, 0, '2024-02-22 14:04:12', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 20000, 0, '', 1, 'Semua', '0', '0', '0'),
(143, '29347', 'P21543', NULL, 3, '-4.9090857693654', '105.20631462336', '-4.9091198', '105.2063024', '2', 0, 5000, 0, '2024-02-22 14:04:42', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 20000, 0, '', 1, 'Semua', '0', '0', '0'),
(144, '14502', 'P21543', NULL, 3, '-4.9090857693654', '105.20631462336', '-4.9091198', '105.2063024', '2', 0, 5000, 0, '2024-02-22 14:05:38', NULL, '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(145, '15301', 'P21543', 'D1707175508', 3, '-4.9090857693654', '105.20631462336', '-4.9091272', '105.2062869', '2', 0, 5000, 0, '2024-02-22 14:07:49', '2024-02-22 07:08:46', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(146, '22977', 'P21543', 'D1707175508', 3, '-4.9090857693654', '105.20631462336', '-4.9091272', '105.2062869', '2', 0, 5000, 0, '2024-02-22 14:09:49', '2024-02-22 07:10:36', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0'),
(147, '26956', 'P21543', NULL, 1, '-4.9091271910986', '105.20628679544', '-4.9091271910986', '105.20628679544', '1', 0, 5500, 0, '2024-02-22 14:14:55', NULL, '1 Menit', '22/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(148, '29775', 'P21543', NULL, 1, '-4.9090961247989', '105.20630355924', '-4.9090961247989', '105.20630355924', '1', 0, 5500, 0, '2024-02-22 14:15:59', NULL, '1 Menit', '22/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(149, '19842', 'P21543', 'D1707175508', 1, '-4.9090944545677', '105.20629685372', '-4.9090944545677', '105.20629685372', '1', 0, 5500, 0, '2024-02-22 14:18:02', '2024-02-22 07:18:46', '1 Menit', '22/Feb/2024', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 0, 5500, 1, '', 1, 'Semua', '0', '1', '0'),
(150, '25014', 'P21543', 'D1707175508', 3, '-4.9090857693654', '105.20631462336', '-4.9091093', '105.2062923', '2', 0, 5000, 0, '2024-02-22 14:26:25', '2024-02-22 07:27:44', '1 Menit', NULL, '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', '36R4+QPR, Yukum Jaya, Kec. Terbanggi Besar, Kabupaten Lampung Tengah, Lampung 34163, Indonesia', 50, 19950, 1, '', 1, 'Semua', '0', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail_merchant`
--

CREATE TABLE `transaksi_detail_merchant` (
  `id_trans_merchant` int NOT NULL,
  `id_transaksi` varchar(250) NOT NULL,
  `id_merchant` varchar(250) NOT NULL,
  `total_biaya` varchar(250) NOT NULL,
  `harga_akhir` varchar(250) NOT NULL,
  `struk` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `transaksi_detail_merchant`
--

INSERT INTO `transaksi_detail_merchant` (`id_trans_merchant`, `id_transaksi`, `id_merchant`, `total_biaya`, `harga_akhir`, `struk`, `created`) VALUES
(30, '21269', '19572', '15000', '', '6872', '2024-02-06 00:01:49'),
(31, '13704', '19572', '15000', '', '5600', '2024-02-06 02:30:30'),
(32, '26005', '19572', '15000', '', '2927', '2024-02-06 05:21:14'),
(33, '11891', '19572', '15000', '', '8541', '2024-02-15 07:14:49'),
(34, '20940', '19572', '15000', '', '3997', '2024-02-15 07:18:37'),
(35, '10852', '19572', '15000', '', '5293', '2024-02-15 07:19:56'),
(36, '12881', '19572', '15000', '', '1270', '2024-02-15 07:23:27'),
(37, '29725', '19572', '15000', '', '4486', '2024-02-15 07:25:17'),
(38, '26354', '19572', '15000', '', '7218', '2024-02-15 07:26:37'),
(39, '13885', '19572', '15000', '', '3991', '2024-02-15 09:04:00'),
(40, '16323', '19572', '15000', '', '7388', '2024-02-15 09:06:05'),
(41, '25247', '19572', '15000', '', '9695', '2024-02-15 09:06:31'),
(42, '19494', '19572', '15000', '', '5728', '2024-02-15 09:09:21'),
(43, '12502', '19572', '15000', '', '278', '2024-02-15 09:11:48'),
(44, '25875', '19572', '15000', '', '9772', '2024-02-15 09:14:37'),
(45, '15896', '19572', '15000', '', '9016', '2024-02-19 03:01:34'),
(46, '22694', '19572', '15000', '', '9119', '2024-02-19 03:03:06'),
(47, '17204', '19572', '15000', '', '1207', '2024-02-19 03:05:06'),
(48, '20698', '19572', '15000', '', '4464', '2024-02-19 03:08:07'),
(49, '27806', '19572', '15000', '', '3932', '2024-02-19 03:08:39'),
(50, '13202', '19572', '15000', '', '4503', '2024-02-22 03:35:33'),
(51, '26643', '19572', '15000', '', '6370', '2024-02-22 03:41:40'),
(52, '14280', '19572', '15000', '', '6442', '2024-02-22 03:42:06'),
(53, '11457', '19572', '15000', '', '4796', '2024-02-22 06:58:43'),
(54, '29317', '19572', '15000', '', '1265', '2024-02-22 07:02:05'),
(55, '29101', '19572', '15000', '', '5299', '2024-02-22 07:03:27'),
(56, '13100', '19572', '15000', '', '41', '2024-02-22 07:04:12'),
(57, '29347', '19572', '15000', '', '8382', '2024-02-22 07:04:42'),
(58, '14502', '19572', '15000', '', '648', '2024-02-22 07:05:38'),
(59, '15301', '19572', '15000', '', '6819', '2024-02-22 07:07:49'),
(60, '22977', '19572', '15000', '', '993', '2024-02-22 07:09:49'),
(61, '25014', '19572', '15000', '', '3429', '2024-02-22 07:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail_send`
--

CREATE TABLE `transaksi_detail_send` (
  `id_send` int NOT NULL,
  `id_transaksi` varchar(250) NOT NULL,
  `nama_barang` varchar(250) NOT NULL,
  `nama_pengirim` varchar(250) NOT NULL,
  `nama_penerima` varchar(250) NOT NULL,
  `telepon_pengirim` varchar(250) NOT NULL,
  `telepon_penerima` varchar(250) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_item`
--

CREATE TABLE `transaksi_item` (
  `id_trans_item` int NOT NULL,
  `id_item` varchar(200) NOT NULL,
  `id_merchant` varchar(100) NOT NULL,
  `id_transaksi` varchar(200) NOT NULL,
  `jumlah_item` varchar(200) NOT NULL,
  `catatan_item` text NOT NULL,
  `total_harga` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `transaksi_item`
--

INSERT INTO `transaksi_item` (`id_trans_item`, `id_item`, `id_merchant`, `id_transaksi`, `jumlah_item`, `catatan_item`, `total_harga`) VALUES
(32, '18', '19572', '21269', '1', '', '15000'),
(33, '18', '19572', '13704', '1', '', '15000'),
(34, '18', '19572', '26005', '1', '', '15000'),
(35, '18', '19572', '11891', '1', '', '15000'),
(36, '18', '19572', '20940', '1', '', '15000'),
(37, '18', '19572', '10852', '1', '', '15000'),
(38, '18', '19572', '12881', '1', '', '15000'),
(39, '18', '19572', '29725', '1', '', '15000'),
(40, '18', '19572', '26354', '1', '', '15000'),
(41, '18', '19572', '13885', '1', '', '15000'),
(42, '18', '19572', '16323', '1', '', '15000'),
(43, '18', '19572', '25247', '1', '', '15000'),
(44, '18', '19572', '19494', '1', '', '15000'),
(45, '18', '19572', '12502', '1', '', '15000'),
(46, '18', '19572', '25875', '1', '', '15000'),
(47, '18', '19572', '15896', '1', '', '15000'),
(48, '18', '19572', '22694', '1', '', '15000'),
(49, '18', '19572', '17204', '1', '', '15000'),
(50, '18', '19572', '20698', '1', '', '15000'),
(51, '18', '19572', '27806', '1', '', '15000'),
(52, '18', '19572', '13202', '1', '', '15000'),
(53, '18', '19572', '26643', '1', '', '15000'),
(54, '18', '19572', '14280', '1', '', '15000'),
(55, '18', '19572', '11457', '1', '', '15000'),
(56, '18', '19572', '29317', '1', '', '15000'),
(57, '18', '19572', '29101', '1', '', '15000'),
(58, '18', '19572', '13100', '1', '', '15000'),
(59, '18', '19572', '29347', '1', '', '15000'),
(60, '18', '19572', '14502', '1', '', '15000'),
(61, '18', '19572', '15301', '1', '', '15000'),
(62, '18', '19572', '22977', '1', '', '15000'),
(63, '18', '19572', '25014', '1', '', '15000');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_jasa`
--

CREATE TABLE `transaksi_jasa` (
  `no` int NOT NULL,
  `idtransaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idpelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `struk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'noimages.png',
  `biaya` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tempat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `catatan` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `transaksi_jasa`
--

INSERT INTO `transaksi_jasa` (`no`, `idtransaksi`, `idpelanggan`, `struk`, `biaya`, `tempat`, `catatan`, `tanggal`) VALUES
(1, '20777', 'P21543', 'noimages.png', NULL, 'hsjsjs', 'hdjsjs', '2024-02-07 10:41:10.000000');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade`
--

CREATE TABLE `upgrade` (
  `id` int NOT NULL,
  `iddriver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` bigint UNSIGNED NOT NULL,
  `voucher` varchar(20) NOT NULL,
  `tipe_voucher` char(1) NOT NULL,
  `untuk_fitur` int NOT NULL,
  `tanggal_expired` date NOT NULL,
  `nilai` int NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `count_to_use` int NOT NULL,
  `is_valid` varchar(3) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` bigint UNSIGNED NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `uuid` varchar(250) DEFAULT NULL,
  `invoice` varchar(250) DEFAULT NULL,
  `jumlah` int NOT NULL,
  `bank` varchar(250) NOT NULL,
  `nama_pemilik` varchar(500) NOT NULL DEFAULT 'sistem',
  `rekening` varchar(250) NOT NULL,
  `tujuan` varchar(250) DEFAULT '-',
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(500) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `foto_bukti` varchar(200) DEFAULT NULL,
  `reff` varchar(255) DEFAULT '0',
  `uplink` varchar(255) NOT NULL DEFAULT 'aplikasi'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `id_user`, `uuid`, `invoice`, `jumlah`, `bank`, `nama_pemilik`, `rekening`, `tujuan`, `waktu`, `type`, `status`, `foto_bukti`, `reff`, `uplink`) VALUES
(75, 'D1707175508', NULL, NULL, 10000, 'gjh', 'ghh', '1566', '-', '2024-02-06 00:03:13', 'topup', 1, NULL, '85273', 'aplikasi'),
(76, 'D1707175508', NULL, NULL, 15000, 'bri', 'ghj', '588', '-', '2024-02-06 00:05:42', 'topup', 1, NULL, '20866', 'aplikasi'),
(77, 'M19572', NULL, NULL, 2250, 'Kuliner', 'sari', 'wallet', '-', '2024-02-06 00:08:03', 'Order+', 1, NULL, 'Order17908', 'aplikasi'),
(78, 'D1707175508', NULL, NULL, 2250, 'Kuliner', 'adi', 'wallet', '-', '2024-02-06 00:08:03', 'Order-', 1, NULL, 'Order63621', 'aplikasi'),
(79, 'M19572', NULL, NULL, 2250, 'Kuliner', 'sari', 'wallet', '-', '2024-02-06 02:42:33', 'Order+', 1, NULL, 'Order35990', 'aplikasi'),
(80, 'D1707175508', NULL, NULL, 2250, 'Kuliner', 'adi', 'wallet', '-', '2024-02-06 02:42:33', 'Order-', 1, NULL, 'Order61960', 'aplikasi'),
(81, 'D1707196743', NULL, NULL, 10000, 'bri', 'Rafid Nurrohman ', '569701029374537', '-', '2024-02-06 05:20:21', 'topup', 1, NULL, '59983', 'aplikasi'),
(82, 'D1707196743', NULL, NULL, 550, 'Motor', 'rafidnur25', 'wallet', '-', '2024-02-06 05:24:08', 'Order-', 1, NULL, 'Order77127', 'aplikasi'),
(83, 'D1707175508', NULL, NULL, 1125, 'Motor', 'adi', 'wallet', '-', '2024-02-06 13:07:56', 'Order-', 1, NULL, 'Order65870', 'aplikasi'),
(84, 'D1707175508', NULL, NULL, 550, 'Motor', 'adi', 'wallet', '-', '2024-02-06 13:13:37', 'Order-', 1, NULL, 'Order55269', 'aplikasi'),
(85, 'D1707175508', NULL, NULL, 550, 'Motor', 'adi', 'wallet', '-', '2024-02-06 13:22:36', 'Order-', 1, NULL, 'Order26568', 'aplikasi'),
(86, 'D1707175508', NULL, NULL, 550, 'Motor', 'adi', 'wallet', '-', '2024-02-06 13:27:46', 'Order-', 1, NULL, 'Order21481', 'aplikasi'),
(87, 'P-7847', NULL, NULL, 200, 'Sistem', 'Sistem', 'Sistem', '-', '2024-02-07 03:45:33', 'refferal', 1, NULL, '9VNUV', 'aplikasi'),
(88, 'P21543', NULL, NULL, 300, 'Sistem', 'Sistem', 'Sistem', '-', '2024-02-07 03:45:33', 'refferal', 1, NULL, 'OLUP5', 'aplikasi'),
(89, 'P-86708', NULL, NULL, 200, 'Sistem', 'Sistem', 'Sistem', '-', '2024-02-07 03:47:56', 'refferal', 1, NULL, '5FWCK', 'aplikasi'),
(90, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-15 16:07:27', 'Order-', 1, NULL, 'Order23944', 'aplikasi'),
(91, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-15 16:07:27', 'Order+', 1, NULL, 'Order42236', 'aplikasi'),
(92, 'M19572', NULL, NULL, 2243, 'Kuliner', 'sari', 'wallet', '-', '2024-02-15 16:10:00', 'Order+', 1, NULL, 'Order62144', 'aplikasi'),
(93, 'P21543', NULL, NULL, 22425, 'Kuliner', 'andika', 'wallet', '-', '2024-02-15 16:10:00', 'Order-', 1, NULL, 'Order19494', 'aplikasi'),
(94, 'D1707175508', NULL, NULL, 20183, 'Kuliner', 'adi', 'wallet', '-', '2024-02-15 16:10:00', 'Order+', 1, NULL, 'Order51291', 'aplikasi'),
(95, 'M19572', NULL, NULL, 2250, 'Kuliner', 'sari', 'wallet', '-', '2024-02-15 16:12:56', 'Order+', 1, NULL, 'Order47808', 'aplikasi'),
(96, 'D1707175508', NULL, NULL, 2250, 'Kuliner', 'adi', 'wallet', '-', '2024-02-15 16:12:56', 'Order-', 1, NULL, 'Order49850', 'aplikasi'),
(97, 'M19572', NULL, NULL, 2250, 'Kuliner', 'sari', 'wallet', '-', '2024-02-15 16:15:03', 'Order+', 1, NULL, 'Order88161', 'aplikasi'),
(98, 'D1707175508', NULL, NULL, 2250, 'Kuliner', 'adi', 'wallet', '-', '2024-02-15 16:15:03', 'Order-', 1, NULL, 'Order90194', 'aplikasi'),
(99, 'M19572', NULL, NULL, 1995, 'Kuliner', 'sari', 'wallet', '-', '2024-02-19 17:38:35', 'Order+', 1, NULL, 'Order79861', 'aplikasi'),
(100, 'P21543', NULL, NULL, 19950, 'Kuliner', 'andika', 'wallet', '-', '2024-02-19 17:38:35', 'Order-', 1, NULL, 'Order27806', 'aplikasi'),
(101, 'D1707175508', NULL, NULL, 17955, 'Kuliner', 'adi', 'wallet', '-', '2024-02-19 17:38:35', 'Order+', 1, NULL, 'Order17232', 'aplikasi'),
(102, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-19 17:44:28', 'Order-', 1, NULL, 'Order17975', 'aplikasi'),
(103, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-19 17:44:28', 'Order+', 1, NULL, 'Order92871', 'aplikasi'),
(104, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-19 17:50:05', 'Order-', 1, NULL, 'Order29241', 'aplikasi'),
(105, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-19 17:50:05', 'Order+', 1, NULL, 'Order71618', 'aplikasi'),
(106, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-19 18:16:09', 'Order-', 1, NULL, 'Order15083', 'aplikasi'),
(107, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-19 18:16:09', 'Order+', 1, NULL, 'Order70893', 'aplikasi'),
(108, 'D1707175508', NULL, NULL, 1000, 'order', 'andika', 'sistem', '-', '2024-02-19 18:17:34', 'tip', 1, NULL, 'drivertip55508', 'aplikasi'),
(109, 'P21543', NULL, NULL, 1000, 'sistem', 'andika', 'sistem', '-', '2024-02-19 18:17:34', 'tip', 1, NULL, 'tip55508', 'aplikasi'),
(110, 'D1707175508', NULL, NULL, 1000, 'order', 'andika', 'sistem', '-', '2024-02-19 18:19:12', 'tip', 1, NULL, 'drivertip94510', 'aplikasi'),
(111, 'P21543', NULL, NULL, 1000, 'sistem', 'andika', 'sistem', '-', '2024-02-19 18:19:12', 'tip', 1, NULL, 'tip94510', 'aplikasi'),
(112, 'D1707175508', NULL, NULL, 1000, 'order', 'andika', 'sistem', '-', '2024-02-19 18:19:22', 'tip', 1, NULL, 'drivertip79978', 'aplikasi'),
(113, 'P21543', NULL, NULL, 1000, 'sistem', 'andika', 'sistem', '-', '2024-02-19 18:19:22', 'tip', 1, NULL, 'tip79978', 'aplikasi'),
(114, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-19 18:58:22', 'Order-', 1, NULL, 'Order21417', 'aplikasi'),
(115, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-19 18:58:22', 'Order+', 1, NULL, 'Order15671', 'aplikasi'),
(116, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-19 19:17:42', 'Order-', 1, NULL, 'Order20498', 'aplikasi'),
(117, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-19 19:17:42', 'Order+', 1, NULL, 'Order95013', 'aplikasi'),
(118, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-19 20:26:02', 'Order-', 1, NULL, 'Order22297', 'aplikasi'),
(119, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-19 20:26:02', 'Order+', 1, NULL, 'Order28400', 'aplikasi'),
(120, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-22 10:16:17', 'Order-', 1, NULL, 'Order24909', 'aplikasi'),
(121, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-22 10:16:17', 'Order+', 1, NULL, 'Order42071', 'aplikasi'),
(122, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-22 10:20:38', 'Order-', 1, NULL, 'Order23524', 'aplikasi'),
(123, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-22 10:20:38', 'Order+', 1, NULL, 'Order68725', 'aplikasi'),
(124, 'M19572', NULL, NULL, 1995, 'Kuliner', 'sari', 'wallet', '-', '2024-02-22 10:38:31', 'Order+', 1, NULL, 'Order90608', 'aplikasi'),
(125, 'P21543', NULL, NULL, 19950, 'Kuliner', 'andika', 'wallet', '-', '2024-02-22 10:38:31', 'Order-', 1, NULL, 'Order13202', 'aplikasi'),
(126, 'D1707175508', NULL, NULL, 17955, 'Kuliner', 'adi', 'wallet', '-', '2024-02-22 10:38:31', 'Order+', 1, NULL, 'Order30387', 'aplikasi'),
(127, 'M19572', NULL, NULL, 1995, 'Kuliner', 'sari', 'wallet', '-', '2024-02-22 10:43:53', 'Order+', 1, NULL, 'Order46935', 'aplikasi'),
(128, 'P21543', NULL, NULL, 19950, 'Kuliner', 'andika', 'wallet', '-', '2024-02-22 10:43:53', 'Order-', 1, NULL, 'Order14280', 'aplikasi'),
(129, 'D1707175508', NULL, NULL, 17955, 'Kuliner', 'adi', 'wallet', '-', '2024-02-22 10:43:53', 'Order+', 1, NULL, 'Order59270', 'aplikasi'),
(130, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-22 13:56:11', 'Order-', 1, NULL, 'Order12972', 'aplikasi'),
(131, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-22 13:56:11', 'Order+', 1, NULL, 'Order29165', 'aplikasi'),
(132, 'M19572', NULL, NULL, 2000, 'Kuliner', 'sari', 'wallet', '-', '2024-02-22 13:59:16', 'Order+', 1, NULL, 'Order34087', 'aplikasi'),
(133, 'D1707175508', NULL, NULL, 2000, 'Kuliner', 'adi', 'wallet', '-', '2024-02-22 13:59:16', 'Order-', 1, NULL, 'Order14745', 'aplikasi'),
(134, 'M19572', NULL, NULL, 1995, 'Kuliner', 'sari', 'wallet', '-', '2024-02-22 14:08:46', 'Order+', 1, NULL, 'Order24721', 'aplikasi'),
(135, 'P21543', NULL, NULL, 19950, 'Kuliner', 'andika', 'wallet', '-', '2024-02-22 14:08:47', 'Order-', 1, NULL, 'Order15301', 'aplikasi'),
(136, 'D1707175508', NULL, NULL, 17955, 'Kuliner', 'adi', 'wallet', '-', '2024-02-22 14:08:47', 'Order+', 1, NULL, 'Order87448', 'aplikasi'),
(137, 'M19572', NULL, NULL, 1995, 'Kuliner', 'sari', 'wallet', '-', '2024-02-22 14:10:36', 'Order+', 1, NULL, 'Order68338', 'aplikasi'),
(138, 'P21543', NULL, NULL, 19950, 'Kuliner', 'andika', 'wallet', '-', '2024-02-22 14:10:36', 'Order-', 1, NULL, 'Order22977', 'aplikasi'),
(139, 'D1707175508', NULL, NULL, 17955, 'Kuliner', 'adi', 'wallet', '-', '2024-02-22 14:10:36', 'Order+', 1, NULL, 'Order89626', 'aplikasi'),
(140, 'P21543', NULL, NULL, 5500, 'Motor', 'andika', 'wallet', '-', '2024-02-22 14:18:46', 'Order-', 1, NULL, 'Order19842', 'aplikasi'),
(141, 'D1707175508', NULL, NULL, 4950, 'Motor', 'adi', 'wallet', '-', '2024-02-22 14:18:46', 'Order+', 1, NULL, 'Order16939', 'aplikasi'),
(142, 'M19572', NULL, NULL, 1995, 'Kuliner', 'sari', 'wallet', '-', '2024-02-22 14:27:45', 'Order+', 1, NULL, 'Order42535', 'aplikasi'),
(143, 'P21543', NULL, NULL, 19950, 'Kuliner', 'andika', 'wallet', '-', '2024-02-22 14:27:45', 'Order-', 1, NULL, 'Order25014', 'aplikasi'),
(144, 'D1707175508', NULL, NULL, 17955, 'Kuliner', 'adi', 'wallet', '-', '2024-02-22 14:27:45', 'Order+', 1, NULL, 'Order72556', 'aplikasi');

-- --------------------------------------------------------

--
-- Table structure for table `webview`
--

CREATE TABLE `webview` (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ikon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `webview`
--

INSERT INTO `webview` (`id`, `nama`, `url`, `ikon`, `status`) VALUES
(1, 'Tokopedia', 'https://tokopedia.com', 'tokopedia.png', '1'),
(2, 'Traveloka', 'https://www.traveloka.com', 'traveloka.jpg', '1'),
(3, 'KAI', 'https://www.kai.id', 'kai.png', '1'),
(4, 'Shoope', 'https://shopee.co.id', 'shoope.png', '1'),
(6, 'Instagram', 'https://www.instagram.com/', 'instagram.png', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_akun`
--
ALTER TABLE `acc_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_operasional`
--
ALTER TABLE `acc_operasional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`) USING BTREE;

--
-- Indexes for table `berkas_driver`
--
ALTER TABLE `berkas_driver`
  ADD PRIMARY KEY (`id_berkas`) USING BTREE;

--
-- Indexes for table `category_item`
--
ALTER TABLE `category_item`
  ADD PRIMARY KEY (`id_kategori_item`) USING BTREE;

--
-- Indexes for table `category_merchant`
--
ALTER TABLE `category_merchant`
  ADD PRIMARY KEY (`id_kategori_merchant`) USING BTREE;

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `chat_merchant`
--
ALTER TABLE `chat_merchant`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `config_driver`
--
ALTER TABLE `config_driver`
  ADD PRIMARY KEY (`id_driver`) USING BTREE,
  ADD KEY `latitude` (`latitude`) USING BTREE,
  ADD KEY `longitude` (`longitude`) USING BTREE;

--
-- Indexes for table `config_user`
--
ALTER TABLE `config_user`
  ADD PRIMARY KEY (`id_user`) USING BTREE,
  ADD KEY `latitude` (`latitude`) USING BTREE,
  ADD KEY `longitude` (`longitude`) USING BTREE;

--
-- Indexes for table `digi_brand`
--
ALTER TABLE `digi_brand`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `digi_history`
--
ALTER TABLE `digi_history`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `digi_kategori`
--
ALTER TABLE `digi_kategori`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD UNIQUE KEY `no_telepon` (`no_telepon`) USING BTREE,
  ADD UNIQUE KEY `no_ktp` (`no_ktp`) USING BTREE;

--
-- Indexes for table `driver_job`
--
ALTER TABLE `driver_job`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `fitur`
--
ALTER TABLE `fitur`
  ADD PRIMARY KEY (`id_fitur`) USING BTREE;

--
-- Indexes for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `history_transaksi`
--
ALTER TABLE `history_transaksi`
  ADD PRIMARY KEY (`nomor`,`id_transaksi`) USING BTREE,
  ADD UNIQUE KEY `nomor` (`nomor`) USING BTREE;

--
-- Indexes for table `inbok`
--
ALTER TABLE `inbok`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`) USING BTREE;

--
-- Indexes for table `kategori_news`
--
ALTER TABLE `kategori_news`
  ADD PRIMARY KEY (`id_kategori_news`) USING BTREE;

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_k`) USING BTREE,
  ADD UNIQUE KEY `id` (`id_k`) USING BTREE;

--
-- Indexes for table `kodepromo`
--
ALTER TABLE `kodepromo`
  ADD PRIMARY KEY (`id_promo`) USING BTREE;

--
-- Indexes for table `komisi`
--
ALTER TABLE `komisi`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `landingpage`
--
ALTER TABLE `landingpage`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- Indexes for table `list_bank`
--
ALTER TABLE `list_bank`
  ADD PRIMARY KEY (`id_bank`) USING BTREE;

--
-- Indexes for table `lokasi_pelanggan`
--
ALTER TABLE `lokasi_pelanggan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`id_merchant`) USING BTREE;

--
-- Indexes for table `midtrans`
--
ALTER TABLE `midtrans`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- Indexes for table `mitra`
--
ALTER TABLE `mitra`
  ADD PRIMARY KEY (`id_mitra`) USING BTREE,
  ADD UNIQUE KEY `email_mitra` (`email_mitra`) USING BTREE,
  ADD UNIQUE KEY `telepon_mitra` (`telepon_mitra`) USING BTREE;

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payusettings`
--
ALTER TABLE `payusettings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`,`refferal`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD UNIQUE KEY `no_telepon` (`no_telepon`) USING BTREE,
  ADD UNIQUE KEY `phone` (`phone`) USING BTREE;

--
-- Indexes for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `poin`
--
ALTER TABLE `poin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `point`
--
ALTER TABLE `point`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promosi`
--
ALTER TABLE `promosi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `rating_driver`
--
ALTER TABLE `rating_driver`
  ADD PRIMARY KEY (`nomor`) USING BTREE,
  ADD UNIQUE KEY `nomor` (`nomor`) USING BTREE;

--
-- Indexes for table `redeem`
--
ALTER TABLE `redeem`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `refferal`
--
ALTER TABLE `refferal`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `requestjaket`
--
ALTER TABLE `requestjaket`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`nomor`) USING BTREE,
  ADD UNIQUE KEY `nomor` (`nomor`) USING BTREE,
  ADD UNIQUE KEY `id_user` (`id_user`) USING BTREE;

--
-- Indexes for table `status_transaksi`
--
ALTER TABLE `status_transaksi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no`,`id_pelanggan`,`waktu_order`,`id`) USING BTREE,
  ADD UNIQUE KEY `nomor` (`id`(250)) USING BTREE;

--
-- Indexes for table `transaksi_detail_merchant`
--
ALTER TABLE `transaksi_detail_merchant`
  ADD PRIMARY KEY (`id_trans_merchant`) USING BTREE;

--
-- Indexes for table `transaksi_detail_send`
--
ALTER TABLE `transaksi_detail_send`
  ADD PRIMARY KEY (`id_send`) USING BTREE;

--
-- Indexes for table `transaksi_item`
--
ALTER TABLE `transaksi_item`
  ADD PRIMARY KEY (`id_trans_item`) USING BTREE;

--
-- Indexes for table `transaksi_jasa`
--
ALTER TABLE `transaksi_jasa`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- Indexes for table `upgrade`
--
ALTER TABLE `upgrade`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD UNIQUE KEY `reff` (`reff`) USING BTREE;

--
-- Indexes for table `webview`
--
ALTER TABLE `webview`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_akun`
--
ALTER TABLE `acc_akun`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `acc_operasional`
--
ALTER TABLE `acc_operasional`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `akses`
--
ALTER TABLE `akses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `berkas_driver`
--
ALTER TABLE `berkas_driver`
  MODIFY `id_berkas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category_item`
--
ALTER TABLE `category_item`
  MODIFY `id_kategori_item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category_merchant`
--
ALTER TABLE `category_merchant`
  MODIFY `id_kategori_merchant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chat_merchant`
--
ALTER TABLE `chat_merchant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `digi_brand`
--
ALTER TABLE `digi_brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `digi_history`
--
ALTER TABLE `digi_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `digi_kategori`
--
ALTER TABLE `digi_kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver_job`
--
ALTER TABLE `driver_job`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fitur`
--
ALTER TABLE `fitur`
  MODIFY `id_fitur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `forgot_password`
--
ALTER TABLE `forgot_password`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `history_transaksi`
--
ALTER TABLE `history_transaksi`
  MODIFY `nomor` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `inbok`
--
ALTER TABLE `inbok`
  MODIFY `no` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kategori_news`
--
ALTER TABLE `kategori_news`
  MODIFY `id_kategori_news` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_k` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kodepromo`
--
ALTER TABLE `kodepromo`
  MODIFY `id_promo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `komisi`
--
ALTER TABLE `komisi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `no` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `list_bank`
--
ALTER TABLE `list_bank`
  MODIFY `id_bank` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lokasi_pelanggan`
--
ALTER TABLE `lokasi_pelanggan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `midtrans`
--
ALTER TABLE `midtrans`
  MODIFY `no` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payusettings`
--
ALTER TABLE `payusettings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendapatan`
--
ALTER TABLE `pendapatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `poin`
--
ALTER TABLE `poin`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `point`
--
ALTER TABLE `point`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promosi`
--
ALTER TABLE `promosi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rating_driver`
--
ALTER TABLE `rating_driver`
  MODIFY `nomor` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `redeem`
--
ALTER TABLE `redeem`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refferal`
--
ALTER TABLE `refferal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requestjaket`
--
ALTER TABLE `requestjaket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saldo`
--
ALTER TABLE `saldo`
  MODIFY `nomor` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `status_transaksi`
--
ALTER TABLE `status_transaksi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `transaksi_detail_merchant`
--
ALTER TABLE `transaksi_detail_merchant`
  MODIFY `id_trans_merchant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `transaksi_detail_send`
--
ALTER TABLE `transaksi_detail_send`
  MODIFY `id_send` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_item`
--
ALTER TABLE `transaksi_item`
  MODIFY `id_trans_item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `transaksi_jasa`
--
ALTER TABLE `transaksi_jasa`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `upgrade`
--
ALTER TABLE `upgrade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `webview`
--
ALTER TABLE `webview`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

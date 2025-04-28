
--  Tugas Modul 1
-- Database: digital_dream_store

-- Admin
-- 1 kolom
SELECT adm.nama_admin AS nama_admin
FROM digital_dream_store.admin AS adm;

-- 2 kolom
SELECT adm.nama_admin AS nama_admin, adm.metode_pembayaran AS metode_pembayaran
FROM digital_dream_store.admin AS adm;

-- Pelanggan
-- 1 kolom
SELECT plg.nama_pelanggan AS nama_pelanggan
FROM digital_dream_store.pelanggan AS plg;

-- 2 kolom
SELECT plg.nama_pelanggan AS nama_pelanggan, plg.alamat AS alamat_pelanggan
FROM digital_dream_store.pelanggan AS plg;

-- Produk
-- 1 kolom
SELECT prd.nama_produk AS nama_produk
FROM digital_dream_store.produk AS prd;

-- 2 kolom
SELECT prd.nama_produk AS nama_produk, prd.harga AS harga_produk
FROM digital_dream_store.produk AS prd;

-- Transaksi
-- 1 kolom
SELECT trx.nomor_pesanan AS nomor_pesanan
FROM digital_dream_store.transaksi AS trx;

-- 2 kolom
SELECT trx.nomor_pesanan AS nomor_pesanan, trx.status_pengiriman AS status_pengiriman
FROM digital_dream_store.transaksi AS trx;

-- Pengiriman
-- 1 kolom
SELECT pgr.nomor_resi AS nomor_resi
FROM digital_dream_store.pengiriman AS pgr;

-- 2 kolom
SELECT pgr.nomor_resi AS nomor_resi, pgr.jasa_pengiriman AS jasa_pengiriman
FROM digital_dream_store.pengiriman AS pgr;

-- Ulasan
-- 1 kolom
SELECT ula.nama_pengguna AS nama_pengguna
FROM digital_dream_store.ulasan AS ula;

-- 2 kolom
SELECT ula.nama_pengguna AS nama_pengguna, ula.rating AS rating_produk
FROM digital_dream_store.ulasan AS ula;

-- Promo
-- 1 kolom
SELECT prm.nama_promo AS nama_promo
FROM digital_dream_store.promo AS prm;

-- 2 kolom
SELECT prm.nama_promo AS nama_promo, prm.jenis_diskon AS jenis_diskon
FROM digital_dream_store.promo AS prm;



-- Membuat Database
CREATE DATABASE IF NOT EXISTS digital_dream_store;
USE digital_dream_store;

-- Bersihkan tabel jika sudah ada
DROP TABLE IF EXISTS pengiriman;
DROP TABLE IF EXISTS transaksi;
DROP TABLE IF EXISTS ulasan;
DROP TABLE IF EXISTS produk;
DROP TABLE IF EXISTS pelanggan;
DROP TABLE IF EXISTS promo;
DROP TABLE IF EXISTS admin;

-- Tabel Admin
CREATE TABLE admin (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nama_admin VARCHAR(100),
    profil_bisnis TEXT,
    metode_pengiriman VARCHAR(100),
    metode_pembayaran VARCHAR(100)
);

-- Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    alamat TEXT,
    nomor_telepon VARCHAR(15),
    riwayat_pembelian TEXT
);

-- Tabel Produk
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    deskripsi_produk TEXT,
    harga DECIMAL(10,2),
    stok INT,
    kategori_produk VARCHAR(50)
);

-- Tabel Transaksi
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    nomor_pesanan VARCHAR(50),
    tanggal_pemesanan DATE,
    tanggal_pengiriman DATE,
    metode_pembayaran VARCHAR(50),
    status_pengiriman VARCHAR(50),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Tabel Pengiriman
CREATE TABLE pengiriman (
    id_pengiriman INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT,
    nomor_resi VARCHAR(100),
    jasa_pengiriman VARCHAR(100),
    tanggal_pengiriman DATE,
    lokasi_pengiriman VARCHAR(100),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);

-- Tabel Ulasan
CREATE TABLE ulasan (
    id_ulasan INT AUTO_INCREMENT PRIMARY KEY,
    id_produk INT,
    nama_pengguna VARCHAR(100),
    komentar TEXT,
    rating INT,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Tabel Promo
CREATE TABLE promo (
    id_promo INT AUTO_INCREMENT PRIMARY KEY,
    nama_promo VARCHAR(100),
    jenis_diskon VARCHAR(50),
    periode_promo VARCHAR(50),
    syarat_ketentuan TEXT
);

-- Insert Data Dummy

-- Admin
INSERT INTO admin (nama_admin, profil_bisnis, metode_pengiriman, metode_pembayaran) VALUES
('Rifki Admin', 'Menjual gadget terbaru', 'JNE', 'Transfer Bank');

-- Pelanggan
INSERT INTO pelanggan (nama_pelanggan, alamat, nomor_telepon, riwayat_pembelian) VALUES
('Andi ', 'Mataram', '081234567890', 'Smartphone'),
('Budi ', 'Lombok Barat', '081234567891', 'Laptop'),
('Citra ', 'Lombok Timur', '081234567892', 'Smartwatch'),
(' Ayu', 'Mataram', '081234567893', 'Tablet'),
('Eko ', 'Lombok Tengah', '081234567894', 'Headphone'),
('Fajar ', 'Lombok Utara', '081234567895', 'Kamera'),
('Gita ', 'Mataram', '081234567896', 'Keyboard'),
('Hendra ', 'Lombok Barat', '081234567897', 'Mouse'),
('Intan ', 'Mataram', '081234567898', 'Monitor'),
('Joko ', 'Lombok Tengah', '081234567899', 'Printer');

-- Produk
INSERT INTO produk (nama_produk, deskripsi_produk, harga, stok, kategori_produk) VALUES
('iPhone 15', 'Smartphone Apple terbaru', 20000000, 10, 'Smartphone'),
('Samsung Galaxy S24', 'Smartphone Android terbaru', 15000000, 15, 'Smartphone'),
('Macbook Air M2', 'Laptop ringan Apple', 25000000, 5, 'Laptop'),
('Dell XPS 13', 'Laptop bisnis premium', 22000000, 7, 'Laptop'),
('Apple Watch 9', 'Smartwatch kesehatan Apple', 8000000, 20, 'Smartwatch'),
('Sony WH-1000XM5', 'Headphone noise cancelling', 5000000, 25, 'Audio'),
('Canon EOS M50', 'Kamera mirrorless', 8500000, 8, 'Kamera'),
('Logitech MX Keys', 'Keyboard wireless premium', 2000000, 30, 'Aksesori'),
('LG Ultragear Monitor', 'Monitor gaming 27 inch', 6000000, 12, 'Monitor'),
('HP LaserJet MFP', 'Printer laser multifungsi', 4000000, 10, 'Printer');

-- Transaksi
INSERT INTO transaksi (id_pelanggan, nomor_pesanan, tanggal_pemesanan, tanggal_pengiriman, metode_pembayaran, status_pengiriman) VALUES
(1, 'ORD1001', '2025-04-01', '2025-04-03', 'Transfer Bank', 'Dikirim'),
(2, 'ORD1002', '2025-04-02', '2025-04-04', 'COD', 'Dikirim'),
(3, 'ORD1003', '2025-04-03', '2025-04-05', 'Transfer Bank', 'Dalam Proses'),
(4, 'ORD1004', '2025-04-04', '2025-04-06', 'Kartu Kredit', 'Dikirim'),
(5, 'ORD1005', '2025-04-05', '2025-04-07', 'Transfer Bank', 'Dikirim'),
(6, 'ORD1006', '2025-04-06', '2025-04-08', 'COD', 'Dalam Proses'),
(7, 'ORD1007', '2025-04-07', '2025-04-09', 'Kartu Kredit', 'Dikirim'),
(8, 'ORD1008', '2025-04-08', '2025-04-10', 'Transfer Bank', 'Dikirim'),
(9, 'ORD1009', '2025-04-09', '2025-04-11', 'COD', 'Dalam Proses'),
(10,'ORD1010', '2025-04-10', '2025-04-12', 'Transfer Bank', 'Dikirim');

-- Pengiriman
INSERT INTO pengiriman (id_transaksi, nomor_resi, jasa_pengiriman, tanggal_pengiriman, lokasi_pengiriman) VALUES
(1, 'RESI1001', 'JNE', '2025-04-03', 'Mataram'),
(2, 'RESI1002', 'SiCepat', '2025-04-04', 'Lombok Barat'),
(3, 'RESI1003', 'J&T', '2025-04-05', 'Lombok Timur'),
(4, 'RESI1004', 'TIKI', '2025-04-06', 'Mataram'),
(5, 'RESI1005', 'JNE', '2025-04-07', 'Lombok Tengah'),
(6, 'RESI1006', 'SiCepat', '2025-04-08', 'Lombok Utara'),
(7, 'RESI1007', 'J&T', '2025-04-09', 'Mataram'),
(8, 'RESI1008', 'TIKI', '2025-04-10', 'Lombok Barat'),
(9, 'RESI1009', 'JNE', '2025-04-11', 'Mataram'),
(10,'RESI1010', 'SiCepat', '2025-04-12', 'Lombok Tengah');

-- Ulasan
INSERT INTO ulasan (id_produk, nama_pengguna, komentar, rating) VALUES
(1, 'Andi', 'Sangat puas dengan produknya!', 5),
(2, 'Budi', 'Mantap dan sesuai deskripsi.', 5),
(3, 'Citra', 'Pengiriman cepat, produk bagus.', 4),
(4, 'Dina', 'Sedikit delay pengiriman.', 3),
(5, 'Eko', 'Top banget!', 5),
(6, 'Fajar', 'Barang oke sesuai harga.', 4),
(7, 'Gita', 'Packing aman, mantap.', 5),
(8, 'Hendra', 'Produk original dan bergaransi.', 5),
(9, 'Intan', 'Harga sedikit mahal.', 4),
(10,'Joko', 'Overall good.', 4);

-- Promo
INSERT INTO promo (nama_promo, jenis_diskon, periode_promo, syarat_ketentuan) VALUES
('Diskon Ramadhan', '10%', 'Maret - April', 'Min. belanja 1 juta'),
('Promo Lebaran', '15%', 'April - Mei', 'Khusus produk tertentu'),
('Diskon Akhir Tahun', '20%', 'Desember', 'Tanpa minimal belanja'),
('Cashback Spesial', 'Rp50.000', 'April', 'Khusus pengguna baru'),
('Flash Sale', '30%', 'Setiap Jumat', 'Produk terpilih'),
('Promo Ulang Tahun', 'Free Ongkir', 'Bulan ulang tahun', 'Valid ID diperlukan'),
('Promo Kartu Kredit', '5%', 'Sepanjang Tahun', 'Min. transaksi 500 ribu'),
('Back to School', '20%', 'Juli - Agustus', 'Produk sekolah & elektronik'),
('Weekend Sale', '10%', 'Sabtu-Minggu', 'Semua produk'),
('Promo Gajian', '15%', 'Tanggal 25-30', 'Min. belanja 700 ribu');

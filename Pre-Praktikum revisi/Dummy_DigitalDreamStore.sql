
-- Membuat Database
CREATE DATABASE IF NOT EXISTS digital_dream_store;
USE digital_dream_store;

-- Bersihkan Tabel Jika Sudah Ada
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

-- Tabel Promo dan Diskon
CREATE TABLE promo (
    id_promo INT AUTO_INCREMENT PRIMARY KEY,
    nama_promo VARCHAR(100),
    jenis_diskon VARCHAR(50),
    periode_promo VARCHAR(50),
    syarat_ketentuan TEXT
);

-- Dummy Data

-- Admin
INSERT INTO admin (nama_admin, profil_bisnis, metode_pengiriman, metode_pembayaran)
VALUES ('Rifki Admin', 'Menjual gadget terbaru', 'JNE', 'Transfer Bank');

-- Pelanggan
INSERT INTO pelanggan (nama_pelanggan, alamat, nomor_telepon, riwayat_pembelian)
VALUES ('Hairur Rasid', 'Mataram', '081234567890', 'Smartphone, Laptop');

-- Produk
INSERT INTO produk (nama_produk, deskripsi_produk, harga, stok, kategori_produk)
VALUES ('iPhone 15', 'Smartphone terbaru Apple', 20000000.00, 10, 'Smartphone');

-- Transaksi
INSERT INTO transaksi (id_pelanggan, nomor_pesanan, tanggal_pemesanan, tanggal_pengiriman, metode_pembayaran, status_pengiriman)
VALUES (1, 'ORD123456', '2024-04-01', '2024-04-03', 'Transfer Bank', 'Dikirim');

-- Pengiriman
INSERT INTO pengiriman (id_transaksi, nomor_resi, jasa_pengiriman, tanggal_pengiriman, lokasi_pengiriman)
VALUES (1, 'RESI987654', 'JNE', '2024-04-03', 'Mataram');

-- Ulasan
INSERT INTO ulasan (id_produk, nama_pengguna, komentar, rating)
VALUES (1, 'Hairur Rasid', 'Produk sangat bagus!', 5);

-- Promo
INSERT INTO promo (nama_promo, jenis_diskon, periode_promo, syarat_ketentuan)
VALUES ('Diskon Lebaran', 'Potongan 10%', '1-30 April', 'Minimal pembelian Rp1.000.000');

-- 1. Membuat database jika belum ada
CREATE DATABASE IF NOT EXISTS online_shop;

-- 2. Menggunakan database tersebut
USE online_shop;

-- 3. Membuat tabel Pelanggan
CREATE TABLE IF NOT EXISTS Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    nomor_telepon VARCHAR(20) NOT NULL
);

-- 4. Menambahkan data dummy ke tabel Pelanggan
INSERT INTO Pelanggan (nama, alamat, nomor_telepon) VALUES
('Rudi Andi Pratama', 'Jl. Merdeka No.12, Mataram', '081234567890'),
('Siti Nur Aisyah', 'Jl. Soekarno Hatta No.25, Mataram', '082345678901'),
('Budi Santoso', 'Jl. Cakranegara No.88, Mataram', '083456789012');


CREATE TABLE Pemilik (
    id_pemilik INT AUTO_INCREMENT PRIMARY KEY,
    nama_depan VARCHAR(50),
    nama_tengah VARCHAR(50),
    nama_belakang VARCHAR(50),
    metode_pengiriman VARCHAR(100),
    profile_bisnis TEXT
);

CREATE TABLE Produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori_produk VARCHAR(50),
    stok_barang INT,
    harga DECIMAL(10,2),
    deskripsi_produk TEXT,
    diskon_produk DECIMAL(5,2),
    id_pemilik INT,
    FOREIGN KEY (id_pemilik) REFERENCES Pemilik(id_pemilik)
);

CREATE TABLE Pengiriman (
    id_pengiriman INT AUTO_INCREMENT PRIMARY KEY,
    nomor_resi VARCHAR(100),
    jasa_pengiriman VARCHAR(100),
    tanggal_pengiriman DATE,
    lokasi_pengiriman TEXT
);

CREATE TABLE Pembelian (
    id_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_produk INT,
    quantity INT,
    metode_pembayaran VARCHAR(100),
    tanggal_pemesanan DATE,
    tanggal_pengiriman DATE,
    status_pengiriman VARCHAR(50),
    no_pemesanan VARCHAR(100),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);

CREATE TABLE Ulasan (
    id_ulasan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_produk INT,
    isi_ulasan TEXT,
    rating INT,
    tanggal_ulasan DATE,
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);


INSERT INTO Pemilik (nama_depan, nama_tengah, nama_belakang, metode_pengiriman, profile_bisnis) VALUES
('Rifki', NULL, 'Azwari', 'JNE, J&T, POS', 'Menjual berbagai produk teknologi dan rumah tangga.'),
('Hairur', NULL, 'Rasid', 'SiCepat, AnterAja', 'Spesialis produk kecantikan dan elektronik.');

INSERT INTO Produk (nama_produk, kategori_produk, stok_barang, harga, deskripsi_produk, diskon_produk, id_pemilik) VALUES
('Xiaomi Redmi Note 12', 'Elektronik', 50, 2999000, 'Smartphone dengan kamera 50MP dan baterai 5000mAh', 10.00, 1),
('Setrika Philips GC160', 'Rumah Tangga', 30, 350000, 'Setrika hemat listrik dengan plat anti lengket', 5.00, 1),
('Lipstik Wardah Matte', 'Kecantikan', 100, 55000, 'Lipstik matte tahan lama dengan warna natural', 15.00, 2);

INSERT INTO Pengiriman (nomor_resi, jasa_pengiriman, tanggal_pengiriman, lokasi_pengiriman) VALUES
('JNE123456789', 'JNE', '2024-04-18', 'Gudang Jakarta'),
('JNT987654321', 'J&T', '2024-04-19', 'Warehouse Lombok'),
('POS456789123', 'POS Indonesia', '2024-04-20', 'Pusat Pengiriman Mataram');

INSERT INTO Pembelian (id_pelanggan, id_produk, quantity, metode_pembayaran, tanggal_pemesanan, tanggal_pengiriman, status_pengiriman, no_pemesanan) VALUES
(1, 1, 1, 'Transfer Bank', '2024-04-15', '2024-04-18', 'Dikirim', 'ORD1001'),
(2, 2, 2, 'COD', '2024-04-16', '2024-04-19', 'Diproses', 'ORD1002'),
(3, 3, 3, 'E-Wallet', '2024-04-17', '2024-04-20', 'Selesai', 'ORD1003');

INSERT INTO Ulasan (id_pelanggan, id_produk, isi_ulasan, rating, tanggal_ulasan) VALUES
(1, 1, 'Produk sangat bagus dan sesuai deskripsi.', 5, '2024-04-19'),
(2, 2, 'Pengiriman cepat, barang oke.', 4, '2024-04-20'),
(3, 3, 'Warna tidak sesuai gambar, tapi oke lah.', 3, '2024-04-21');








-- Jawaban Tugas Modul 1
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

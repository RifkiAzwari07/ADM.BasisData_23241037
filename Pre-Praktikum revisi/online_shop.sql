
-- 1 Kolom (Pakai Prefix dan Alias)

-- Produk
SELECT prd.nama_produk AS nama_produk
FROM shop.produk AS prd;

-- Kategori
SELECT kat.nama_kategori AS nama_kategori
FROM shop.kategori AS kat;

-- Pelanggan
SELECT plg.nama_pelanggan AS nama_pelanggan
FROM shop.pelanggan AS plg;

-- Pesanan
SELECT psn.tanggal_pesanan AS tanggal_pesanan
FROM shop.pesanan AS psn;

-- Detail Pesanan
SELECT dp.jumlah AS jumlah_produk
FROM shop.detail_pesanan AS dp;

-- Pembayaran
SELECT byr.total_bayar AS total_pembayaran
FROM shop.pembayaran AS byr;

-- Pengiriman
SELECT kirim.status_kirim AS status_pengiriman
FROM shop.pengiriman AS kirim;

-- Ulasan
SELECT ul.rating AS rating_produk
FROM shop.ulasan AS ul;

-- Admin
SELECT adm.username AS username_admin
FROM shop.admin AS adm;

-- Voucher
SELECT vcr.kode_voucher AS kode_voucher
FROM shop.voucher AS vcr;

-- ==================================================

-- 2 Kolom (Pakai Prefix dan Alias)

-- Produk
SELECT prd.nama_produk AS nama_produk, prd.harga AS harga_produk
FROM shop.produk AS prd;

-- Kategori
SELECT kat.nama_kategori AS nama_kategori, kat.deskripsi AS deskripsi_kategori
FROM shop.kategori AS kat;

-- Pelanggan
SELECT plg.nama_pelanggan AS nama_pelanggan, plg.email AS email_pelanggan
FROM shop.pelanggan AS plg;

-- Pesanan
SELECT psn.id_pelanggan AS id_pelanggan_pesanan, psn.tanggal_pesanan AS tanggal_pesanan
FROM shop.pesanan AS psn;

-- Detail Pesanan
SELECT dp.id_produk AS id_produk_detail, dp.jumlah AS jumlah_produk
FROM shop.detail_pesanan AS dp;

-- Pembayaran
SELECT byr.id_pesanan AS id_pesanan_bayar, byr.total_bayar AS total_pembayaran
FROM shop.pembayaran AS byr;

-- Pengiriman
SELECT kirim.id_pesanan AS id_pesanan_kirim, kirim.status_kirim AS status_pengiriman
FROM shop.pengiriman AS kirim;

-- Ulasan
SELECT ul.rating AS rating_produk, ul.komentar AS komentar_produk
FROM shop.ulasan AS ul;

-- Admin
SELECT adm.username AS username_admin, adm.email AS email_admin
FROM shop.admin AS adm;

-- Voucher
SELECT vcr.kode_voucher AS kode_voucher, vcr.diskon AS diskon_voucher
FROM shop.voucher AS vcr;

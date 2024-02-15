<?php
include 'koneksi.php';

$id = $_POST['id'];
$kode_item = $_POST['kode_item'];
$nama_item = $_POST['nama_item'];
$harga = $_POST['harga'];
$stok = $_POST['stok'];

$connect -> query("UPDATE elektronik SET kode_item = '" . $kode_item . "', nama_item = '" . $nama_item . "', harga = '" . $harga . "', stok = '" . $stok . "' WHERE id = '" . $id . "' ");
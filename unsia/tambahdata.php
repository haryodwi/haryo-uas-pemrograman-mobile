<?php

include "koneksi.php";

$kode_item = $_POST['kode_item'];
$nama_item = $_POST['nama_item'];
$harga = $_POST['harga'];
$stok = $_POST['stok'];

$connect->query("INSERT INTO elektronik(kode_item, nama_item, harga, stok) VALUES ('" . $kode_item . "','" . $nama_item . "','" . $harga . "','" . $stok . "')");
?>

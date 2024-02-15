<?php
include "koneksi.php";

$username = $_POST['username'];
$password = $_POST['password'];
$level = $_POST['level'];

$connect->query("INSERT INTO `user-toko` (username, password, level) VALUES ('" . $username . "','" . $password . "','" . $level . "')");
?>

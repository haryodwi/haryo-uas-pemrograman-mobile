<?php
include "koneksi.php";

$id =$_POST['id'];

$connect -> query("DELETE FROM elektronik WHERE id =" . $id);
?>
<?php
$connect = new mysqli("localhost","root","","tokoharyo_db"); 

if ($connect){
}else{
    echo "Koneksi Gagal";
    exit();
}
?>

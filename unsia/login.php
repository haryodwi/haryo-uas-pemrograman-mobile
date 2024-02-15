<?php
include "koneksi.php";

$username = $_POST['username'];
$password = $_POST['password'];

$query = "SELECT * FROM `user-toko` WHERE username=? AND password=?";
$stmt = $connect->prepare($query);

if (!$stmt) {
    // Kesalahan dalam persiapan statement
    die("Error in preparing statement: " . $connect->error);
}

$stmt->bind_param("ss", $username, $password);
$stmt->execute();

$queryResult = $stmt->get_result();

if (!$queryResult) {
    // Kesalahan dalam menjalankan kueri
    die("Error: " . $connect->error);
}

$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);
?>

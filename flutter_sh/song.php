<?php
// เรียกใช้ไฟล์ config.php
require_once('config.php');

// รับข้อมูลจาก POST
$title = $_POST['title'];
$artist = $_POST['artist'];
$song = $_POST['song'];
$image = $_POST['image'];

// เพิ่มข้อมูลเพลงใหม่ลงในตาราง "song"
$query = "INSERT INTO song (title, artist, song, image) VALUES ('$title', '$artist', '$song', '$image')";
$mysqli->query($query);

// ปิดการเชื่อมต่อฐานข้อมูล
$mysqli->close();
?>

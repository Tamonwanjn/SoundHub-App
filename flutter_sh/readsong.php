<?php
// เรียกใช้ไฟล์ config.php
require_once('config.php');

// ดึงข้อมูลเพลงทั้งหมดจากตาราง "song"
$result = $mysqli->query("SELECT * FROM song");
$data = array();
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

// ตั้งค่า Header ให้เป็น "Content-Type: application/json" เพื่อระบุว่าข้อมูลที่จะส่งกลับเป็น JSON
header('Content-Type: application/json');

// แปลงข้อมูลในอาร์เรย์ $data เป็นรูปแบบ JSON แล้วส่งกลับ
echo json_encode($data);

// ปิดการเชื่อมต่อฐานข้อมูล
$mysqli->close();
?>

<?php

require_once('config.php');


// Fetch data from the "playlist" table
$result = $mysqli->query("SELECT * FROM playlist");
$data = array();
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

// Return JSON response
header('Content-Type: application/json');
echo json_encode($data);

// Close database connection
$mysqli->close();
?>

<?php

require_once('config.php');

// Get POST data
$id = $_POST['id'];
$name = $_POST['name'];
$description = $_POST['description'];
$image = $_POST['image'];

// Update data in the "playlist" table
$query = "UPDATE playlist SET name='$name', description='$description', image='$image' WHERE id=$id";
$mysqli->query($query);

// Close database connection
$mysqli->close();
?>

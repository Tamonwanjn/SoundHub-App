<?php

require_once('config.php');

// Get POST data
$name = $_POST['name'];
$description = $_POST['description'];
$image = $_POST['image'];

// Insert new data into the "playlist" table
$query = "INSERT INTO playlist (name, description, image) VALUES ('$name', '$description', '$image')";
$mysqli->query($query);

// Close database connection
$mysqli->close();
?>

<?php

require_once('config.php');

// Get POST data
$id = $_POST['id'];

// Delete data from the table
$query = "DELETE FROM playlist WHERE id=$id";
$mysqli->query($query);

// Close database connection
$mysqli->close();
?>
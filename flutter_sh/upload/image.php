<?php

require_once('config.php');

// Get POST data
if(isset($_POST['name']) && isset($_FILES['image']['name'])) {
  $name = $_POST['name'];
  $image = $_FILES['image']['name'];

  $imagePath = 'upload/' . $image;
  $tmp_name = $_FILES['image']['tmp_name'];

  move_uploaded_file($tmp_name, $imagePath);

  // Update data in the "images" table
  $query = "INSERT INTO images (name, image) VALUES ('" . $name . "','" . $image . "')";
  if ($mysqli->query($query)) {
    echo 'Image uploaded successfully';
  } else {
    echo 'Image upload failed';
  }

  // Close database connection
  $mysqli->close();
} else {
  echo 'Invalid data';
}
?>

<?php
 $dbhost = 'localhost:3307';
 $dbname = 'covid19';
 $dbusername = 'root';
 $dbpassword = '';	
 
 $connection = mysqli_connect($dbhost,$dbusername,$dbpassword,$dbname);
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}

// echo "Connected successfully";
?>
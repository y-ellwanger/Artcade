<?php
$server = "localhost";
$user = "root";
$password = "";
$dbname = "artcade_database";

$conn = new mysqli($server, $user, $password, $dbname);
mysqli_set_charset($conn,'utf8');

?>
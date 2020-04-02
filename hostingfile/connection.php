<?php

$username = 'root';
$password = 'root';
$dbname = 'mweather';
$servername = 'localhost';
$port=3306;
$tbname="feedback_report";


$conn = new mysqli($servername, $username, $password, $dbname,$port);

if($conn->connect_error){
    die("Connection Failed: ".$conn->connect_error);
    return;
}

?>

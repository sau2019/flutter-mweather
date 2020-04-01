<?php

$username = 'root';
$password = 'root';
$dbname = 'mweather';
$servername = 'localhost';
$port=3306;
$tbname="feedback_report";
$action=$_POST["action"];

$conn = new mysqli($servername, $username, $password, $dbname,$port);

if($conn->connect_error){
    die("Connection Failed: ".$conn->connect_error);
    return;
}

if("ADD_FEEDBACK"==$action){
    $Name=$_POST["names"];
    $Email=$_POST["emails"];
    $Message=$_POST["messages"];

    $sql="INSERT INTO $tbname(name,email,message) VALUES('".$Name."','".$Email."','".$Message."')";

    $result= $conn->query($sql);

    echo "Success.";

    $conn->close();

    return;
}



?>
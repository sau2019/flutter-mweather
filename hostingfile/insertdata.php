<?php
require('connection.php');

$action=$_POST["action"];

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
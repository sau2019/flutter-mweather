<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="">

        <style>

        .table-area{
            height:100vh;
            width:100%;
        }

        .head{
            box-shadow:10px 2px 2px grey;
        }
        </style>
    </head>
    <body>
    
<?php

require('connection.php');

$sqlcertq= "SELECT * FROM feedback_report ORDER BY feedback_id DESC";

$result = mysqli_query($conn, $sqlcertq);

if (mysqli_num_rows($result)>0){




     ?>
<div style="overflow-x:auto;">
    <table class="table table-header">
    <tr class="head">
         <th>ID</th><th>Name</th><th>Email ID</th><th>Message</th><th>Time</th>
        </tr >
    </table>
</div>
<div style="overflow-x:auto;" class="table-area">

     <table class="table table-hover">
        
<?php
    while($row = mysqli_fetch_assoc($result)){
        echo "<td>".$row['feedback_id']."</td>";
        echo "<td>".$row['name']."</td>";
        echo "<td>".$row['email']."</td>";
        echo "<td>".$row['message']."</td>";
        echo "<td>".$row['time']."</td>";
        echo "</tr>";
   
    }
?>
    </table>
    </div>
<?php
}
else{
        echo '<center><h3>fetching data </h3></center>';
}

mysqli_close($conn);
?>
</body>
</html>

    

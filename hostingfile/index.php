
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="30">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>mWeather Message Box</title>
<script src="plugin/bootstrap.min.js"></script>
<script src="plugin/jquery.js">
    
</script>
    <link rel="stylesheet" href="plugin/bootstrap.min.css">
    <style>
    .title-nav{
        width:100%;
        height:100px;
        background-color:yellow;
        color:blue;
        box-shadow:2px 2px 2px grey, 2px 2px 2px grey;

    }
    .title-text{
        margin-top:20px;
        text-align:center;
    }
    .footer{
        padding:10px;
        background-color:grey;
    }
    .footer-text{
        font-size:14px;
        font-family:sans-serif;
        color:white;
        letter-spacing:1.0;
        text-align:center;
    }
    .link{
        color:yellow;
      
        decoration:none;
    }
    .link:hover{
        color:red;
    }
    </style>
</head>
<body style="background-color:#FFF7AA; font-family:Trebuchet MS, Helvetica, sans-serif">
<div class="row">
<div class="title-nav">

<center>
<h2 class="title-text">mWeather Message Box</h2>
</center>
</div>
</div>

<div class="container"><marquee style="color:black; background-color:transparent">
<p>Message get updated on this page after 30 seconds.</p>
</marquee>


<?php
require 'message_data.php';
?>


</div>
<div class="footer">
<p class="footer-text">Powered by:<a href="https://sau2019.github.io/mweather" class="link"> mWeather</a>, An Open source weather project.</p>
</div>

</body>
</html>
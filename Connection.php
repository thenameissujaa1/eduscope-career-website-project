<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$db_name="newdb";
$mysql_username="root";
$mysql_password="";
$server_name="localhost";
$server_port="8000";
$conn = mysqli_connect($server_name,$mysql_username,$mysql_password) or die("Error: " . mysqli_error($mysqlCon));
mysqli_select_db($conn, $db_name) or die("Error: " . mysqli_error($mysqlCon));




?>


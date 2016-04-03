<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include 'connection.php';
session_start();

$ii =  $_SESSION['ids'];

if(isset($_POST['btn-update']) )
   {
   echo $sn =  $_POST['uni-id'];
   echo $sd = $_POST['uni-des'];
   
   
   
   echo $sql = "Update universities SET name = '$sn' , rank = '$sd' Where id = '$ii' ";
   
   if ($conn->query($sql) === TRUE)
           {
       echo 'success';
           } 
   
   }

$conn->close();

//header("location: Universities.php");


?>
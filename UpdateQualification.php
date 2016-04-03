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
   echo $sn =  $_POST['qua-id'];
   echo $sd = $_POST['shrt-des'];
   
   
   
   echo $sql = "Update qualifications SET name = '$sn' , short_title = '$sd' Where id = '$ii' ";
   
   if ($conn->query($sql) === TRUE)
           {
               
           } 
   
   }

$conn->close();

header("location: Qualifications.php");


?>
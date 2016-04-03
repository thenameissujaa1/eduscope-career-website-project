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
   echo $sn =  $_POST['sub-id'];
   echo $sd = $_POST['sub-des'];
   
   
   
   echo $sql = "Update subjects SET subject_name = '$sn' , subject_description = '$sd' Where subject_id = '$ii' ";
   
   if ($conn->query($sql) === TRUE)
           {
               
           } 
   
   }

$conn->close();

header("location: Subject.php");


?>
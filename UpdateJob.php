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
   echo $sn =  $_POST['job-id'];
   echo $sd = $_POST['job-des'];
   
   
   
   echo $sql = "Update jobs SET job_name = '$sn' , job_description = '$sd' Where job_id = '$ii' ";
   
   if ($conn->query($sql) === TRUE)
           {
               
           } 
   
   }

$conn->close();

header("location: Jobs.php");


?>
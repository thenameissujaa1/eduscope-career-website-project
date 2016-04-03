<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
include 'connection.php';
session_start();
?>
<form method="post" >
<table border=1>
    
    <th>Job ID</th>
    <th>Job Name</th>
    <th>Job Description</th>
    <th colspan="2"><a href="AddJob.php"/>ADD Job</th>
    
    
    </tr>
    
    
    <?php
    $sql = "SELECT * FROM jobs";
$result= mysqli_query($conn, $sql);
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{ ?>
    
<tr>
    <td><input type="hidden" name="id" value="<?php echo $row['id']; ?>"/><?php echo $row['id']; ?> </td>
        <td><?php echo $row['title']; ?></td>
        <td><?php echo $row['description']; ?></td>
        <td><input type="submit" name ="btn-delete" value="Delete"/></td>
        <td><input type="submit" name ="btn-edit" value="Edit"/></td>
  
        </tr>
        <?php
 }
 ?>
    </table>
</form>

   <?php   
   if(isset($_POST['btn-delete']))
   {
       
       
       $i = $_POST['id'];
       
       $sql = "Delete from jobs Where id= '$i' ";
       
       if ($conn->query($sql) === TRUE)
           {
    
           } 
}


   

   else if(isset($_POST['btn-edit']))
   {?>

<form method="post" action="UpdateJob.php">
    <input type="text" name="job-id" placeholder="Job Name"/>
    <input type="text" name="job-des" placeholder="Job Description"/>
    <input type="submit" value="Update" name="btn-update"/>
</form>

       
   <?php
   
   
   $_SESSION['ids'] = $_POST['id'];
//   if(isset($_POST['btn-update']) )
//   {
//   echo $_POST['sub-id'];
//   echo $_POST['sub-des'];
//   
//   }
   }
   $conn->close();
   
   
   ?>





        


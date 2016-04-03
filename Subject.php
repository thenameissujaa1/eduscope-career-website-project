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
    
    <th>Subject ID</th>
    <th>Subject Name</th>
    <th>Subject Description</th>
    <th colspan="2"><a href="AddSubject.php"/>ADD Subject</th>
    
    
    </tr>
    
    
    <?php
    $sql = "SELECT * FROM subjects";
$result= mysqli_query($conn, $sql);
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{ ?>
    
<tr>
    <td><input type="hidden" name="id" value="<?php echo $row['subject_id']; ?>"/><?php echo $row['subject_id']; ?> </td>
        <td><?php echo $row['subject_name']; ?></td>
        <td><?php echo $row['subject_description']; ?></td>
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
       
       $sql = "Delete from subjects Where subject_id= '$i' ";
       
       if ($conn->query($sql) === TRUE)
           {
    
           } 
}


   

   else if(isset($_POST['btn-edit']))
   {?>

<form method="post" action="UpdateSubject.php">
    <input type="text" name="sub-id" placeholder="Subject Name"/>
    <input type="text" name="sub-des" placeholder="Subject Description"/>
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





        


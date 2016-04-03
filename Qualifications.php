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
    
    <th>Qualification ID</th>
    <th>Qualification Name</th>
    <th>short_title</th>
    <th colspan="2"><a href="AddQualification.php"/>ADD Qualification</th>
    
    
    </tr>
    
    
    <?php
    $sql = "SELECT * FROM qualifications";
$result= mysqli_query($conn, $sql);
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{ ?>
    
<tr>
    <td><input type="hidden" name="id" value="<?php echo $row['id']; ?>"/><?php echo $row['id']; ?> </td>
        <td><?php echo $row['name']; ?></td>
        <td><?php echo $row['short_title']; ?></td>
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
       
       $sql = "Delete from Qualifications Where id= '$i' ";
       
       if ($conn->query($sql) === TRUE)
           {
    
           } 
}


   

   else if(isset($_POST['btn-edit']))
   {?>

<form method="post" action="UpdateQualification.php">
    <input type="text" name="qua-id" placeholder="Qualification Name"/>
    <input type="text" name="shrt-des" placeholder="Qualification Description"/>
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





        


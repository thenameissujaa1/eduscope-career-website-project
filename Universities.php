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
    
    <th>id</th>
    <th>name</th>
    <th>2016 Rank</th>
    <th>Teaching Quality</th>
    <th>Student Experience</th>
    <th>Research quality</th>
    <th>Entry standards</th>
    <th>Graduate prospects</th>
    <th colspan="2"><a href="AddUni.php"/>ADD University</th>
    
    
    </tr>
    
    
    <?php
    $sql = "SELECT * FROM universities";
$result= mysqli_query($conn, $sql);
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{ ?>
    
<tr>
    <td><input type="hidden" name="id" value="<?php echo $row['id']; ?>"/><?php echo $row['id']; ?> </td>
        <td><?php echo $row['name']; ?></td>
        <td><?php echo $row['rank']; ?></td>
        <td><?php echo $row['Teaching Quality']; ?></td>
        <td><?php echo $row['Student Experience']; ?></td>
        <td><?php echo $row['Research quality']; ?></td>
        <td><?php echo $row['entry']; ?></td>
        <td><?php echo $row['Graduate prospects']; ?></td>
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
       
       $sql = "Delete from universities Where id= '$i' ";
       
       if ($conn->query($sql) === TRUE)
           {
    
           } 
}


   

   else if(isset($_POST['btn-edit']))
   {?>

<form method="post" action="UpdateUniversity.php">
    <input type="text" name="uni-id" placeholder=" Name"/>
    <input type="text" name="uni-des" placeholder="Rank in 2016"/>
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





        



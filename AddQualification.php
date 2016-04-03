

<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include 'connection.php';



    ?>



<div style="padding-left: 3%;
    position: fixed;
    top: 25%;">
            <form action="AddQualification.php" method="POST">
                Qualification Name: <input type="text" name="name" ></br></br>
               Qualification Description:<input type="text" name="des">
               <input type="submit" value="Add" name="btn-add">
               
            </form>
            
        </div>


<?php


if (isset($_POST['btn-add']))
{
    $name = $_POST['name'];
    $des = $_POST['des'];
    
    $sql = "Insert into qualifications (name , short_title) Values('$name','$des' ) ";
    
    
    if ($conn->query($sql) === TRUE) {
    //echo "New record created successfully";
        
    $conn->close();

header("location: Qualifications.php");    
} 
}






?>

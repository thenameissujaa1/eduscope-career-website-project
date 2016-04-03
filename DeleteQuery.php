<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


include 'connection.php';


if(isset($_POST['id'])&& isset($_POST['name']))
{
    echo $i = $_POST['id'];
    echo $n = $_POST['name'];
    
    $sql = "Delete from user Where user_id= '$i' AND user_username = '$n'";
    
    
    if ($conn->query($sql) === TRUE) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . $conn->error;
}
}
header("location: DelteUser.php ");
$conn->close();

?>
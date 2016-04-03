<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


include 'connection.php';


$sql = "SELECT user.user_id, userdetail.userDetail_firstName, userdetail.userDetail_lastName,userdetail.userDetail_DOB,userdetail.userDetail_minQualification,userdetail.userDetail_nationality FROM user INNER JOIN userdetail ON user.user_id=userdetail.userDetail_id";
$result= mysqli_query($conn, $sql);

echo "<table border=1  >";
echo "<tr><td>". "ID". "</td><td>" . "Firstname" . "</td><td>" . "Lastname" ."</td><td>" . "Date Of Birth" . "</td><td>" . "Min Qualification" . "</td><td>" . "Nationality" ."</td></tr>"  ;
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
  
    
  //echo "'$lat' '$lon' '$Sender' '</br>'";
  
 echo "<tr><td>" . $row['user_id']. "</td><td>" . $row['userDetail_firstName'] . "</td><td>" . $row['userDetail_lastName'] ."</td><td>" . $row['userDetail_DOB'] ."</td><td>" . $row['userDetail_minQualification'] ."</td><td>" . $row['userDetail_nationality'] . "</td></tr>"  ;
}

echo "</table>"; //Close the table in HTML
$conn->close();

?>
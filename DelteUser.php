<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include 'connection.php';


$sql = "SELECT * FROM user";
$result= mysqli_query($conn, $sql);

echo "<table border=1  >";
echo "<tr><td>". "ID". "</td><td>" . "Username" . "</td><td>" . "Email" . "</td></tr>"  ;
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
  $lat = $row['user_id'];
  $lon = $row['user_username'];
  $Sender = $row['user_email'];
    
  //echo "'$lat' '$lon' '$Sender' '</br>'";
  
 echo "<tr><td>" . $row['user_id']. "</td><td>" . $row['user_username'] . "</td><td>" . $row['user_email'] . "</td></tr>"  ;
}

echo "</table>"; //Close the table in HTML
$conn->close();




?>




<html>
    <body>
        <div style="padding-left: 60%;position: fixed;">
            <form action="DeleteQuery.php" method="POST">
               ID: <input type="number" name="id" >
               Name:<input type="text" name="name">
               <input type="submit" value="DELETE">
               
            </form>
            
        </div>
    </body>
    
</html>
    

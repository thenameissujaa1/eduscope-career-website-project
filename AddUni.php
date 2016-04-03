

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
            <form action="AddUni.php" method="POST">
               Name: <input type="text" name="name" ></br></br>
               Rank in 2016:<input type="text" name="rank"></br></br>
               Teaching Quality: <input type="text" name="tq" ></br></br>
               Student Experience: <input type="text" name="se" ></br></br>
               Research quality: <input type="text" name="rq" ></br></br>
               Entry standards: <input type="text" name="es" ></br></br>
               Graduate prospects: <input type="text" name="gp" ></br></br>
               
               <input type="submit" value="Add" name="btn-add">
               
            </form>
            
        </div>


<?php


if (isset($_POST['btn-add']))
{
    $name = $_POST['name'];
    $rank = $_POST['rank'];
    $tq = $_POST['tq'];
    $se = $_POST['se'];
    $rq = $_POST['rq'];
    $es = $_POST['es'];
    $gp = $_POST['gp'];
    
    $sql = "Insert into universities (name , rank, Teaching Quality,Student Experience, Research quality,entry,Graduate prospects   ) Values('$name','$rank','$tq' , '$se', '$rq' , '$es' , '$gp'  ) ";
    
    
    if ($conn->query($sql) === TRUE) {
    //echo "New record created successfully";
        
    $conn->close();

header("location: Universities.php");    
} 
}






?>

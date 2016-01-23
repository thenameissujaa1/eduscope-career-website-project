<?php

/*  Purpose of this script is to check if the DB exisits or not
 *  if not then the DB will be created on your localhost
 *  Along with the DB all the tables will also be imported from .sql file
 */

$hostname = 'localhost';
$port = '8000';
$username = 'root';
$password = '';
$db = 'eduscope';
$file = 'db.sql';

$mysqli = new mysqli($hostname,$username,$password); 

if($mysqli->connect_error){
    die("Connection Failed: ".$mysqli->connect_error);
}

// Select DB
if(mysqli_select_db($mysqli, $db)){    
    
    echo 'DB '.$db.' Exists';
    die();
    
}else{
    
    // Create DB
    echo 'Couldn\' find \''.$db.'\' DB';
    echo '... Creating DB';
    $mysqli->query('CREATE DATABASE '.$db);
    
    if(!mysqli_select_db($mysqli, $db)){
        
        echo '... Unable to select '.$db.' ... terminating setup!';
        die();
    
    }else{     
          
        // Import
        $source = file_get_contents($file);
        if(mysqli_multi_query($mysqli, $source)){
            echo '... DB setup success';
        }else{
            echo '... DB setup failed';
        }
   
    }

}

$mysqli->close();

?>

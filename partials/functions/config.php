<?php 

$hostname = 'localhost';
$port = '3306';
$username = 'root';
$password = '';
$db = 'eduscope';

$mysqli = new mysqli($hostname,$username,$password,$db); 

if($mysqli->connect_error){
    die("Connection Failed: ".$mysqli->connect_error);
}

?>
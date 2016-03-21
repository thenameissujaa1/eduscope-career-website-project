<?php

include_once 'config.php';

session_start();

if(array_key_exists('query',$_POST)){
    $query = $_POST['query'];
    if(checkQuery($query)){
        $type = $_GET['type'];
        $response['status'] = 1;
        $sql = 'SELECT user_username FROM user WHERE user_username LIKE "%'.$query.'%"';
        $i = 0;
        $result = $mysqli->query($sql);
        while($row = $result->fetch_assoc()){
            $response[$type][$i] = $row;
            $i++;
        }
    }else{
        $response['status'] = 0;
    }
}else{
    $response['status'] = 0;
}

$mysqli->close();

send_response($response);

// This function checks if the query is alpha numeric
function checkQuery($query){
    if(preg_match("/[^a-z_\-0-9]/i", $query, $match)){
        return false;
    }else{
        return true;
    }
}
/*  This function takes a response and simply echos it for the app.js to read
    $data : Array - array $response from the php file 
*/
function send_response($data){
    header('Content-type: application/json');
    echo json_encode($data);
}
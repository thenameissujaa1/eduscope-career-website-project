<?php

/* 
    Purpose of this script to static database data to the frontend in the form of JSON
    
    Usage: getResource.php?type=<type>
    
    Where <type> can be the following:
    1. subjects
        Response key            Description
        1. status               Status code, 0 for fail (passed along with error), 1 for success
        2. subjects[]           A list of subjects from the database
    
*/

$response = array();

if(checkType($_GET['type']) == false){
    $response['status'] = 0;
    $response['error'] = 'Invalid type';
}else{
    
    require_once 'config.php';
    
    $type = $_GET['type'];
    
    $response['status'] = 1;
    
    $sql = 'SELECT * FROM '.$type;
    
    if($type == "qualification_types"){
        $sql = 'select type from qualifications group by type';
    }
    
    $result = $mysqli->query($sql);
    $i = 0;
    while($row = $result->fetch_assoc()){
        $response[$type][$i] = $row;
        $i++;
    }
    
    $mysqli->close();
}

send_response($response);


/*  This function takes a response and simply echos it for the app.js to read
    $data : Array - array $response from the php file 
*/
function send_response($data){
    header('Content-type: application/json');
    echo json_encode($data);
}

function checkType($type){
    if(preg_match("/^(subjects|universities|qualifications|qualification_types)$/", $type, $match)){
        return true;
    }else{
        return false;
    }
}
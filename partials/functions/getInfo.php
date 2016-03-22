<?php

// Start the session
session_start();

/*
    getInfo is a common service script for all requests that replies with a JSON query based on the arguments provided

    Initlaize response array to be sent as JSON, each response will have ['status'] attribute to notify the frontend about any errors
    The response['status'] of type int attribute will mean the following
    0 : user not logged in
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
    
    Alternatively, you can also get a list of things without concering the user id
    getInfo.php?type=list&from=tableName
    type : list | This will tell the script that you want a list of things
    from : <table name> | This will be the table you would like to get 
    
    You can also get info of another user by setting the type as profile and the user as the username of the profile
    for example..
    getInfo.php?type=profile&user=username
    type : profile | This will tell the script to get profile details of a specified user
    user : <username> | The user name to look at
    
*/

$response = array();

if(isset($_SESSION['loggedin_user']) == false || checkType($_GET['type']) == false){
    
    $response['status'] = 0;
    send_response($response);

}else{
    
    require_once 'config.php';
    
    // Get the type of database that needs to be accessed, eg. user, userDetailDB.. etc. 
    $type = $_GET['type'];
    $user_id = $_SESSION['loggedin_user'];
    
    // Variables
    $sql;       // The SQL Query
    $result;    // Result for the SQL query
    
    // Set response
    $response['status'] = 1;
    
    // user contains sensitive information and requires precaution
    switch($type){
        case 'user':
            $sql = 'SELECT user_username, user_email FROM user WHERE user_id = '.$user_id;
            // Get the results
            $result = $mysqli->query($sql);
            $response[$type] = $result->fetch_assoc();
            send_response($response);
            break;
        case 'userDetail':
            $sql = 'SELECT * FROM '.$type.' WHERE '.$type.'_id = '.$user_id;
            // Get the results
            $result = $mysqli->query($sql);
            $response[$type] = $result->fetch_assoc();
            send_response($response);
            break;
        case 'list':
            $from = $_GET['from'];
            switch($from){
                case 'qualifications':
                case 'subjects':
                    $sql = 'SELECT * FROM '.$from;
                    $i = 0;
                    $result = $mysqli->query($sql);
                    while($row = $result->fetch_assoc()){
                        $response[$from][$i] = $row;
                        $i++;
                    }
                    send_response($response);
                    break;
                default:
                        $response['status'] = 0;
                        send_response($response);
            }
            break;
        case 'profile':
            $user = $_GET['user'];
            // Check if the username is alphanumeric
            if(preg_match("/[^a-zA-Z0-9]/i", $user, $match)){
                $response['status'] = 0;
                send_response($response);
            }else{
                // First we get the user_id
                $sql = 'SELECT user_id FROM user WHERE user_username = "'.$user.'"';
                $result = $mysqli->query($sql);
                $user_id = $result->fetch_assoc(); // fetches as an array
                // Then we get the user detail of the user id, using user_id[key]
                $sql = 'SELECT * FROM userDetail WHERE userDetail_id = '.$user_id['user_id'];
                $result = $mysqli->query($sql);
                // Store and send response
                $response[$type] = $result->fetch_assoc();
                send_response($response);
            }
            break;
        default: 
            $sql = 'SELECT * FROM '.$type.' WHERE '.$type.'_fk_user_id = '.$user_id;
    }

}

/*  This function takes a response and simply echos it for the app.js to read
    $data : Array - array $response from the php file 
*/
function send_response($data){
    header('Content-type: application/json');
    echo json_encode($data);
}

function checkType($type){
    if(preg_match("/^(userDetail|user|list|profile)$/", $type, $match)){
        return true;
    }else{
        return false;
    }
}
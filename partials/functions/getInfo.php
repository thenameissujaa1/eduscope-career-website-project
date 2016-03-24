<?php

// Start the session
session_start();

/*
    getInfo is a common service script for all requests that replies with a JSON query based on the arguments provided
    
    BASIC STATUS RESPONSE (Doesn't apply to some parts)
    Initlaize response array to be sent as JSON, each response will have ['status'] attribute to notify the frontend about any errors
    The response['status'] of type int attribute will mean the following
    0 : user not logged in
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
    
    TYPE: list
    Alternatively, you can also get a list of things without concering the user id
    getInfo.php?type=list&from=tableName
    type : list | This will tell the script that you want a list of things
    from : <table name> | This will be the table you would like to get 
    
    TYPE: profile
    You can also get info of another user by setting the type as profile and the user as the username of the profile
    for example..
    getInfo.php?type=profile&user=username
    type : profile | This will tell the script to get profile details of a specified user
    user : <username> | The user name to look at
    
    TYPE: relation
    You can check the relation between the user and the mentor (The user recieving the mentor request)
    for example..
    getInfo.php?type=relation&receiver=id
    type : relation | This will tell the script to look for what relation the 2 user's have
    receiver : <id> | The user_id of the reciever
    Response is sent as..
    RelationStatus : (0|1|2|3) | 
    2 means user is not a mentor
    1 means user is already mentor, 
    3 means request pending, 
    0 means user is sending request to self
    relation : <string> | The message to be sent depending on the relation, 3 cases user sends to themselves, or the other user is already a mentor, or the other
    user's request is pending, or the sending user is not linked with the receiving user.
    
    TYPE: mymentors
    This will retrive a list of mentors of the loggedin user
    URL: getInfo.php?type=mymentors
    RESPONSE: 
    status : (0|1) | 0 for failure and 1 for success
    mentors : <array> | An array of mentors containg JSON objects with properties
       - user_username
       - userDetail_firstName
       - userDetail_lastName
    To access ith element, data.mentors[i].<property>
       
    TYPE: myusers
    This will retrive a list of users metored by the loggedin user
    URL: getInfo.php?type=myusers
    RESPONSE: 
    status : (0|1) | 0 for failure and 1 for success
    mentors : <array> | An array of users containg JSON objects with properties
       - user_username
       - userDetail_firstName
       - userDetail_lastName
    To access ith element, data.users[i].<property>
    
    TYPE: myrequests
    This will give a list of users that have sent the logged in user a mentor request.
    URL: getInfo.php?type=myrequests
    RESPONSE:
    status : (0|1) | 0 for failure and 1 for success
    requests : <array> | An array of users containg JSON objects with properties
        - user_username
        - userDetail_firstName
        - userDetail_lastName
    To access ith element, data.requests[i].<property>
*/

$response = array();

if(isset($_SESSION['loggedin_user']) == false || checkType($_GET['type']) == false){
    
    $response['status'] = 0;
    $response['error'] = 'User not logged in or type check failed';
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
        case 'relation';
            $receiver_id = $_GET['receiver'];
            // Check if the receiver is numeric
            if(preg_match("/[^0-9]/i", $receiver_id, $match)){
                $response['status'] = 0;
                send_response($response);
            }else{
                // First we get the user_id
                $sql = 'SELECT user_id FROM user WHERE user_id = "'.$receiver_id.'"';
                $result = $mysqli->query($sql);
                $receiver_id = $result->fetch_assoc(); // fetches as an array
                if($result->num_rows > 0){
                    if($receiver_id['user_id'] == $user_id){
                        $response['relationStatus'] = 0;
                        $response['relation'] = 'Can\'t send request to self';
                        send_response($response);
                    }else{
                        $sql = 'SELECT * FROM request_pending WHERE fk_sender_user_id = '.$user_id.' AND fk_acceptor_user_id = '.$receiver_id['user_id'];
                        $result = $mysqli->query($sql);
                        if($result->num_rows == 0){
                            $sql = 'SELECT * FROM userMentor WHERE fk_user_id = '.$user_id.' AND fk_mentor_id = '.$receiver_id['user_id'];
                            $result = $mysqli->query($sql);
                            if($result->num_rows > 0){
                                $response['relationStatus'] = 1;
                                $response['relation'] = 'This User is already your mentor';
                                send_response($response);
                            }else{
                                $response['relationStatus'] = 2;
                                $response['relation'] = 'This User is not your mentor';
                                send_response($response);
                            }
                        }else{
                            $response['relationStatus'] = 3;
                            $response['relation'] = 'Mentor request pending';
                            send_response($response);
                        }
                    }
                }else{
                    $response['status'] = 0;
                    send_response($response);
                }
            }
            break;
        case 'mymentors':
            $sql = 'SELECT user_username, userDetail_firstName, userDetail_lastName FROM user,userDetail,userMentor WHERE fk_mentor_id = user_id AND fk_mentor_id = userDetail_id AND fk_user_id = '.$user_id;
            $result = $mysqli->query($sql);
            $i = 0;
            while($row = $result->fetch_assoc()){
                $response['mentors'][$i] = $row;
                $i++;
            }
            send_response($response);
            break;
        case 'myusers':
            $sql = 'SELECT user_username, userDetail_firstName, userDetail_lastName FROM user,userDetail,userMentor WHERE fk_user_id = user_id AND fk_user_id = userDetail_id AND fk_mentor_id = '.$user_id;
            $result = $mysqli->query($sql);
            $i = 0;
            while($row = $result->fetch_assoc()){
                $response['users'][$i] = $row;
                $i++;
            }
            send_response($response);
            break;
        case 'myrequests':
            $sql = 'SELECT user_username, userDetail_firstName, userDetail_lastName FROM user,userDetail,request_pending WHERE fk_sender_user_id = user_id AND fk_sender_user_id = userDetail_id AND fk_acceptor_user_id = '.$user_id;
            $result = $mysqli->query($sql);
            $i = 0;
            while($row = $result->fetch_assoc()){
                $response['requests'][$i] = $row;
                $i++;
            }
            send_response($response);
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
    if(preg_match("/^(userDetail|user|list|profile|relation|mymentors|myusers|myrequests)$/", $type, $match)){
        return true;
    }else{
        return false;
    }
}
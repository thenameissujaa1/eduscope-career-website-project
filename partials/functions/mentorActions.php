<?php

/*  
    This script will "do" an action described by the post data, below is a list of supported actions and what these action mean and do 
    
    Parameters passed:
    1. action : (mentor_add|mentor_cancel_request|mentor_remove|acceptRequest|declineRequest)
    2. receiver : <user_username>
    
    IMPORTANT: user must be logged in! Status 0 is replied if the user is not logged in
    
    Example: mentorActions.php
    Post data as JSON: {action: 'mentor_add',receiver: 'username'}
    
    Response:
    1. status : (0|1)
    2. (only if status is 0) error : string
    3. (only if status is 1) receiver_id : <user_id|userDetail_id>
    
    Response data as JSON: 
        {"status" : 0, "error" : "error string"}
        or
        {"status" : 1, "receiver_id" : 1}
        
   Supported Actions:
   1. mentor_add : This will send the receiver a mentor request
   2. mentor_cancel_request : This will cancel the mentor request that was sent to the receiver
   3. mentor_remove : This will remove the receiver as the mentor (given that they were already a mentor)
   4. acceptRequest : When a user receives a request, they can accept it or decline it. 
   5. declineRequest : When a user receives a request, they can accept it or decline it. 
   
*/

session_start();

// intialize response array
$response = array();

if(isset($_SESSION['loggedin_user']) == false 
    || array_key_exists('action',$_POST) == false 
    || array_key_exists('receiver',$_POST) == false
    || reCheck($_POST['action'],$_POST['receiver']) == false){
    
    // If anything is wrong, we will reply with response status 0
    $response['status'] = 0;
    $response['error'] = 'User not logged in or type check failed';

}else{
    
    // Beep boop beep 
    require_once 'config.php';
    $action = $_POST['action'];
    $user_id = $_SESSION['loggedin_user'];
    $receiver = $_POST['receiver'];
    
    // Get reciever's ID first to make sure they exists
    $sql = 'SELECT user_id FROM user WHERE user_username = "'.$receiver.'"';
    $result = $mysqli->query($sql);
    
    if($result->num_rows != 1){
        $response['status'] = 0;
        $response['error'] = 'Username of the reciever is incorrect';
    }else{
        
        // Get the reciever id.
        $result = $result->fetch_assoc();
        $receiver_id = $result['user_id'];
        
        $response['status'] = 1;
        
        switch($action){
            case 'mentor_add':
                $sql = 'INSERT INTO request_pending (fk_sender_user_id,fk_acceptor_user_id) VALUES ('.$user_id.','.$receiver_id.')';
                break;
            case 'mentor_cancel_request':
                $sql = 'DELETE FROM request_pending WHERE fk_sender_user_id = '.$user_id.' AND fk_acceptor_user_id = '.$receiver_id; 
                break;
            case 'acceptRequest':
                $sql = 'DELETE FROM request_pending WHERE fk_sender_user_id = '.$receiver_id.' AND fk_acceptor_user_id = '.$user_id; 
                if($mysqli->query($sql)){
                    $sql = 'INSERT INTO userMentor (fk_mentor_id,fk_user_id) VALUES ('.$user_id.','.$receiver_id.')';
                    if($mysqli->query($sql)){
                        $response['status'] = 1;
                        $response['receiver_id'] = $receiver_id;
                    }else{
                        $response['status'] = 0;
                        $response['error'] = 'Error while performing action (Accept Request 2)';
                    }
                }else{
                    $response['status'] = 0;
                    $response['error'] = 'Error while performing action (Accept Request 1)';
                }
                break;
            case 'declineRequest':
                $sql = 'DELETE FROM request_pending WHERE fk_sender_user_id = '.$receiver_id.' AND fk_acceptor_user_id = '.$user_id;
                break;
            case 'mentor_remove':
                $sql = 'DELETE FROM userMentor WHERE fk_mentor_id = '.$receiver_id.' AND fk_user_id = '.$user_id;
                break;
        }
        
        // Avoiding code repetition
        switch($action){
            case 'acceptRequest':
                break;
            default:
                if($mysqli->query($sql)){
                    $response['status'] = 1;
                    $response['receiver_id'] = $receiver_id;
                }else{
                    $response['status'] = 0;
                    $response['error'] = 'Error while performing action';
                } 
        }

    }
}

send_response($response);

/*  This function takes a response and simply echos it for the app.js to read
    $data : Array - array $response from the php file 
*/
function send_response($data){
    header('Content-type: application/json');
    echo json_encode($data);
}

// [re]gex Check for incoming items
function reCheck($action, $receiver){
    if(preg_match("/^(mentor_add|mentor_cancel_request|mentor_remove|acceptRequest|declineRequest)$/", $action, $match) && preg_match("/^([a-zA-Z0-9_]){4,25}$/", $receiver, $match)){
        return true;
    }else{
        return false;
    }
}
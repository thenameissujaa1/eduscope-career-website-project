<?php

// Start the session
session_start();

/*  Initlaize response array to be sent as JSON, each response will have ['status'] attribute to notify the frontend about any errors
    The response['status'] of type int attribute will mean the following
    0 : user not logged in
    1 : user logged in, but no profile details found, first time login
    2 : user logged in, profile details found
*/

$response = array();

// Check if the user is logged in
if(!isset($_SESSION['loggedin_user'])){
    
    // Set response
    $response['status'] = 0;
    
    // Send reponse
    send_response($response);

}else{
   
   require_once 'config.php';
   
   // Check if the user is new
   $sql = 'SELECT * FROM userDetailDB WHERE userDetail_fk_user_id = '.$_SESSION['loggedin_user'];
   $result = $mysqli->query($sql);
   
   if($result->num_rows > 0){
        
        // Extract the data, this puts the data as an array in the user column
        $userDetailResult = $result->fetch_assoc();
        
        // Set response        
        $response['status'] = 2;
        $response['html'] = file_get_contents('../views/profile.html');
        $response['userDetail'] = $userDetailResult;
        
        // Get username
        $sql = 'SELECT user_username FROM userDB WHERE user_id = '.$_SESSION['loggedin_user'];
        $result = $mysqli->query($sql);
        $userResult = $result->fetch_assoc();
        $response['username'] = $userResult['user_username'];
        
        // Send the response
        send_response($response);
        
   }else{
       
       // User is not new, reply back with their username only
       $sql = 'SELECT user_username FROM userDB WHERE user_id = '.$_SESSION['loggedin_user'];
       $result = $mysqli->query($sql);
       $userResult = $result->fetch_assoc();
       
       // Set response
       $response['status'] = 1;
       $response['html'] = file_get_contents('../views/profile.html');
       $response['username'] = $userResult['user_username'];
       
       // Send the response
       send_response($response);
   }
    

}

/*  This function takes a response and simply echos it for the app.js to read
    $a : Array - array $response from the php file 
*/
function send_response($data){
    header('Content-type: application/json');
    echo json_encode($data);
}

?>
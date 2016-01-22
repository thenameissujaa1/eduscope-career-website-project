<?php

/*  This script is responsible to check incoming user data, and log them in if correct
*   How does it do that?
*   1. CHECK IF post variables exits
*   2. CHECK IF user is using email or username to login
*   3. CHECK IF user's password is correct or not
*   4. Log the user in by updating the $_SESSION variable
*   If there is a failure event, the error is recorded in $response and sent back
*
*/

include_once 'config.php';
include_once 'functions.php';

// Check if POST variables exists
if( array_key_exists('login_user',$_POST)
    && array_key_exists('login_password',$_POST))
{

    // Get POST variables
    $user = $_POST['login_user'];
    $password = $_POST['login_password'];

    // Set variables
    $response;        // Our response to the user
    $stmt_sql;        // SQL for the statement
    $stmt_result;     // Statement results

    // Check if the user is using email or username
    if(filter_var($user, FILTER_VALIDATE_EMAIL) == true){
        
        // create our query to look for the user
        $stmt_sql = "SELECT user_id FROM userDB WHERE user_email = ?";
        
    }else{
        
        // Create a similar query but look for username
        $stmt_sql = "SELECT user_id FROM userDB WHERE user_username = ?";
        
    }

    // Prepare the query, bind parameters and execute the statement
    $stmt_result = execute_single_variable_prepared_stmt($mysqli,$stmt_sql,$user,'s');

    // if the user exists in the DB
    if($stmt_result->num_rows === 1){
        
        // Get the user ID in a variable
        $user_id = get_single_result($stmt_result);
        
        // Selecting the password
        $stmt_sql = "SELECT user_password FROM userDB WHERE user_id = ?";
                
        // Get the users hashed password
        $stmt_result = execute_single_variable_prepared_stmt($mysqli,$stmt_sql,$user_id,'i');

        // Get the hashed password in a variable
        $password_hash = get_single_result($stmt_result);
        
        // Verify the password
        if(password_verify($password,$password_hash)){
            
            // Start the session
            session_start();
            
            // Save session variable
            $_SESSION['loggedin_user'] = $user_id;
            
            // Set response
            $response = "success";
            
        }else{
            
            // Set response
            $response = "Invalid password for ".$user;
            
        }
        
    }else{
        
        // Set response
        $response = "No record found for ".$user.", please Signup";

    }
}
else{
    
    // Set response
    $response = "Please check your input";
    
}

// Print the response
echo $response;


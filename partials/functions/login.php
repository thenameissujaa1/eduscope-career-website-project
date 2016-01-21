<?php

/*  This script is responsible to check incoming user data, and log them in if correct
*   How does it do that?
*   1. CHECK IF post variables exits
*   2. CHECK IF user is using email or username to login
*   3. CHECK IF user's password is correct or not
*   4. Log the user in by updating the $_SESSION variable
*   If there is a failure event, the error is recorded in $response and sent back
*
*   This script has 2 functions to make the reading of this script easy, to understand what these functions do, please check the function
*/

include_once 'config.php';

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
    $stmt_query;      // Preapred statement
    $stmt_result;     // Statement results

    // Check if the user is using email or username
    if(filter_var($user, FILTER_VALIDATE_EMAIL) === true){
        
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
            
            $_SESSION['loggedin'] = true; 
            $_SESSION['loggedin_user'] = $user_id;
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

/* FUNCTIONS ~ FUNCTIONS ~ FUNCTIONS ~ FUNCTIONS ~ FUNCTIONS ~ FUNCTIONS ~ FUNCTIONS ~ */

/*  This function takes a result set that only has 1 row and returns the result
*   $reuslt_set : result set from a prepared statement
*/  
function get_single_result($result_set){
    if($result_array = mysqli_fetch_array($result_set, MYSQLI_NUM))
    {
        foreach($result_array as $single_result){
            return $single_result;
        }
    }
}

/*  This function prepares a query and executes it, and returns a result set
*   This function can only handle ONE variable to be prepared
*   $mysqli : Mysqli Object
*   $sql : SQL query
*   $var : Variable to insert into the prepared query
*   $type : type of variable to insert into the prepared query
*/
function execute_single_variable_prepared_stmt($mysqli_object,$sql,$var,$type){
    $stmt = $mysqli_object->prepare($sql);
    $stmt->bind_param($type,$var);
    $stmt->execute();
    return $stmt->get_result();
}

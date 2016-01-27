<?php

include_once 'config.php';
include_once 'functions.php';
session_start();

if( array_key_exists('editProfile_firstName',$_POST)
    && array_key_exists('editProfile_lastName',$_POST)
    && array_key_exists('editProfile_status',$_POST)
    && array_key_exists('editProfile_nationality',$_POST)
    && array_key_exists('editProfile_dob',$_POST)
){
    
    $firstName = $_POST['editProfile_firstName'];
    $lastName = $_POST['editProfile_lastName'];
    $status = $_POST['editProfile_status'];
    $nationality = $_POST['editProfile_nationality'];
    $dob = $_POST['editProfile_dob'];
    
    // Set variables
    $response;        // Our response to the user
    $stmt_sql;        // SQL for the statement
    $stmt_query;      // Prepared statements
    $stmt_result;     // Statement results
    $sql;
    $result;
    
    // Regex check for first and last name
    if(preg_match('/^[a-zA-Z]{2,25}$/',$firstName,$matches) && preg_match('/^[a-zA-Z]{2,25}$/',$lastName,$matches)){  
        $sql = 'SELECT * FROM userDetailDB WHERE userDetail_fk_user_id = '.$_SESSION['loggedin_user'];
        $result = $mysqli->query($sql);
        // Insert if new record, else update the old records
        if($result->num_rows == 0){
            $stmt_sql = 'INSERT INTO userDetailDB (userDetail_firstName, userDetail_lastName, userDetail_status, userDetail_nationality, userDetail_dob, userDetail_fk_user_id) VALUES (?,?,?,?,?,?)';
            $stmt_query = $mysqli->prepare($stmt_sql);
            $stmt_query->bind_param('ssissi',$firstName,$lastName,$status,$nationality,$dob,$_SESSION['loggedin_user']);
        }else{
            $stmt_sql = 'UPDATE userDetailDB SET userDetail_firstName = ?, userDetail_lastName = ?, userDetail_status = ?, userDetail_nationality = ?, userDetail_dob = ? WHERE userDetail_fk_user_id = '.$_SESSION['loggedin_user'];
            $stmt_query = $mysqli->prepare($stmt_sql);
            $stmt_query->bind_param('ssiss',$firstName,$lastName,$status,$nationality,$dob);
        }
        if($stmt_query->execute()){
            $response = 'success';
        }else{
            $response = 'error';
        }
    }else{
        $response = "name doesn't match the criteria: minimum 2, maximum 25 and letters only";
    }
}else{
    $response = "Field(s) missing, please check your inputs";
}

$mysqli->close();

echo $response;

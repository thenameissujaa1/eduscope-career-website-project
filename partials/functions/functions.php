<?php

/*  This script holds a set of custom functions
*/

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
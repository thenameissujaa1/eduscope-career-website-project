<?php

include_once 'config.php';
session_start();

$response = array();

// Backend validation of data
if(array_key_exists('table',$_POST)){
    $table = $_POST['table'];
    if(preg_match('/^(user_school_qualification)$/',$table,$match)){
        switch($table){
            case 'user_school_qualification':
                if(array_key_exists('type',$_POST)){
                    $type = $_POST['type'];
                    switch($type){
                        case 'school':
                            if(array_key_exists('school_name',$_POST)
                                && array_key_exists('grad_year',$_POST)
                                && array_key_exists('qualification',$_POST)
                                && array_key_exists('t_subjects',$_POST)){
                                    $school_name = $_POST['school_name'];
                                    $qualification = $_POST['qualification'];
                                    $grad_year = $_POST['grad_year'];
                                    $t_subjects = $_POST['t_subjects'];
                                    // TODO: Add Regex check for each field
                                    $check = false;
                                    for($i = 1; $i <= $t_subjects; $i++){
                                        if(array_key_exists('subject_name_'.$i,$_POST) && array_key_exists('subject_score_'.$i,$_POST)){
                                            // TODO: Check if the subjects are not repeated and if they are not out of bounds
                                            $check = true;
                                            $subject_names[$i-1] = $_POST['subject_name_'.$i];
                                            $subject_scores[$i-1] = $_POST['subject_score_'.$i];
                                        }else{
                                            $check = false;
                                        }
                                    }
                                    if($check){
                                        $response['status'] = 1;
                                    }else{
                                        $response['status'] = 0;
                                        $response['error'] = "Information for subject ".$i." is missing";
                                    }
                                }else{
                                    $response['status'] = 0;
                                    $response['error'] = "One or more fields are missing";
                                }
                        break;
                        case 'university':
                        break;
                        default:
                            $response['status'] = 0;
                            $response['error'] = "You must either select school or university";
                    }//switch end
                }else{
                    $response['status'] = 0;
                    $response['error'] = "Error processing request (03)";
                }
            break;
        }//switch end
    }else{
        $response['status'] = 0;
        $response['error'] = "Request is not supported (02)";
    }
}else{
    $response['status'] = 0;
    $response['error'] = "Error processing request (01)";
}

// Insertion of data and update of user score
if($response['status'] == 1){
    switch($table){
        case 'user_school_qualification':
            $stmt_sql = 'INSERT INTO user_school_qualification (fk_user_id,school_name,grad_year,qualification) VALUES (?,?,?,?)';
            $stmt_query = $mysqli->prepare($stmt_sql);
            $stmt_query->bind_param('issi',$_SESSION['loggedin_user'],$school_name,$grad_year,$qualification);
            if($stmt_query->execute()){
                $sql = 'SELECT id FROM user_school_qualification WHERE fk_user_id = '.$_SESSION['loggedin_user'];
                $result = $mysqli->query($sql);
                $result = $result->fetch_assoc();
                $usqid = $result['id'];
                for($i = 0; $i < count($subject_names); $i++){
                    $stmt_sql = 'INSERT INTO user_school_qualification_subjects (fk_user_school_qualification_id,fk_subject_id,score) VALUES (?,?,?)';
                    $stmt_query = $mysqli->prepare($stmt_sql);
                    $stmt_query->bind_param('iii',$usqid,$subject_names[$i],$subject_scores[$i]);
                    if($stmt_query->execute()){
                        // do nothing
                    }else{
                        $response['status'] = 0;
                        $response['error'] = 'Unable to process request (02)';
                    }
                }
            }else{
                $response['status'] = 0;
                $response['error'] = 'Unable to process request (01)';
            }
        break;
    }
}

$mysqli->close();

send_response($response);

function send_response($data){
    header('Content-type: application/json');
    echo json_encode($data);
}
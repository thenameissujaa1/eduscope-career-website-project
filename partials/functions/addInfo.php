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
                                && array_key_exists('qualification',$_POST)){
                                    $school_name = $_POST['school_name'];
                                    $qualification = $_POST['qualification'];
                                    $grad_year = $_POST['grad_year'];
                                    
                                    if($qualification != 1){
                                        if(array_key_exists('t_subjects',$_POST)){
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
                                        }
                                    }// qualification != 1
                                    $response['status'] = 1;
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
            // TODO: Check if the qualification already exists in the table
            $sql = 'SELECT * FROM user_school_qualification WHERE fk_user_id = '.$_SESSION['loggedin_user'];
            $result = $mysqli->query($sql);
            $sCheck = 0; // school check
            $hsCheck = 0; // high school check
            
            while($row = $result->fetch_assoc()){
                if($row['qualification'] == 1)
                    $sCheck++;
                else
                    $hsCheck++;
            }
            
            // if result is not there then proceed or else give error
            if($sCheck <= 1 && $hsCheck <= 1){    
                $stmt_sql = 'INSERT INTO user_school_qualification (fk_user_id,school_name,grad_year,qualification) VALUES (?,?,?,?)';
                $stmt_query = $mysqli->prepare($stmt_sql);
                $stmt_query->bind_param('issi',$_SESSION['loggedin_user'],$school_name,$grad_year,$qualification);
                
                if($stmt_query->execute()){
                    if($qualification != 1){
                        $sql = 'SELECT id FROM user_school_qualification WHERE fk_user_id = '.$_SESSION['loggedin_user'].' AND qualification = '.$qualification;
                        $result = $mysqli->query($sql);
                        $resultArr = $result->fetch_assoc();
                        $usqid = $resultArr['id'];
                        $stmt_sql = 'INSERT INTO user_school_qualification_subjects (fk_user_school_qualification_id,fk_subject_id,score) VALUES (?,?,?)';
                        $stmt_query = $mysqli->prepare($stmt_sql);
                    
                        for($i = 0; $i < $t_subjects; $i++){
                            $stmt_query->bind_param('iis',$usqid,$subject_names[$i],$subject_scores[$i]);
                    
                            if($stmt_query->execute()){
                                // Update the user scores for subjects
                                $sql = 'SELECT * FROM user_subject_score WHERE fk_user_id ='.$_SESSION['loggedin_user'].' AND fk_subject_id = '.$subject_names[$i];
                                $result = $mysqli->query($sql);
                                $score = getUCAS($qualification,$subject_scores[$i]);
                                
                                if($result->num_rows <= 0){
                                    // insert
                                    $sql = 'INSERT INTO user_subject_score (fk_user_id,fk_subject_id,score) VALUES ('.$_SESSION['loggedin_user'].','.$subject_names[$i].','.$score.')';
                                    $mysqli->query($sql);
                                    // TODO add error handling
                                }else{
                                    // update
                                    $sql = 'UPDATE user_subject_score SET score = \''.$score.'\' WHERE fk_user_id = '.$_SESSION['loggedin_user'].' AND fk_subject_id = '.$subject_names[$i];
                                    $mysqli->query($sql);
                                    // TODO add error handling
                                }
                            }else{
                                //echo("Error description: " . mysqli_error($mysqli));
                                $response['status'] = 0;
                                $response['error'] = 'Unable to process request (02)';
                            }
                        }
                    }else{
                        //echo("Error description: " . mysqli_error($mysqli));
                        $response['status'] = 0;
                        $response['error'] = 'Unable to process request (01)';
                    }
                }//.qualification != 1
            }else{
                $response['status'] = 0;
                $response['error'] = 'An entry for similar qualification already exists';
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

function getUCAS($q,$g){
    switch($q){
        case '2': // AS levels
            switch($g){
                case 'A': return 60;
                case 'B': return 50;
                case 'C': return 40;
                case 'D': return 30;
                case 'E': return 20;
                default: return 'X';
            }
        case '3': // A levels
            switch($g){
                case 'A*': return 140;
                case 'A': return 120;
                case 'B': return 100;
                case 'C': return 80;
                case 'D': return 60;
                case 'E': return 40;
                default: return 'X';
            }
        case '4': // Scottish Highers
            switch($g){
                case 'A': return 80;
                case 'B': return 65;
                case 'C': return 50;
                case 'D': return 36;
                default: return 'X';
            }
        case '5': // Scottish Advance Highers
            switch($g){
                case 'A': return 130;
                case 'B': return 110;
                case 'C': return 90;
                case 'D': return 72;
            }
        default: return 'X';
    }
}
<?php

   
    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/TeacherModel.php';
     require_once '../../model/SuperModel.php';
    require_once '../super/SessionStart.php';
        require_once '../../entities/EmailService.php';
  
 
  if (isset ($_POST['btn_approve']) && $_POST['btn_approve'] == "btn_approve")
 {
       
      $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
       $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'PROC';     
              
        if (SuperModel::update_laave_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            //send email to head teacher 
            
             
              $email_subject  = "Teacher Leave Request";
              $data = $user_names."-".$user_master_public_id." has submited a leave request please login to T.T.M.S and process the request<br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
           
             $stm = SuperModel::get_email_by_positon_id(3);
             
              while ( $row = $stm->fetch(PDO::FETCH_ASSOC) )
                      
                      {
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                        $email_address = $row['EmailAddress'];
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $StatusCode, $UpdatedBy));
     
                        }
                      }
           // echo 'submited';
        }else
        {
            echo 'not submited';
        }
      
    
          
 }
 else if (isset ($_POST['btn_reject']) && $_POST['btn_reject'] == "btn_reject")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
      $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
              
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'REGE';     
              
        if (SuperModel::update_laave_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            //send email to user 
              $EmailStatusCode = 'PEND';
             $email_subject  = "Teacher Leave Request";
              $data = "Greetings, Sory to inform you ". $user_names."-".$user_master_public_id." your request from leave has been declined pleas login to T.T.M.S to view request<br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
             
             
              
             $email_address = SuperModel::get_email_by_id($user_master_public_id);
             
          
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
                     echo 'submited';
                        } else {
                             echo 'failed';
                        }
                      
            
           
        }else
        {
            echo 'not submited';
        }
 }
 
 else if (isset ($_POST['btn_freject']) && $_POST['btn_freject'] == "btn_reject")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
      
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'FRJC';     
              
        if (SuperModel::update_laave_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            
            echo 'submited';
        }else
        {
            echo 'not submited';
        }
 }
     
 else if (isset ($_POST['btn_fapprove']) && $_POST['btn_fapprove'] == "btn_fapprove")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
       $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
  
       $email_address = SuperModel::get_email_by_id($user_master_public_id);
             
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'APPR';     
             $EmailStatusCode = 'PEND';  
        if (SuperModel::update_final_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            
            $email_subject  = "Leave Request Approval";
              $data = $user_names."-".$user_master_public_id." Your leave request has  been approved please login to T.T.M.S and to view details<br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
           
             $stm = SuperModel::get_email_by_positon_id(3);
             
           
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
     
                        }
                      
            //add notification and redirect
            
            //echo 'submited';
        }else
        {
            echo 'not submited';
        }
 }
 
 else if (isset ($_POST['btn_freject']) && $_POST['btn_freject'] == "btn_freject")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
      $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
  
       $email_address = SuperModel::get_email_by_id($user_master_public_id);
        
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'FRJC';     
         $EmailStatusCode = 'PEND';       
        if (SuperModel::update_final_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            
             $email_subject  = "Leave Request Rejected";
              $data = $user_names."-".$user_master_public_id." Your leave request has  been rejected please login to T.T.M.S and to view details<br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
           
             $stm = SuperModel::get_email_by_positon_id(3);
             
           
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
     
                        }
          
        //  echo 'submited';
        }else
        {
            echo 'not submited';
        }
 }
 
 else if (isset ($_POST['text']))
 {
     echo 'Test';  
 }

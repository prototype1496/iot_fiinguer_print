<?php

   
    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/LoginModel.php';
    require_once '../super/SessionStart.php';
    
    $btn_term = trim(filter_input(INPUT_POST, 'btn_term', FILTER_DEFAULT));
    $btn_test = trim(filter_input(INPUT_POST, 'btn_test', FILTER_DEFAULT));

    $user_name = trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_EMAIL));
    $password = trim(filter_input(INPUT_POST, 'password', FILTER_DEFAULT));
    $btn_submit = trim(filter_input(INPUT_POST, 'btn_login', FILTER_SANITIZE_STRING));

    $is_remember_me  = trim(filter_input(INPUT_POST, 'chk_rmember_me', FILTER_SANITIZE_STRING));

    
    if (isset($user_name) && isset($password) && isset($btn_submit)){
        
        $login_model = new Login();
        
//        $hashedPassword = password_hash('my super cool password', PASSWORD_DEFAULT);
//        
//        password_verify('the wrong password', $hashedPassword); 

    
    }else if (isset ($btn_term)){
        
        echo 'Set';
    }else if (isset ($btn_test)){
        
       echo 'Test Set'; 
    }
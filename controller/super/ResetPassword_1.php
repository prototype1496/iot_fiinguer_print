<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require '../../lib/phpmailer/vendor/autoload.php';
  $errors = array();

if (isset($_POST['submit'])) {
    // initializing variable
 
  
    // receive all input values from the form
   
    
    $password = strip_tags(trim( $_POST['password']));
    $rentered_password = strip_tags(trim($_POST['rentered_password']));

   $isAllConditionsTrue = 0;
   
    
    if (empty($password)|| empty($rentered_password)) {
        array_push($errors, "Password is required");$isAllConditionsTrue=1;
        
    }else{
        
           if (!preg_match('/[A-Z]/', $password)){
        array_push($errors, "Password must have atleats 1 uppercase character");
        $isAllConditionsTrue=1;
    }
    if(!preg_match('/[a-z]/', $password)){
        array_push($errors, "Password must have atleats 1 lowercase character");
        $isAllConditionsTrue=1;
    }
    if (!preg_match('/[0-9]/', $password)){
        array_push($errors, "Password must have atleats 1 digit");
        $isAllConditionsTrue=1;
    }
    if (strlen($password) < 8){
        array_push($errors, "Password must be atleast 8 characters");
        $isAllConditionsTrue=1;
    }            
    if ($password != $rentered_password) {
        array_push($errors, "The two passwords do not match");
        $isAllConditionsTrue=1;
} 
    }

if($isAllConditionsTrue==0){
    
       $userName = strip_tags(trim($_POST['username']));
    
  
    
    require_once '../../entities/db_connection/dbconfig.php';
    require_once '../../entities/User.php';
    require_once '../../model/PasswordModel.php';
   require_once '../../model/LoginModel.php';
  
   
    $change_password_model = new PasswordModel();
     $login_model = new LoginModel();
     
     
     
  $user_email = "";
    
    if($change_password_model->update_password(new User($userName, $password))){
        
        if($change_password_model->get_user_infromation($userName)){
            $user_role = $change_password_model->get_user_infromation($userName);
           
           if($user_role['roleid'] == 2){
             $user_email = $change_password_model->get_employee_emaile_address($user_role['userid']);   
           }elseif ($user_role['roleid'] == 3) {
                   $user_email = $change_password_model->get_parent_email_address($user_role['userid']);   
                }else{
                   $user_email = "";   
                }
            
        }
        
       if($user_email != "" || !(empty($user_email))){
           
          $mail = new PHPMailer(true);     


     //$name = "Ali"; 
    //$password2 = "Abmlkff";
    $subject = "Password Change Sucessful"; 
    $email = $user_email; 
    
   
    $message = "This is a private message if it dose not belong to you please ignore and delete it thankyou."; 
    




    try {
        //Server settings
        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'mu2014adevelopers@gmail.com';                 // SMTP username
        $mail->Password = 'mulungushi';                           // SMTP password
        $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 587;                                    // TCP port to connect to
        
        //Recipients
        $mail->setFrom('mu2014adevelopers@gmail.com', 'Vaccination And Immunization System ');
        $mail->addAddress($email, $userName);

        $mail->isHTML(TRUE);
        $mail->Subject = $subject;
        $mail->Body = '<b>UserName:</b> ' . $userName . 
                '<br><b>Passowrd:</b> ' . $password . 
                '<br><br><img src="cid:underfive">'.
            
                '<br><br><b>' . $message.'</b>';

           $mail->addEmbeddedImage(dirname(__FILE__).'/../img/images.png', 'underfive');
           
       
        
        if( $mail->send()){
              echo("<SCRIPT LANGUAGE='JavaScript'>
                      window.alert('Password Changing Successfully  please login ');
		    
			 location.href='/vims/index.php';   
             </SCRIPT>" );
            
        }else{
             echo("<SCRIPT LANGUAGE='JavaScript'>
                      window.alert('Password Changing Successfully Please Login');
		    
			 location.href='/vims/index.php';   
             </SCRIPT>" );
            
        }
//        echo 'Message has been sent'; 
       
    } catch (Exception $e) {
//        echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
       echo("<SCRIPT LANGUAGE='JavaScript'>
                      window.alert('Password Changing Successfully Please Login');
		    
			 location.href='/vims/index.php';   
             </SCRIPT>" );
    }


        
       }  else {
      echo("<SCRIPT LANGUAGE='JavaScript'>
                      window.alert('Password Changing Successfully Please Login');
		    
			 location.href='/vims/index.php';   
             </SCRIPT>" );
       } 

}


    }else{
  

        
}
}
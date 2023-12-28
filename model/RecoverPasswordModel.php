<?php

class RecoverPasswordModel{
    
    public function add_reset_details($user_details){
        
             $getConnectin = new Connection();                                             
        $con = $getConnectin->connect();
       
      
     
    $sql = "INSERT INTO `password_reset` (`username`, `token`, `token_creation`) VALUES ('$user_details->token_username', '$user_details->token', '$user_details->reset_date');";     
       
    if ($con->query($sql) === TRUE) {

            $con->close();
            return TRUE;
            
        } else {
            return FALSE;
        }
    }
    
   
     public function reset_password($user)
            {
          $getConnection = new Connection();
        $con = $getConnection->connect();
        $sql = "call changePassword('$user->username','$user->password');";
        // $sql = "call changePassword('".$user->username.",".$user->password."');";
        
         try {
             
           $result = mysqli_query($con, $sql);
           print_r($result);
             
             
            if($result){
                
                 return TRUE;
            }
            
        } catch (Exception $exc) {
            return FALSE;
        }
             }
      public function get_reset_details($token){
        $getConnectin = new Connection();                                             
        $con = $getConnectin->connect();
        $sql ="call getResetDetails('".$token."')";
        
       $result =  mysqli_query($con, $sql);
       
     
       return $result;
       
        
    }
    
    public function check_email_exists($email)
            {
          $getConnection = new Connection();
        $conn = $getConnection->connect();
        $sql = "call checkEmailValid('".$email."');";
        
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {

            return TRUE;
        } else {

            return FALSE;
        }
             }
             
             
function createToken()
{
    $data = bin2hex(openssl_random_pseudo_bytes(32));
    /* Create a part of token using secretKey and other stuff */
    $tokenGeneric = $data; // It can be 'stronger' of course
    
    $token = $tokenGeneric;
    /* Encoding token */
    $hushed_token = hash('sha256',$token );
   
  //  $urls = array('token'=>'http://'.$_SERVER["SERVER_NAME"].'/OnlineDataBase/View/PasswordRecovery/index.php?reset='.$token,'hushed_token'=>$hushed_token);
      $urls = array('token'=>'http://localhost/OnlineDataBase/View/PasswordRecovery/resetPassword.php?reset='.$token,'hushed_token'=>$hushed_token);

    return $urls;
}
}


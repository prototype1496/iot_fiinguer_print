<?php

class SuperModel{
   public static function get_gender() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetGender();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
    public static function get_leave_types() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveTypes();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
      public static function get_marital_status() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetMaritalStatus();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
      public static function get_country_code() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetCountryCode();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
     public static function get_teacher_positions() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetPositions();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }



    public static function get_class_details() {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllClassDetails();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;

    }
   
      public static function get_all_school_depatments() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllDepartments();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
        public static function get_provinces() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetProvinces();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
     public static function get_leave_request_data($details_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetLeaveRequestDetails('$details_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;  
    }
   
   
    public static function get_sequence_id($sequence_number) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetSequence($sequence_number);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['SequnceNumber'];
      
    }

    public static function get_student_no($sequence_number) {

        $Connection = new Connection();
        $conn = $Connection->connect();



        $query = "CALL GetStudentNo($sequence_number);";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row['SequnceNumber'];

    }
    
    
     public static function get_email_by_positon_id($position_code_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetEmailAdressByPositionID('$position_code_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        
            return $stm;
      
    }
    
    
    
      public static function get_email_by_positon_id_department_code($department_code,$position_code) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetHODEmailAdressByDepartment('$department_code',$position_code);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        
            return $stm;
      
    }
    
    
    public static function get_email_by_id($public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetUserEmailByID('$public_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['EmailAddress'];
         
      
    }
    
    
        public static function get_worked_hours($teacher_master_public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetWorkedHours('$teacher_master_public_id');";
        $stm = $conn->query($query);
    
//
         $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['HoursWorks'];
        
    
    }
    
    
    
    
       
    public static function check_checked_in_status($teacher_master_id) {
       //This function is used to get the Public ID form the teacher master table 
        // note that the GetTeacherDetailsByUsername sp can return more information if it is modified
        
        $Connection = new Connection();
        $conn = $Connection->connect();
 
        $query = "CALL CheckCheckedInStatus('$teacher_master_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['IsCheckedIn'];
      
    }
    
    
    
    public static function check_checked_out_status($teacher_master_id) {
       //This function is used to get the Public ID form the teacher master table 
        // note that the GetTeacherDetailsByUsername sp can return more information if it is modified
        
        $Connection = new Connection();
        $conn = $Connection->connect();
 
        $query = "CALL CheckChekedOutStatus('$teacher_master_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['IsCheckedOut'];
      
    }


    
       
    public static function check_out_teacher($TeacherMasterPublicID) {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL CheckTeacherOut(:TeacherMasterPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':TeacherMasterPublicID'=>$TeacherMasterPublicID));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
     function get_districts_by_provinceid($provinceid) {
        //This function is used to load the districts whih a given province ID
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetDistrictByProvinceId(:province);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':province' => $provinceid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php

            echo "  <div class='form-group'>  <div class='col-md-2'>    <select class='form-control' name='district_id' required='required' ><option value='' selected disabled=''>Select District</option>";
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['districtId'] . ">" . $row['name'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo"</select>";
        } else {

            echo "  <div class='col-md-2'> <select class='form-control' name='district_id' required='required'><option value=''  selected disabled='' >Select District</option> </select>  </div>";
        }
            
        
        
    }
   
    
    
     public static function add_email_data($EmailData) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "INSERT INTO `emailservice` (`EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`) VALUES (:EmailSerial, :EmailAddress, :EmailSubject, :SendData, :Status, :UpdatedBy);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':EmailSerial'=>$EmailData->EmailSerial,':EmailAddress'=>$EmailData->EmailAddress, ':EmailSubject'=>$EmailData->EmailSubject, ':SendData'=>$EmailData->SendData,':Status'=>$EmailData->Status, ':UpdatedBy'=>$EmailData->UpdatedBy));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    
    public static function update_user_password($user_name,$password) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL UpdatePasswordByUsername(:Username,:Password);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':Username'=>$user_name,':Password'=>$password));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    public static function update_final_request($StatusCode, $UpdatedBy, $ApprovedBy,$TeacherDetailsPublicID) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL ProcessFinalLeaveRequest(:StatusCode, :UpdatedBy, :ApprovedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StatusCode'=>$StatusCode,':UpdatedBy'=>$UpdatedBy,'ApprovedBy'=>$ApprovedBy,'TeacherDetailsPublicID'=>$TeacherDetailsPublicID));

           // print_r($query) ;
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    public static function update_laave_request($StatusCode, $UpdatedBy, $ApprovedBy,$TeacherDetailsPublicID) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL ProcessLeaveRequest(:StatusCode, :UpdatedBy, :ApprovedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StatusCode'=>$StatusCode,':UpdatedBy'=>$UpdatedBy,'ApprovedBy'=>$ApprovedBy,'TeacherDetailsPublicID'=>$TeacherDetailsPublicID));

           // print_r($query) ;
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function genarate_username($username,$phone_number){


        if (($username!="")||(!(empty($username)))|| $username != NULL){

            return $username;
        }  else {
            return $phone_number;
        }

    }


    public static function get_class_details_by_grade_id($grade_id) {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassByID('$grade_id');";
        $stm = $conn->query($query);

        return $stm;

    }

    public static function get_all_students() {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudents();";
        $stm = $conn->query($query);

        return $stm;

    }

    public static function get_all_students_attendance_report() {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentAttendanceReport();";
        $stm = $conn->query($query);

        return $stm;

    }

    public static function get_all_students_attendance_report_by_class($class) {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentAttendanceReportByClass($class);";
        $stm = $conn->query($query);

        return $stm;

    }





    public static function get_student_by_id($student_id) {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetStudetDetailsByID('$student_id');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();

        return  $stm->fetch(PDO::FETCH_ASSOC);



    }


    public static function get_checkout_student_by_id($student_id) {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetCheckoutStudentByID('$student_id');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();

        return  $stm->fetch(PDO::FETCH_ASSOC);



    }

    public static function create_report_record($student_public_id, $updated_by) {

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();


            $query1 = "INSERT INTO `studentrreportdetails` (`StudentPublicID`, `UpdatedBy`) VALUES ('$student_public_id', '$updated_by')";

            $stm = $conn->prepare($query1);
            $stm->execute();


            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }




    public static function close_report_record($student_report_details_id) {

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();


            $query1 = "UPDATE `studentrreportdetails` SET `TimeOut`=CURRENT_TIMESTAMP() WHERE  `StudentReportDetailsPublicID`='$student_report_details_id';";

            $stm = $conn->prepare($query1);
            $stm->execute();


            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function get_class_details_report($class_master_id) {
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassDetails('$class_master_id');";
        $stm = $conn->query($query);

        return $stm->fetch(PDO::FETCH_ASSOC);


    }



}
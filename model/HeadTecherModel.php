<?php

class HeadTeacherModel{
    
       public static function get_all_positions($start,$limit) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetPositionDetails($start, $limit);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         
         
            return $stm;
      
    }
    
    public static function get_all_terms($start,$limit) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "SELECT * FROM termmaster RD ORDER BY RD.TermMasterID ASC Limit $start, $limit;";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         
         
            return $stm;
      
    }
    
    
        public static function get_term_pages_count($limit) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetTermPages($limit);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
    }
    
    
    
          public static function get_teacherposition_pages_count($limit) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetPositonPages($limit);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
    }
    
    
    
       public static function get_all_leave_requests($statusCode) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllLeaveRequest('$statusCode');";
         $stm = $conn->query($query);
   
            return $stm;
      
    }
    
    
        public static function get_approved_leave_requests($statusCode) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllApprovedLeaveRequest('$statusCode');";
         $stm = $conn->query($query);
   
            return $stm;
      
    }
    
    public static function get_leave_requests($statusCode,$departmentCode) {
       //This function and the sp is uesed to get the leave requestes bases on the department e.g for HODs and the status code 
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveRequests('$statusCode','$departmentCode');";
         $stm = $conn->query($query);
   
            return $stm;
      
    }
    
    
        public static function get_teacher_leave_requests($statusCode,$departmentCode,$teacher_id) {
       //This function and the sp is used to get the leave requestes bases on the department, statuses code , teracher_id e.g for teachers 
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveTeachersRequests('$statusCode','$departmentCode','$teacher_id');";
         $stm = $conn->query($query);
   
            return $stm;
      
    }
    
    public static function get_all_leave_requests_count() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetAllLeveRequestCount();";
         $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
    }
    
    public static function get_leave_requests_count($department_code) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetLeveRequestCount('$department_code');";
         $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
    }
    
    
    
    public static function get_teachers_leave_requests_count($department_code,$teacher_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetLeveTeacherRequestCount('$department_code','$teacher_id');";
         $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
    }
//    public static function compaer($existing_data, $modified_data)
//            {
//        
//                $size_of_existing  = count($existing_data);
//                $size_of_moodified_data  = count($modified_data);
//                
//                $temp = $existing_data[''];
//                for ($i=0; $i <= $size_of_moodified_data; $i++){
//                   
//                   // if ()
//                    
//                }
//                
//            }
    
    public static function get_max_terms (){
        $Connection = new Connection();
        $conn = $Connection->connect();


        $query = "CALL GetMaxTems";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         
        $row = $stm->fetch(PDO::FETCH_ASSOC);

         //print_r();
         
           return $row['MaxTerms'];
       
    }
    
    
    
     public static function add_position_master($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
       // print_r(count($tem_data[0]));
           $args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO teacherpositionmaster (`TeacherPositionMasterID`,`PositionName`,`PositionDescription`,`UpdatedBy`) VALUES  (?,?,?,?)";
            $stm = $conn->prepare($query);
            
            
            foreach ($tem_data as $data)
            {
                
                if (empty($data[0])){
                   // print_r($data);
                   $stm->execute($data);
                }else{
                    
                    
                }
               
              //  
            }
             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }
    //this functiion is used to add a term to the term master table 
    
     public static function add_term($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
        
           $args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO termmaster (`TermMasterID`,`TermName`) VALUES  (". implode(',', $args).")";
            $stm = $conn->prepare($query);
            
            foreach ($tem_data as $data)
            {
                
                if (empty($data[0])){
                    $stm->execute($data);
                }else{
                    
                    
                }
               
              //  
            }
             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
           // echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
     public static function edit_term($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
     
              $query = "UPDATE termmaster SET `TermName` = ? WHERE TermMasterID = ?" ;
            $stm = $conn->prepare($query);
            
            foreach ($tem_data as $data)
            {
               $stm->execute($data); 
        
            }
             
     
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
          //  echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    public static function edit_position_master($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
     
              $query = "UPDATE `teacherpositionmaster` SET `PositionName`= ?, `PositionDescription`= ? , `UpdatedBy`= ? WHERE  `TeacherPositionMasterID`= ?;" ;
            $stm = $conn->prepare($query);
            
            foreach ($tem_data as $data)
            {
              $stm->execute($data); 
        
            }
             
     
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
          //  echo $exc->getMessage();
            return FALSE;
        }
    }
    
    public static function delet_term($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
     
              $query = "DELETE FROM termmaster WHERE TermMasterID = ?" ;
            $stm = $conn->prepare($query);
            
            foreach ($tem_data as $data)
            {
                
                
              $stm->execute($data); 
        
            }
             
     
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
          //  echo $exc->getMessage();
            return FALSE;
        }
    }

    
    

    
       public static function genarate_temp_passowrd(){
    
  $s = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyz", 5)), 0, 5);
  
  return strtoupper($s);
}

    

    public static function create_teacher($Teacher) {
        //the below function creates a teacher in the database
        
        //print_r($Teacher);
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
          
            $conn->beginTransaction();

           
            //Insets data new session into the session table
            $query1 = "INSERT INTO `teacher_register_db`.`usermaster` (`PublicID`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`) VALUES (:PublicID, :NRC, :Passport, :UserName, :Password, :FirstName, :LastName, :OtherName, :EmailAddress, :ContactNo, :GenderID, :MaritalStatusID, :DOB, :UserTypeID, :UpdatedBy);";
            $stm = $conn->prepare($query1);
            $stm->execute(array(':PublicID'=>$Teacher->PublicID, ':NRC'=>$Teacher->NRC, ':Passport'=>$Teacher->Passport, ':UserName'=>$Teacher->UserName, ':Password'=>$Teacher->Password, ':FirstName'=>$Teacher->FirstName, ':LastName'=>$Teacher->LastName, ':OtherName'=>$Teacher->OtherName, ':EmailAddress'=>$Teacher->EmailAddress, ':ContactNo'=>$Teacher->ContactNo, ':GenderID'=>$Teacher->GenderID, ':MaritalStatusID'=>$Teacher->MaritalStatusID, ':DOB'=>$Teacher->DOB, ':UserTypeID'=>$Teacher->UserTypeID, ':UpdatedBy'=>$Teacher->UpdatedBy));

            
             //Insets data new session into the session table
            $query2 = "INSERT INTO `teacher_register_db`.`teachermaster` (`PublicUserID`, `PositionID`, `DepartmentCode`, `UpdatedBy`) VALUES (:PublicID, :PositionID,:DepartmentCode,:UpdatedBy);";
            $stm = $conn->prepare($query2);
            $stm->execute(array(':PublicID'=>$Teacher->PublicID, ':PositionID'=>$Teacher->PositionID, ':DepartmentCode'=>$Teacher->DepartmentID, ':UpdatedBy'=>$Teacher->UpdatedBy));

             
                //Insets data new session into the session table
            $query3 = "INSERT INTO `teacher_register_db`.`address` (`PrimaryAddress`, `SecondaryAddress`, `DistrictID`, `IdentificationID`) VALUES (:PrimaryAddress, :SecondaryAddress, :DistrictID, :IdentificationID);";
            $stm = $conn->prepare($query3);
            $stm->execute(array(':PrimaryAddress'=>$Teacher->PrimaryAddress,':SecondaryAddress'=>$Teacher->SecondaryAddress, ':DistrictID'=>$Teacher->DistrictID, ':IdentificationID'=>$Teacher->PublicID));

            
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    public static function add_leave_details($TeacherMasterID, $ReasonForLeave, $LeaveFrom, $LeaveTo, $StatusCode, $UpdatedBy,$leave_type_id,$teacher_details_public_id) {
        //the below function creates a teacher in the database
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
          
            $conn->beginTransaction();

           
            //Insets data new session into the session table
           
            $query1 = "INSERT INTO `teacherdeatails` (`TeacherMasterID`, `ReasonForLeave`, `LeaveFrom`, `LeaveTo`, `StatusCode`, `LeaveTypeID`, `UpdatedBy`,`TeacherDetailsPublicID`) VALUES (:TeacherMasterID, :ReasonForLeave, :LeaveFrom, :LeaveTo, :StatusCode,:LeaveTypeID, :UpdatedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query1);
            $stm->execute(array(':TeacherMasterID'=>$TeacherMasterID, ':ReasonForLeave'=>$ReasonForLeave, ':LeaveFrom'=>$LeaveFrom, ':LeaveTo'=>$LeaveTo, ':StatusCode'=>$StatusCode,':LeaveTypeID'=>$leave_type_id ,':UpdatedBy'=>$UpdatedBy,':TeacherDetailsPublicID'=>$teacher_details_public_id));

                        
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
}
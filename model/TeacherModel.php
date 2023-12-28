<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TeacherModel
 *
 * @author HP
 */
class TeacherModel {
 
    
     public static function  add_teacher_report_details($TeacherMasterPublicID,$TeacherDetailsPublicID,$UpdatedBy) {
        //the below function creates a teacher in the database
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
      
            $conn->beginTransaction();

           
            //Insets data new session into the session table
            $query1 = "INSERT INTO `teacherreportdetails` (`TeacherMasterPublicID`, `TeacherDetailsPublicID`, `UpdatedBy`) VALUES (:TeacherMasterPublicID, :TeacherDetailsPublicID, :UpdatedBy);";
            $stm = $conn->prepare($query1);
            $stm->execute(array(':TeacherMasterPublicID'=>$TeacherMasterPublicID, ':TeacherDetailsPublicID'=>$TeacherDetailsPublicID, ':UpdatedBy'=>$UpdatedBy));

            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function create_teacher($Teacher) {
        //the below function creates a teacher in the database

        //print_r($Teacher);
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();


            //Insets data new session into the session table
            $query1 = "INSERT INTO `usermaster` (`PublicID`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`) VALUES (:PublicID, :NRC, :Passport, :UserName, :Password, :FirstName, :LastName, :OtherName, :EmailAddress, :ContactNo, :GenderID, :MaritalStatusID, :DOB, :UserTypeID, :UpdatedBy);";
            $stm = $conn->prepare($query1);
            $stm->execute(array(':PublicID'=>$Teacher->PublicID, ':NRC'=>$Teacher->NRC, ':Passport'=>$Teacher->Passport, ':UserName'=>$Teacher->UserName, ':Password'=>$Teacher->Password, ':FirstName'=>$Teacher->FirstName, ':LastName'=>$Teacher->LastName, ':OtherName'=>$Teacher->OtherName, ':EmailAddress'=>$Teacher->EmailAddress, ':ContactNo'=>$Teacher->ContactNo, ':GenderID'=>$Teacher->GenderID, ':MaritalStatusID'=>$Teacher->MaritalStatusID, ':DOB'=>$Teacher->DOB, ':UserTypeID'=>$Teacher->UserTypeID, ':UpdatedBy'=>$Teacher->UpdatedBy));


            //Insets data new session into the session table
            $query2 = "INSERT INTO `teachermaster` (`PublicUserID`, `PositionID`, `DepartmentCode`, `UpdatedBy`) VALUES (:PublicID, :PositionID,:DepartmentCode,:UpdatedBy);";
            $stm = $conn->prepare($query2);
            $stm->execute(array(':PublicID'=>$Teacher->PublicID, ':PositionID'=>$Teacher->PositionID, ':DepartmentCode'=>$Teacher->DepartmentID, ':UpdatedBy'=>$Teacher->UpdatedBy));


            //Insets data new session into the session table
            $query3 = "INSERT INTO `address` (`PrimaryAddress`, `SecondaryAddress`, `DistrictID`, `IdentificationID`) VALUES (:PrimaryAddress, :SecondaryAddress, :DistrictID, :IdentificationID);";
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



    public static function create_student($student_public_id, $student_no, $fname, $lname, $oname, $guardian_male_name, $guardian_female_name,$dob,$marital_status_id, $gender_id,  $guardians_number, $email, $class_id, $address,  $current_user_username) {
        //the below function creates a teacher in the database


        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();


            $query1 = "INSERT INTO `studentmaster` (`StudentMasterPublicID`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `ClassMasterD`, `DOB`, `EmailAddress`, `GuardianContactNo`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`) VALUES ('$student_public_id', '$student_no', '$fname', '$lname', '$oname', '$gender_id', '$marital_status_id', '$class_id', '$dob', '$email', '$guardians_number', '$guardian_male_name', '$guardian_female_name', '$address', '$current_user_username');";

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
}

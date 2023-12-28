<?php

require_once '../../db_connection/dbconfig.php';
require_once '../../model/HeadTecherModel.php';
require_once '../../model/SuperModel.php';
require_once '../../entities/Teacher.php';
require_once '../../entities/EmailService.php';
require_once '../super/SessionStart.php';

$btn_term = trim(filter_input(INPUT_POST, 'btn_term', FILTER_DEFAULT));
$btn_test = trim(filter_input(INPUT_POST, 'btn_test', FILTER_DEFAULT));


if (isset($_POST['btn_term'])) {

    $term_id_array = isset($_POST['term_id']) ? $_POST['term_id'] : array(0 => 0);

    $isdeleted_array = isset($_POST['deleted_array']) ? $_POST['deleted_array'] : array(0 => 0);

    $term_array = isset($_POST['term_arry']) ? $_POST['term_arry'] : array(0 => 0);

    $size_of_id_array = sizeof($term_id_array);
    $size_of_term = sizeof($term_array);

    $data = array();
    $deleted_data = array();
    $compined_data = array();

    $count = 0;


    if ($size_of_id_array < $size_of_term) {
        // $compined_data
        foreach ($term_array as $key => $value) {


            if ($count < $size_of_id_array) {

                array_push($data, array($term_id_array[$count], $value));
                $count++;
            } else {

                array_push($data, array('', $value));
            }
        }

    } else {

        foreach ($term_array as $key => $value) {

            array_push($data, array($term_id_array[$count], $value));
            $count++;

        }
    }


    if (count($data) > 0) {

        if (HeadTeacherModel::add_term($data)) {
            echo 'Inderted Sucesfully';

        } else {
            echo 'Insertion Fialed';

        }
    }


    if ($isdeleted_array[0] > 0) {

        foreach ($isdeleted_array as $key => $value) {

            array_push($deleted_data, array($value));

        }


        if (HeadTeacherModel::delet_term($deleted_data)) {
            echo 'Deleted Sucesfully';

        } else {
            echo 'Delition Fialed';

        }
    }

} elseif (isset ($_POST['btn_term_edit'])) {
    $isedited_array = $_POST['isedited_arry'];
    $term_id_array = $_POST['term_id'];

    $term_array = $_POST['term_arry'];
    $data = array();
    $count = 0;
    foreach ($isedited_array as $key => $value) {

        if ($value == 1) {

            array_push($data, array($term_array[$count], $term_id_array[$count]));
        }
        $count++;

    }
    // print_r($data);

    if (HeadTeacherModel::edit_term($data)) {
        echo 'Inderted Sucesfully';

    } else {
        echo 'Insertion Fialed';

    }


} elseif (isset ($_POST['btn_position_master_edit'])) {

    $isedited_array = $_POST['isedited_arry'];

    $postion_master_id = $_POST['postion_master_id'];

    $position_arry = $_POST['position_arry'];

    $positondescription_arry = $_POST['positondescription_arry'];

    $data = array();
    $count = 0;
    foreach ($isedited_array as $key => $value) {

        if ($value == 1) {

            array_push($data, array($position_arry[$count], $positondescription_arry[$count], 'admin', $postion_master_id[$count]));
        }
        $count++;

    }
    // print_r($data);

    if (HeadTeacherModel::edit_position_master($data)) {
        echo 'Edited Sucesfully';

    } else {
        echo 'Edited Fialed';

    }


} elseif (isset($_POST['btn_postiotion_master'])) {

    $postion_master_id = isset($_POST['postion_master_id']) ? $_POST['postion_master_id'] : array(0 => 0);

    $position_arry = isset($_POST['position_arry']) ? $_POST['position_arry'] : array(0 => 0);

    $positondescription_arry = isset($_POST['positondescription_arry']) ? $_POST['positondescription_arry'] : array(0 => 0);

    //  $isdeleted_array  = isset($_POST['deleted_array']) ? $_POST['deleted_array'] : array(0=>0);


    $size_of_id_array = sizeof($postion_master_id);
    $size_of_position_array = sizeof($position_arry);

    $data = array();
    $deleted_data = array();
    $compined_data = array();
//     print_r($size_of_id_array);
//     print_r($size_of_term);
    $count = 0;


    if ($size_of_id_array < $size_of_position_array) {
        // $compined_data
        foreach ($position_arry as $key => $value) {


            if ($count < $size_of_id_array) {

                array_push($data, array($postion_master_id[$count], $value, $positondescription_arry[$count]));
                $count++;
            } else {

                array_push($data, array('', $value, $positondescription_arry[$count], 'admin'));
            }
        }

    } else {

        foreach ($position_arry as $key => $value) {

            array_push($data, array($postion_master_id[$count], $value, $positondescription_arry[$count], 'admin'));
            $count++;

        }
    }

    // print_r($data);
    if (count($data) > 0) {

        if (HeadTeacherModel::add_position_master($data)) {
            echo 'Inderted Sucesfully';

        } else {
            echo 'Insertion Fialed';

        }
    }

} else if (isset ($_POST['btn_add_teacher'])) {

    $teacher_public_id = trim(filter_input(INPUT_POST, 'teacher_public_id', FILTER_DEFAULT));
    $fname = trim(filter_input(INPUT_POST, 'fname', FILTER_DEFAULT));
    $lname = trim(filter_input(INPUT_POST, 'lname', FILTER_DEFAULT));
    $oname = trim(filter_input(INPUT_POST, 'oname', FILTER_DEFAULT));
    $nrc = trim(filter_input(INPUT_POST, 'nrc', FILTER_DEFAULT));
    $passport = trim(filter_input(INPUT_POST, 'passport', FILTER_DEFAULT));
    $dob = trim(filter_input(INPUT_POST, 'dob', FILTER_DEFAULT));
    $marital_status_id = trim(filter_input(INPUT_POST, 'marital_status_id', FILTER_DEFAULT));
    $gender_id = trim(filter_input(INPUT_POST, 'gender_id', FILTER_DEFAULT));
    $contry_code = trim(filter_input(INPUT_POST, 'contry_code', FILTER_DEFAULT));
    $contact_number = trim(filter_input(INPUT_POST, 'contact_number', FILTER_DEFAULT));
    $email = trim(filter_input(INPUT_POST, 'email', FILTER_DEFAULT));
    $employee_position_id = trim(filter_input(INPUT_POST, 'employee_position_id', FILTER_DEFAULT));
    $employee_department_id = trim(filter_input(INPUT_POST, 'employee_department_id', FILTER_DEFAULT));
    $selected_province_id = trim(filter_input(INPUT_POST, 'selected_province_id', FILTER_DEFAULT));
    $district_id = trim(filter_input(INPUT_POST, 'district_id', FILTER_DEFAULT));
    $zip_code = trim(filter_input(INPUT_POST, 'zip_code', FILTER_DEFAULT));
    $primary_address = trim(filter_input(INPUT_POST, 'primary_address', FILTER_DEFAULT));
    $secondary_address = trim(filter_input(INPUT_POST, 'secondary_address', FILTER_DEFAULT));
    $current_user_username = $_SESSION['ttms_username'];

    $user_name = HeadTeacherModel::genarate_username($email, '0' . $contact_number);


    $user_type_id = 3;//the user type id 3 is a teacher


    $genarated_temp_password = HeadTeacherModel::genarate_temp_passowrd();
    $temp_password = password_hash($genarated_temp_password, PASSWORD_DEFAULT);


    if (!isset($secondary_address) || $secondary_address == Null || $secondary_address == "") {

        $secondary_address = NULL;
    }


    if (!isset($nrc) || $nrc == Null || $nrc == "") {

        $nrc = NULL;
    }


    if (!isset($passport) || $passport == Null || $passport == "") {

        $passport = NULL;
    }

    if (!isset($email) || $email == Null || $email == "") {

        $email = NULL;
    }

    if (!isset($oname) || $oname == Null || $oname == "") {

        $oname = NULL;
    }

    if (HeadTeacherModel::create_teacher(new Teacher($teacher_public_id, $nrc, $passport, $user_name, $temp_password, $fname, $lname, $oname, $email, $contact_number, $gender_id, $marital_status_id, $dob, $user_type_id, $current_user_username, $employee_position_id, $employee_department_id, $primary_address, $secondary_address, $district_id))) {
        if (isset($email) || $email != Null || $email != "") {
            $emails_sequnce_no = SuperModel::get_sequence_id(4);
            $email_subject = "Teacher Time Management System Temp Login Cridentials";
            $data = "Wellcome to T.T.M.S<br><b>Username: </b> " . $user_name . "<br><b>Temp Password: </b>" . $genarated_temp_password . "<br>Please login in to system and to change password<br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
            $status = "PEND";

            SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email, $email_subject, $data, $status, $current_user_username));

            echo 'rouned one done and emaile added';
        }

    } else {
        echo 'round one debuging';
    }
}

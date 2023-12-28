<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>
<?php

require_once '../../db_connection/dbconfig.php';
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';
require_once '../super/SessionStart.php';
require_once '../../entities/Teacher.php';


if (isset ($_POST['chekedin'])) {

    $check_in_id = trim(filter_input(INPUT_POST, 'chekedin', FILTER_DEFAULT));

    $TeacherMasterPublicID = $_SESSION['ttms_public_id'];
    $TeacherDetailsPublicID = SuperModel::get_sequence_id(5);

    $UpdatedBy = $_SESSION['ttms_username'];


    if (TeacherModel::add_teacher_report_details($TeacherMasterPublicID, $TeacherDetailsPublicID, $UpdatedBy)) {

        echo 'submited';
    } else {
        echo 'not submited';
    }


} else if (isset ($_POST['chekeout'])) {
    $TeacherMasterPublicID = $_SESSION['ttms_public_id'];
    if ($TeacherDetailsPublicID = SuperModel::check_out_teacher($TeacherMasterPublicID)) {
        echo 'checked out';
    } else {
        echo 'erro';
    }


} else if (isset($_POST['btn_term'])) {

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

    $user_name = SuperModel::genarate_username($email, '0' . $contact_number);


    $user_type_id = 3;//the user type id 3 is a teacher


    $genarated_temp_password = 123456;
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

    if (TeacherModel::create_teacher(new Teacher($teacher_public_id, $nrc, $passport, $user_name, $temp_password, $fname, $lname, $oname, $email, $contact_number, $gender_id, $marital_status_id, $dob, $user_type_id, $current_user_username, $employee_position_id, $employee_department_id, $primary_address, $secondary_address, $district_id))) {
        echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('User successfully added :)', {
            sticky: false,
            header: 'Notification',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/view/admin/AddTeacher.php')},
            });   
            }); 
            </script>";

    } else {
        echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('User not successfully added', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/view/admin/AddTeacher.php')},
            });   
            }); 
            </script>";
    }


}else if (isset ($_POST['btn_add_student'])) {

    $student_public_id = trim(filter_input(INPUT_POST, 'student_public_id', FILTER_DEFAULT));
    $student_no = trim(filter_input(INPUT_POST, 'studentNo', FILTER_DEFAULT));
    $fname = trim(filter_input(INPUT_POST, 'fname', FILTER_DEFAULT));
    $lname = trim(filter_input(INPUT_POST, 'lname', FILTER_DEFAULT));
    $oname = trim(filter_input(INPUT_POST, 'oname', FILTER_DEFAULT));
    $guardian_male_name = trim(filter_input(INPUT_POST, 'guardian_male_name', FILTER_DEFAULT));
    $guardian_female_name = trim(filter_input(INPUT_POST, 'guardian_female_name', FILTER_DEFAULT));
    $dob = trim(filter_input(INPUT_POST, 'dob', FILTER_DEFAULT));
    $marital_status_id = trim(filter_input(INPUT_POST, 'marital_status_id', FILTER_DEFAULT));
    $gender_id = trim(filter_input(INPUT_POST, 'gender_id', FILTER_DEFAULT));
    $contry_code = trim(filter_input(INPUT_POST, 'contry_code', FILTER_DEFAULT));
    $guardians_number = trim(filter_input(INPUT_POST, 'guardians_number', FILTER_DEFAULT));
    $email = trim(filter_input(INPUT_POST, 'email', FILTER_DEFAULT));
    $class_id = trim(filter_input(INPUT_POST, 'class_id', FILTER_DEFAULT));
    $address = trim(filter_input(INPUT_POST, 'address', FILTER_DEFAULT));

    $current_user_username = $_SESSION['ttms_username'];


    if (!isset($guardian_male_name) || $guardian_male_name == Null || $guardian_male_name == "") {

        $guardian_male_name = NULL;
    }

    if (!isset($guardian_female_name) || $guardian_female_name == Null || $guardian_female_name == "") {

        $guardian_female_name = NULL;
    }


    if (!isset($email) || $email == Null || $email == "") {

        $email = NULL;
    }

    if (!isset($oname) || $oname == Null || $oname == "") {

        $oname = NULL;
    }



    if (TeacherModel::create_student($student_public_id, $student_no,$fname,$lname,$oname,$guardian_male_name,$guardian_female_name,$dob,$marital_status_id, $gender_id,  $contry_code + $guardians_number, $email, $class_id, $address,  $current_user_username )) {
        echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student successfully added :)', {
            sticky: false,
            header: 'Notification',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/view/admin/AddTeacher.php')},
            });   
            }); 
            </script>";

    } else {
        echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student not successfully added', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/view/admin/AddTeacher.php')},
            });   
            }); 
            </script>";
    }


}
        

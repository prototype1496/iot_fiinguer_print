<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>STMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- App favicon -->
    <script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
    <script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

    <link rel="shortcut icon" href=../../lib/assets/images/iconf.ico">
    <link href="../../css/panelcss/vims-theme.css" rel="stylesheet" type="text/css"/>
    <link href="../../lib/icons/css/solid.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../lib/icons/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>


</head>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .centered-button {
        display: inline-block;
        padding: 20px 20px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    .centered-button:hover {
        background-color: #0056b3;
    }

    .card-as-button p {
        color: white;
    }
</style>


<?php
require_once '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';
require_once 'SMSNotification.php';


if(isset($_GET['student_id'])){

    $student_id  = $_GET['student_id'];


    $row = SuperModel:: get_student_by_id($student_id);



    if(is_null($row) || empty($row) || !isset($row)){
        echo "<script>
            $(document).ready(

            function(){

               $.jnoty('Check in not successful please make sure we have not already checked in', {
            sticky: false,
            header: 'Notification',
            theme: 'jnoty-info',
            close: function() {window.location.replace('/stms/view/teacher/MarkRegister.php')},
            });
            });
            </script>";
    }else{
        if(SuperModel::create_report_record($row['StudentMasterPublicID'], $_SESSION['ttms_username'])){

            SMSNotification::sendSMS("Greetings " . $row['StudentName'] . " has reported");

            echo "<script>
            $(document).ready(

            function(){

               $.jnoty('Successfully Checked In :)', {
            sticky: false,
            header: 'Notification',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/stms/view/teacher/MarkRegister.php')},
            });
            });
            </script>";
        }else{
            echo "<script>
            $(document).ready(

            function(){

               $.jnoty('The was an issue when checking in please try again', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/stms/view/teacher/MarkRegister.php')},
            });
            });
            </script>";
        }
    }

}

?>


<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Topbar Start -->
    <?php require_once('nav.php'); ?>
    <!-- end Topbar -->

    <!-- ========== Left Sidebar Start ========== -->
    <?php require_once('sidbar.php'); ?>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <!-- PAGE CONTENT WRAPPER -->

    <!-- END PAGE CONTENT WRAPPER -->
    <div class="content-page">
        <div class="content">

            <!-- START BREADCRUMB -->
            <ul class="breadcrumb">

                <li><a href="/stms/view/teacher/ClassList.php">Home</a></li>
                <li><a href="#">Teacher</a></li>
                <li class="active">Take Attendance</li>
            </ul>
            <!-- END BREADCRUMB -->



           <div onclick="movetoscan()" style="text-align: center;"> <div class="col-xl-12 col-md-12">
                <a  class="centered-button">
                    <div class="card bg-primary  text-white card-as-button">
                        <div class="card-block">
                            <div class="row align-items-center">
                                <div class="col">
                                    <i class="fal fa-arrow-alt-circle-up m-b-10"> </i>
                                    <p class=" h3 m-b-10">REGISTER ATTENDANCE </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>



                </div>
                <div>
                    <img src="../../images/1.png" height="170px"; width="900px";>
                </div>

            </div>


            <!-- Start Content-->

        </div> <!-- end card-box-->
    </div>




    <!-- END MESSAGE BOX-->
    <!-- Footer Start -->
    <?php // require_once('footer.php'); ?>
    <!-- end Footer -->

</div>

<!-- ============================================================== -->
<!-- End Page content -->
<!-- ============================================================== -->

</div>
<!-- END wrapper -->
<!-- Vendor js -->


<!-- App js -->
<script src="assets/js/app.min.js"></script>
<script src="../../js/RelaodDistrict.js" type="text/javascript"></script>

<script>

    //  The script below is going to be used to process the booking of a patinet that is in the modle
    

        function movetoscan(){
            window.location.href = "../../java_programs/verifcation/FingerPintVerification.php?";

        }
</script>
</body>
</html>
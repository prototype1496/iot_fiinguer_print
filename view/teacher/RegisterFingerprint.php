<?php
    require_once '../../controller/super/SessionStart.php';
    require_once '../../controller/super/SessionStart.php';
    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/SuperModel.php';

$stm = SuperModel:: get_all_students();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>STMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/iconf.ico">

    <link rel="shortcut icon" href=../../lib/assets/images/iconf.ico">

    <link rel="stylesheet" type="text/css" href="new/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="new/assets/css/style.css">



    <link href="../../css/panelcss/vims-theme.css" rel="stylesheet" type="text/css"/>
    <link href="../../lib/icons/css/solid.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../lib/icons/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>


    <script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>

    <link href="../../lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>



    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">




    <link rel="stylesheet" type="text/css" href="../../report_lib/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="../../report_lib/data-table/css/buttons.dataTables.min.css">


    <link rel="stylesheet" type="text/css" href="../../report_lib/style.css">
    <link rel="stylesheet" type="text/css" href="../../report_lib/jquery.mCustomScrollbar.css">


</head>

<body>

<!-- Begin page -->
<div id="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <?php require_once('sidbar.php'); ?>
    <!-- Left Sidebar End -->
    <!-- Topbar Start -->
    <?php require_once('nav.php'); ?>
    <!-- end Topbar -->



    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <div class="card-header table-card-header">
                    <br><br><br><h5>LIST OF STUDENTS</h5>
                </div>
                <div class="card-block">
                    <div class="dt-responsive table-responsive">
                        <table id="basic-btn" class="table table-striped table-bordered nowrap">
                            <thead>
                            <tr>
                                <th>Student No</th>
                                <th>Student Name</th>
                                <th>Gender</th>
                                <th>Class</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php
                            while ($row = $stm->fetch(PDO::FETCH_ASSOC)){

                                ?>
                                <tr>
                                    <td><?php echo $row['StudentNo'];?></td>
                                    <td> <?php echo $row['StudentName'];?></td>
                                    <td><?php echo $row['ShortName'];?></td>


                                    <td><?php echo $row['Class'];?></td>
                                    <td>  <button onclick="redirectWithID('<?php echo $row['StudentMasterPublicID'];?>')"  class="btn btn-primary btn-xs"><i class="fa fa-hand-o-up"></i></button></td>
                                </tr>


                                <?php
                            }
                            ?>

                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Student No</th>
                                <th>Student Name</th>
                                <th>Gender</th>
                                <th>Class</th>
                                <th></th>

                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>



        </div>
    </div>



</div>




</div>

</div> <!-- end .table-responsive-->
        </div> <!-- end card-box-->
    </div> <!-- end col -->

    <!-- Footer Start -->
    <?php require_once('footer.php'); ?>
    <!-- end Footer -->

</div>

<!-- ============================================================== -->
<!-- End Page content -->
<!-- ============================================================== -->

</div>
<!-- END wrapper -->
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../report_lib/jquery/js/jquery.min.js"></script>
<script src="../../report_lib/datatables.net/js/jquery.dataTables.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../report_lib/datatables.net-buttons/js/dataTables.buttons.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../report_lib/datatables.net-bs4/js/dataTables.bootstrap4.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>

<script src="../../report_lib/data-table/js/jszip.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>

<script src="../../report_lib/datatables.net-buttons/js/buttons.print.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../report_lib/datatables.net-buttons/js/buttons.html5.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../report_lib/data-table/extensions/buttons/js/extension-btns-custom.js" type="028b4b5e88a856df25e89945-text/javascript"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../report_lib/script.js"></script>

<script src="../../report_lib/rocket-loader.min.js" data-cf-settings="028b4b5e88a856df25e89945-|49" defer=""></script>

<!-- Vendor js -->
<script src="assets/js/vendor.min.js"></script>

<!-- App js -->
<script src="assets/js/app.min.js"></script>

<script>

    function redirectWithID(id){

        window.location.href = "../../java_programs/FingerPring.php?id="+id;
    }


</script>
</body>
</html>
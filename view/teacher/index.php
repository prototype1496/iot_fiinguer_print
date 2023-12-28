<?php require_once '../../controller/super/SessionStart.php';?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>STMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/iconf.ico">
     
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
					
                        <!-- start page title -->
                      
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

        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>
    </body>
</html>
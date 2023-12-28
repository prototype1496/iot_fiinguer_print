<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>STMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href=../../lib/assets/images/iconf.ico">
        <link href="../../css/panelcss/vims-theme.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/icons/css/solid.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../lib/icons/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        .card-as-button {
            cursor: pointer;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .card-as-button:hover {
            background-color: #4CAF50;
        }

        .card-as-button p {
            color: white;
        }
    </style>


    <?php
require_once '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';






if(isset($_GET['grade'])){

    $grade_id  = $_GET['grade'];


    $stm = SuperModel::get_class_details_by_grade_id($grade_id);

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


              <div class="page-content-wrap">
                   
					 <div class="panel panel-default">
					  <div class="panel-body">

                          <?php
                          while($row = $stm->fetch(PDO::FETCH_ASSOC))
                          {
                              ?>
                          <div class="col-xl-3 col-md-3">
                              <a href="AttendencyReport.php?grade=<?php echo $row['ClassMasterID']; ?>">
                                  <div class="card bg-primary  text-white card-as-button">
                                      <div class="card-block">
                                          <div class="row align-items-center">
                                              <div class="col">
                                                  <p class=" h3 m-b-10">Grade <?php echo $row['ClassCode']; ?> </p>

                                              </div>


                                          </div>
                                      </div>
                                  </div>
                              </a>
                          </div>


                          <?php
                          }
                          ?>

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
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>
 <script src="../../js/RelaodDistrict.js" type="text/javascript"></script>
    </body>
</html>
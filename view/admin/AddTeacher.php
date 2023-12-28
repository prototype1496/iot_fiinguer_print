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
<?php 
require_once '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';
$stm = SuperModel:: get_gender();
$marital_status_stm  = SuperModel:: get_marital_status();

$contry_code_stm = SuperModel:: get_country_code();

$teacher_position_stm = SuperModel:: get_teacher_positions();

$get_all_school_deparments_stm = SuperModel:: get_all_school_depatments();

$teacher_public_id_stm = SuperModel:: get_sequence_id(1);

$provice_stm = SuperModel:: get_provinces();
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
                    
                    <li><a href="/TTMS/view/headteacher/">Home</a></li>   
					<li><a href="#">Admin</a></li> 					
                    <li class="active">Add Teacher</li>
                </ul>
                <!-- END BREADCRUMB -->  
                
                <label style="color: #6c757d;filter: drop-shadow(10px 7px 4px #a7adb5);font-weight: bold;display: block;font-size: 16px;"><?php echo $teacher_public_id_stm; ?></label>
              <div class="page-content-wrap">
                   
					 <div class="panel panel-default">
					  <div class="panel-body">
                                              <form method="POST" action="../../controller/teacher/ActionPerformed.php">
                                                             <input type="hidden"  name="teacher_public_id" value="<?php echo $teacher_public_id_stm; ?>"/>         
                                                             <div class="form-group">
									
                                                             
									<div class="form-group">
										<div class="col-md-2">
											<input  class="form-control" required="required" name="fname" type="text" placeholder="First Name" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-2">
											<input   class="form-control" required="required" name="lname" type="text" placeholder="Last Name" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-2">
											<input  class="form-control" name="oname" type="text" placeholder="Other Names" /> 
										</div>
									</div>	
									<div class="form-group">
										<div class="col-md-2">				
											<input class="form-control" name="nrc" type="text" placeholder="NRC" />   
										</div>
									</div>	
									<div class="form-group">
										<div class="col-md-2">					
											<input class="form-control" name="passport" type="text" placeholder="Passport" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-2">
											<input class="form-control" required="required"  name="dob" type="date" placeholder="Date Of Birth" /><br>
										</div>
									</div>
                                                                 
                                                                 
									<div class="form-group">
										<div class="col-md-2">
											<select class="form-control" required="required" name ="marital_status_id" >
                                                                                            <option value="" disabled="disabled" selected="selected" >Select Marital Status</option>
												<?php
												while ($row = $marital_status_stm->fetch(PDO::FETCH_ASSOC)) {
													?>
											<option value="<?php echo $row['MaritalStatusMasterID']; ?>"><?php echo $row['MaritalStatus']; ?></option>

												<?php } ?>
											</select>
										</div>
									</div>
				
				
									<div class="form-group">
										<div class="col-md-2">
											<select class="form-control" required="required" name ="gender_id" >
                                                                                            <option value="" disabled="disabled" selected="selected">Select Gender</option>
                                                                                           
                                                                                            <?php
													while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
                                                                                                           // print_r($row);
													?> 
                                                                                                                    
                                                                                                <option value = "<?php echo $row['genderId']; ?>"> <?php echo $row['gender']; ?> </option>
                                                                                                                        

													<?php } ?>
                                                                                            
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-2">
                                                                                    <select style="color : #000 !important;"  class="form-control" required="required" readonly="" name ="contry_code" >
										
												<?php
												while ($row = $contry_code_stm->fetch(PDO::FETCH_ASSOC)) {
													?>
													<option value="<?php echo $row['CountryID']; ?>"><?php echo $row['ConuntryCode']; ?></option>

												<?php } ?>

											</select >
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-2">
									
												<input class="form-control" required="required" name="contact_number" type="tel" placeholder="Enter Contact Number" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-2">
											<input  class="form-control" name="email" type="email" placeholder="E-Mail Address" />
										</div>
									</div>
                                                                 
                                                                 
                                                       		<div class="form-group">
				<div class="col-md-2">
             <select class="form-control"   required="required"  name ="employee_department_id" >
                 <option disabled="disabled" selected="selected" value="">Select Department</option>
                <?php
                while ($row = $get_all_school_deparments_stm->fetch(PDO::FETCH_ASSOC)) {
                    ?>
                    <option value="<?php echo $row['DepartmentID']; ?>"><?php echo $row['DepartmentName']; ?></option>

                <?php } ?>
            </select><br>
            </div>
			</div>
                                                                 
                                                                 		<div class="form-group">
				<div class="col-md-2">
                                    <select class="form-control"   required="required"  name ="employee_position_id" >
                                      
                 <option disabled="disabled" selected="selected" value="">Select Position</option>
                <?php
                while ($row = $teacher_position_stm->fetch(PDO::FETCH_ASSOC)) {
                    ?>
                    <option value="<?php echo $row['TeacherPositionMasterID']; ?>"><?php echo $row['PositionName']; ?></option>

                <?php } ?>
            </select>
            </div>
			</div>

<!-- The blow code <select></select> has the function get_districts() this function is used load the districts that load in the div with the id districts_by_provincId 
the code for the loading is in the RelaodDistrict.js which makes a call to the ReloadDistrict.php which calls the get_districts_by_provinceid
function in the SuperModel 
            -->
			<div class="form-group">
				<div class="col-md-2">
						<select class="form-control" id="selected_province_id" onchange="get_districts()"  required="required"  name="province_id"  >
                                                    <option value="0" selected disabled="">Select Province</option>
								<?php
								while ($row = $provice_stm->fetch(PDO::FETCH_ASSOC)) {
									?>
													<option  value="<?php echo $row['ProvinceID']; ?>"><?php echo $row['ProvinceName']; ?></option>

								<?php } ?>

						</select> 

				</div>
			</div>

			<div  id="districts_by_provincId" >

						</div>  

			
			
	
            
	
			
			<div class="form-group">
				<div class="col-md-2">
                                    <input  class="form-control" value="10010" name="zip_code" type="hidden" placeholder="ZIP code" />
				</div>
			</div>
            
			<div class="form-group">
				<div class="col-md-12"><br/>
					<textarea class="form-control"  required="required" name="primary_address" type="text" placeholder="Primary Address" ></textarea><br>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
            <textarea class="form-control" name="secondary_address" type="text" placeholder="Secondary Address"></textarea>  <br/> 
			<input class="btn btn-success"name="btn_add_teacher" type="submit" value="Add Teacher"/>

				</div>
			</div>
         


        </form>
		</div>

		
					
		  </div>
		  <div>
                      <img src="../../images/1.png" height="170px"; width="900px";>
					</div>
		 	  
			</div>
               

                    <!-- Start Content-->
                    
                                </div> <!-- end card-box-->
                            </div>                       
                                
                                
                                
           <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><img src="assets/images/logo-light.png" alt="logo" > Log <strong>Out</strong> ?</div>
					
                    <div class="mb-content">
					
                        <p>Are you sure you want to log out of TTMS System?</p>                    
                        <p> Press Yes to logout</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="../../controller/Logout.php" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
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
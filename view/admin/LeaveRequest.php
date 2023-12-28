<?php 

require_once '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';


$details_id = isset($_GET['id']) ? $_GET['id'] : 0;

$row  = SuperModel::get_leave_request_data($details_id);


?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>TTMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../../lib/assets/images/iconf.ico">
        
      
         <link href="../../lib/MDB/css/PresidentAdmin.css" rel="stylesheet" type="text/css"/>

      


     
    </head>

    <style>
        .btn_headers{
            
           float: right;
            margin-right: 5%;
            margin-top: 2%;
             
              overflow: hidden;
        }
        
    </style>
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
                
                   <div class="btn_headers">  
                <input  id="btn_fapproval" class="btn btn-success" type="button" name="btn_fapprove" value="Approve">
                <input id="btn_freject" class="btn btn-danger" type="button" name="btn_freject" value="Reject">
                <input id="btn_cancle" class="btn btn-danger" type="button" name="btn_clance" value="Cancle">
                  
                </div> 
                <div class="content">
                           <div class="container " style="">
            <br><br><br><br>
            <div class="card mx-auto  " style="width: 60rem; margin-bottom: 5%; ">
 
               
                <h5 class="card-header info-color white-text ">
                     <div class="text-center py-1"><strong >EMPLOYEE LEAVE APPLICATION</strong></div>
                </h5>

            
                <!--Card content-->
                <div  class="card-body px-lg-5 pt-0">
                    <section class="content">
                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <div class="col-md-12 col-xs-12">

                              

                                    <div class="box-body">
                                     
                                   
<!--                                        <h2 class="text-center font-bold pt-4 pb-5 mb-5 animated zoomIn"><strong>Welcome To FFWPU Membership Registration</strong></h2>
-->

<form id="updaet_leave_request" role="form" action="../../controller/super/ActionPerformed.php" method="post" enctype="multipart/form-data">
    <br>
    <input id="txt_fappoval" name="btn_fapprove"  type="hidden"/>
    
    <input id="txt_freject" name="btn_freject"  type="hidden"/>
    
    <input name="record_id" value="<?php  echo $details_id ; ?>" type="hidden"/>
    
    <div class="row setup-content-2" id="step-1">
        
        <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="names" data-error="wrong" data-success="right">Names</label>
                <input id="names" readonly="" value="<?php echo $row['Names']; ?>" name="names" type="text"  class="form-control ">
            </div>
        
            </div>
        
                <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="teacher_id" data-error="wrong" data-success="right">Teacher ID</label>
                <input id="teacher_id" readonly="" value="<?php echo $row['TeacherMasterID']; ?>" name="teacher_id" type="text"  class="form-control ">
            </div>
        
            </div>
        
           <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="number_of_days_applied" data-error="wrong" data-success="right">Number Of Days Applied</label>
                <input id="number_of_days_applied" readonly="" value="<?php echo $row['NumberOfDays']; ?>" name="number_of_days_applied" type="text"  class="form-control ">
            </div>
        
            </div>
        
        
           <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="applied_date" data-error="wrong" data-success="right">Date Applied</label>
                <input id="applied_date" readonly="" value="<?php echo $row['Days']; ?>"  name="applied_date" type="text"  class="form-control ">
            </div>
        
            </div>
        
        
         <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="department" data-error="wrong" data-success="right">Department</label>
                <input id="department" readonly="" value="<?php echo $row['DepartmentName']; ?>" name="department" type="text"  class="form-control ">
            </div>
        
            </div>
        
           <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="leave_applied_type" data-error="wrong" data-success="right">Leave Type Applied</label>
                <input id="leave_applied_type" readonly="" value="<?php echo $row['LeaveType']; ?>" name="nrc" type="text"  class="form-control ">
            </div>
        
            </div>
        
        
            <div class=" col-md-6">
         
           
           <div class="form-group md-form">
               <label for="date_to">Date From</label><br><br> 
                <input type="date" name="date_to" readonly="" value="<?php echo $row['LeaveFrom']; ?>" class="form-control " name="date_to" id="date_to" >
                
                
            </div>
        
            </div>
        
        
            <div class=" col-md-6">
         
           
            <div class="md-form form-group">
                 <label for="date_to">Date To</label><br><br>
                <input  type="date" readonly="" value="<?php echo $row['LeaveTo']; ?>"  name="date_to" class="form-control " name="date_to" id="date_to" >
                
            </div>
        
            </div>

        
       
        
        
          <div class="col-md-12">
                       
          <div class="md-form">
   
    <textarea type="text" readonly="" name="reason_leave" id="form10" class="md-textarea form-control" rows="5"><?php echo $row['ReasonForLeave']; ?></textarea>
    <label for="reason_leave">Reason For Leave</label>
</div>   
          
        </div>
        
         <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="approved_by" data-error="wrong" data-success="right">Approved By</label>
                <input id="approved_by" readonly="" value="<?php echo $row['ApprovedBy'];  ?>" name="approved_by" type="text"  class="form-control ">
            </div>
        
            </div>
        
         <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="remark" data-error="wrong" data-success="right">Add Comment</label>
                <input id="remark" name="remark" type="text"  class="form-control ">
            </div>
        
            </div>
        
        
<!--        <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="approved_by" data-error="wrong" data-success="right">Approved By</label>
                <input id="approved_by" readonly="" value="<?php echo $_SESSION['ttms_username']; ?>" name="approved_by" type="text"  class="form-control ">
            </div>
        
            </div>
        
           <div class=" col-md-6">
         
           
           <div class="form-group md-form">
                <label for="authorized_by" data-error="wrong" data-success="right">Authorized By</label>
                <input id="authorized_by" readonly="" name="authorized_by" type="text"  class="form-control ">
            </div>
        
            </div>-->
    </form>
          </div>
                </div>
                        
                </div>
               


                </section>
              
            </div>
          
        </div>

      
       
        
       
    
            
            
            
            
            
                        <!-- end row -->
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
            
             <script src="../../lib/MDB/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../../lib/MDB/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../lib/MDB/js/mdb.min.js" type="text/javascript"></script>
        
        
      

        <!-- END wrapper -->

        <!-- Vendor js -->
        <script src="../../lib/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="../../lib/assets/js/app.min.js"></script>
        
        
        <script>
        $(document).ready(function(){
            
            $('#btn_cancle').click(function (){
                
                window.location.href = "/TTMS/view/headteacher/Inbox.php";
            });
            
            $('#btn_fapproval').click(function(){
              
                 $('#txt_fappoval').val("btn_fapprove");
                $('#updaet_leave_request').submit();
            });
            
            
              $('#btn_freject').click(function(){
                 $('#txt_freject').val("btn_freject");
                $('#updaet_leave_request').submit();
            });
           
            
        });
        
        </script>
    </body>
</html>
<!DOCTYPE html>
<?php 
require_once '../../model/HeadTecherModel.php';
require_once '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';

$limit = isset($_POST['limit_records']) ? $_POST['limit_records'] : 5;
$page  = isset($_GET['page']) ? $_GET['page'] : 1;
$start  =  ($page - 1) * $limit;
$stm = HeadTeacherModel::get_all_terms($start,$limit);

$term_details  = HeadTeacherModel::get_term_pages_count($limit);

 $pages  = $term_details['Pages'];
 
 $total_pages  = $term_details['TotalRecords'];
 
 
 
 if($page == 1){
     
    $privious =  $page; 
 }else{
     
    $privious = $page -1; 
 }
 
 $next  = $page + 1 ; 
 


?>
<html lang="en">
<head>
 <meta charset="utf-8" />
<title>TTMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/iconf.ico">
<link href="PresidentAdmin.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

<style type="text/css">
    body {
        color: #404E67;
/*        background: #F5F7FA;*/
		font-family: 'Open Sans', sans-serif;
	}
	.table-wrapper {
		width: 100%;
		margin: 30px auto;
        background: #fff;
        padding: 20px;	
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title {
        padding-bottom: 10px;
        margin: 0 0 10px;
    }
    .table-title h2 {
        margin: 6px 0 0;
        font-size: 22px;
    }
    .table-title .add-new {
        float: right;
		height: 30px;
		font-weight: bold;
		font-size: 12px;
		text-shadow: none;
		min-width: 100px;
		border-radius: 50px;
		line-height: 13px;
    }
	.table-title .add-new i {
		margin-right: 4px;
	}
    table.table {
        table-layout: fixed;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table th:last-child {
        width: 100px;
    }
    table.table td a {
		cursor: pointer;
        display: inline-block;
        margin: 0 5px;
		min-width: 24px;
    }    
	table.table td a.add {
        color: #27C46B;
    }
    table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #E34724;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table td a.add i {
        font-size: 24px;
    	margin-right: -1px;
        position: relative;
        top: 3px;
    }    
    table.table .form-control {
        height: 32px;
        line-height: 32px;
        box-shadow: none;
        border-radius: 2px;
    }
	table.table .form-control.error {
		border-color: #f50000;
	}
	table.table td .add {
		display: none;
	}
        
         .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
</style>
<script type="text/javascript">
     function check_max_terms (){
        var max_terms = $('#ma_terms').val();
   var total_tr = $('tbody').find('tr');
   var count = 0;
   total_tr.each(function(){
       count++;
      
       if(count >= max_terms){
        $('#addRecored').attr("disabled", "disabled");
        
    }
   });
     
     
   }
$(document).ready(function(){
  
  
   
   
    check_max_terms();
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();
	// Append table with add row form on add new button click
    $(".add-new").click(function(){
		$(this).attr("disabled", "disabled");
		var index = $("table tbody tr:last-child").index();
        var row = '<tr>' +
            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
           
			'<td>' + actions + '</td>' +
        '</tr>';
    	$("table").append(row);		
		$("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });
	// Add row on add button click
	$(document).on("click", ".add", function(){
		var empty = false;
		var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
			if(!$(this).val()){
				$(this).addClass("error");
				empty = true;
			} else{
                $(this).removeClass("error");
            }
		});
		$(this).parents("tr").find(".error").first().focus();
		if(!empty){
			input.each(function(){
				$(this).parent("td").html($(this).val()+"<br><input type='hidden' name='term_arry[]' value='"+$(this).val()+"'/>");
			});			
			$(this).parents("tr").find(".add, .edit").toggle();
			$(".add-new").removeAttr("disabled");
                        check_max_terms();
		}		
    });
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add, .edit").toggle();
		$(".add-new").attr("disabled", "disabled");
    });
	// Delete row on delete button click
	$(document).on("click", ".delete", function(){
        
        
    $deleted_id =  $(this).parents("tr").find(".term_id").val();
                
     
       $('#txt_deleted_items').append('<input name="deleted_array[]" type="hidden" value="' + $deleted_id + '">');
       
          $(this).parents("tr").remove();
		$(".add-new").removeAttr("disabled");
                check_max_terms();
                
                 
    });
    
    
});
</script>
</head>
<body>
   <br>
   <br>
   
 
   
    <div style="float: right; margin-right: 2%;">
        <button name="btn_term" value="btn_term" id="btn_submit" class="btn btn-primary">Submit</button> &nbsp
        
        <button id="btn_cancel" class="btn btn-danger">Cancel</button>
        
    </div>
   <br>
   <br>
    
   <div class="card card-cascade narrower" style="margin-left: 2%; margin-right: 2%; margin-top: 1%;">
        
        
                 <!--Card image-->
    <div class="view view-cascade gradient-card-header blue-gradient narrower py-2 mx-4 mb-3 d-flex justify-content-between align-items-center">

        <div>
            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                <i class="fa fa-th-large mt-0"></i>
            </button>
           
        </div>

        <a href="" class="white-text mx-3">Term Master</a>

        
        
        <div >
           
            <button id="btn_edit" type="button" class="btn btn-outline-white btn-rounded btn-sm px-2 add-new">
                <i class="fa fa-edit mt-0"></i>
            </button>
            
            <button id="addRecored" type="button" class="btn btn-outline-white btn-rounded btn-sm px-2 add-new">
                <i class="fa fa-plus-circle mt-0"></i>
            </button>
           
        </div>

    </div>
    <!--/Card image-->
        <div class="table-wrapper">
<!--            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>Employee <b>Details</b></h2></div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                    </div>
                </div>
            </div>-->
    <?php  $max_number_of_terms=HeadTeacherModel::get_max_terms();   ?>   
<center><label>Max Number Of Terms: <?php echo $max_number_of_terms; ?></label> </center> <br>  
<input value="<?php echo $max_number_of_terms?>" type="hidden" id="ma_terms"/>    
<form id="terms" method="post" action="../../controller/head_teacher/ActionPerformed.php">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Action</th>
                        
                    </tr>
                </thead>
                <tbody>
                    
                    <?php while($row = $stm->fetch(PDO::FETCH_ASSOC))
                            
                    {
                            ?>
                    
                    <tr>
               
                        <td><?php echo $row['TermName']; ?> <input type="hidden" name="term_arry[]" value="<?php echo $row['TermName']; ?>"/> <input class="term_id" name="term_id[]" value="<?php echo $row['TermMasterID']; ?>" type="hidden"/></td>
                       
                        <td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
<!--                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>-->
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                    <?php }
                    
                    ?>
                    
                </tbody>
            </table>
    <input type="hidden" value="term_arry" name="btn_term"/>
     <div id="txt_deleted_items"></div>
          </form>
             <div class="hint-text">Showing <b><?php echo $limit;?></b> out of <b><?php echo $total_pages ?></b> entries</div>
            	<div class="clearfix">
                    <form action="#" method="post">
                        
                        <select name="limit_records" id="limit">
                            
                            <option disabled="disabled" selected="selected">Show More Rows</option>
                            <option <?php if(isset($_POST['limit_records']) && $_POST['limit_records'] == 5 ) { echo 'selected';} ?> value="5">5</option>
                            
                            <option <?php if(isset($_POST['limit_records']) && $_POST['limit_records'] == 10 ) { echo 'selected';} ?> value="10">10</option>
                            <option <?php if(isset($_POST['limit_records']) && $_POST['limit_records'] == 15 ) { echo 'selected';} ?> value="15">15</option>
                            <option <?php if(isset($_POST['limit_records']) && $_POST['limit_records'] == 50 ) { echo 'selected';} ?> value="50">50</option>
                            <option <?php if(isset($_POST['limit_records']) && $_POST['limit_records'] == 100 ) { echo 'selected';} ?> value="100">100</option>
                                
                            
                        </select>
                        
                       
                    </form>
               
                <ul class="pagination">
                    <li class="page-item "><a href="/TTMS/view/headteacher/TermMater.php?page= <?php echo $privious ?>">Previous</a></li>
                    <?php for ($i= 1; $i<=$pages; $i++) { ?>
                    
<!--                    <li class="page-item active"><a href="#" class="page-link">1</a></li>-->
                    <li class="page-item"><a href="/TTMS/view/headteacher/TermMater.php?page= <?php echo $i ?>" class="page-link"><?php echo $i ?></a></li>
                    <?php 
                    
                    }
                    
                    
                  
                   $last  =$pages;
              
                    if($pages == $last){
                      $next = $last;  
                        
                    }
                    
                    
                    ?>
                    <li class="page-item"><a href="/TTMS/view/headteacher/TermMater.php?page= <?php echo $next ?>" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
      </div>    
</body>
<script>
$(document).ready(
        function (){
            
            $('#limit').change(
                function(){
                    
                   $('form').submit();
               
                }    
                );
        
          $('#btn_edit').click(function(){
            
            window.location.href = "/TTMS/view/headteacher/EditTermMater.php";
        });
        $('#btn_cancel').click(function(){
            
            window.location.href = "/TTMS/view/headteacher/";
        });
        
          $('#btn_submit').click(function(){
            
              $('#terms').submit();
        });
          
        }
            );
</script>
</html>                            
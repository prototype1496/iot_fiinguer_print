<?php


//exec(‘java -jar Testphp2java.jar this_is_the_valye’, $output);

//exec("java -jar Testphp2java.jar $some_value", $output);
//$s = 'THIS IS A TEST';


$patientid = $_GET['id'];
exec("java -jar testfinguerprint.jar ".$patientid."",$output);


 echo("<SCRIPT LANGUAGE='JavaScript'>
                  
		    
			 location.href='/stms/view/teacher/RegisterFingerprint.php';   
             </SCRIPT>" );


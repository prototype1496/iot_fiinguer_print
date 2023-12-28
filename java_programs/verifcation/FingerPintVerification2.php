<?php


//exec(‘java -jar Testphp2java.jar this_is_the_valye’, $output);

//exec("java -jar Testphp2java.jar $some_value", $output);
//$s = 'THIS IS A TEST';



exec("java -jar VerifyFinguerprint.jar ",$output);


 echo("<SCRIPT LANGUAGE='JavaScript'>
                  
		    
			 location.href='/stms/view/teacher/CloseRegister.php?student_id=$output[0]';   
             </SCRIPT>" );


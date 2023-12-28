<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class Connection{
    
    
  public function connect() {
        $servername = "localhost";
        $username = "iotf_root";
        $password = "123456";
        $dbname = "iotf_stms_db";


        try{
        $conn = new PDO(    'mysql:host='.$servername.';dbname='.$dbname.';charset=utf8mb4',
                            ''.$username.'',
                            ''.$password.'',
                    array(
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_PERSISTENT => false
                    )
                );
        
//         foreach($conn->query('SELECT UM.FirstName FROM usermaster UM ') as $row) {
//        print_r($row);
//        }
            return  $conn;
         } catch (PDOException $e) {
            print "Connection Error: ". "<br/>";
            $conn=Null;
            die();
}
  


         }   
  
}
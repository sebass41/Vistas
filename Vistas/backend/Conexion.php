<?php

function conection (){
    try{
        $host = "localhost"; 
        $usr = "root"; 
        $pass = ""; 
        $bd = "practicojoin";
        $puerto = 3306;
        $mysqli = new mysqli ($host, $usr, $pass, $bd, $puerto); 
        return $mysqli; 
    }catch (Exception $e){
        echo "Se ha producido un error en la Conexión:".$e->getMessage();
    }
}


?>
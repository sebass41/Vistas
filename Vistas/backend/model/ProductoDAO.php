<?php

require_once "../Conexion.php";
require_once "res/Respuesta.php";

class Producto{

    function mostrarVista($vista){
        try{
            $connection = conection();
            $sql = "SELECT * FROM $vista";
            $stmt = $connection->prepare($sql);
            $stmt->execute();

            $respuesta = $stmt->get_result();
            $empleados = $respuesta->fetch_all(MYSQLI_ASSOC);

            $msj = "Datos obtenidos correctamente";
            return new Respuesta (true, $msj, $empleados);
        }catch(Exception $e){
            $msj = "Error: " . $e->getMessage();
            return new Respuesta(false, $msj, null);
        }
    }


}
?>
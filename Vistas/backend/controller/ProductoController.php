<?php

require_once "../model/ProductoDAO.php";

$funcion = $_GET['fun'];

switch ($funcion){
    case 'mv':
        mostrarVista();
        break;
}

function mostrarVista(){
    $vista = $_POST['vista'];

    $result = (new Producto())->mostrarVista($vista);
    echo json_encode($result);
} 


?>
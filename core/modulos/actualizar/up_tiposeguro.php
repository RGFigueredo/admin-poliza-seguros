<?php

if (!defined('SRCP')) {
    die('Logged Hacking attempt!');
}
    //comienzo del registro de los corredor.
  
$id = $_POST['id']; 
$codigo = $_POST['codigo']; 
$nombre = $_POST['nombre']; 
$observacion = $_POST['observacion']; 

$query = "  update tiposeguro set codigo='$_POST[codigo]',nombre='$_POST[nombre]' ,observacion='$_POST[observacion]' where id='$id' ";
    try{
        $stmt = $db->prepare($query);
        $result = $stmt->execute();
    }
    catch(PDOException $ex){
    echo "Error > " .$ex->getMessage();
    }
    $rows = $stmt->fetchAll();










?>

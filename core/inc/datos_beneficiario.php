<?php
$query = "  SELECT  cedula,
                                nombres,
                                apellidos,
                                fechanacimiento,
                                direccion,
                                telefono,
                                correo,                              
                                estatus,
                                asegurado_cedula
            FROM    beneficiario where estatus!='Inactivo'
         ";
    try{
        $stmt = $db->prepare($query);
        $result = $stmt->execute();
    }
    catch(PDOException $ex){
    echo "Error > " .$ex->getMessage();
    }
    $rows = $stmt->fetchAll();
?>

<?php
$query = "  SELECT  asegurado_cedula,
                    codigo,
                    monto,
                    reembolso,
                    estatus
            FROM    gastos
            where reembolso='Pendiente' OR estatus!='Inactivo'
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

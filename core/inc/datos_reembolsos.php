<?php
$query = "  SELECT  monto,
                    fecha,
                    gastos_codigo,
                    asegurado_cedula,
                    estatus
            FROM    reembolsos
            where estatus!='Pagado'
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

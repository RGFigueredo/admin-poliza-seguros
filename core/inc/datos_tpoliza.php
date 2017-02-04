<?php
$query = "  SELECT  id,
codigo,
                    nombre,
                     costo,
                     estatus,
                    cobertura                 
            FROM    tipopolizas  where estatus!='Inactivo' ORDER BY id ASC
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

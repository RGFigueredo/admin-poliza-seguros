<?php
$query = "  SELECT  codigo,
                    nombre,
                     costo,
                    cobertura                 
            FROM    tipopolizas
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

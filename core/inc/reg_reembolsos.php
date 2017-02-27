<?php

if (!defined('SRCP')) {
	
	die('Logged Hacking attempt!');
	
}

//comienzo del registro de los corredor.
if (!empty($_POST)) {
	$db->beginTransaction();
	
	$query = '  SELECT 1
            		FROM reembolsos
            		WHERE asegurado_cedula = :asegurado_cedula
        		  ';
	
	$query_params = array(':asegurado_cedula' => $_POST['asegurado_cedula']);
	
	try {
		
		$stmt = $db->prepare($query);
		
		$result = $stmt->execute($query_params);
		
	}
	catch (PDOException $ex) {
		
		
		/*
        	  TODO: Aqui de igual forma cambiaremos a un modal
        	 */
		
		die('Fallamos al hacer la busqueda: '.$ex->getMessage());
		
	}
	
	$row = $stmt->fetch();
	
	if ($row) {
		
		echo "<div class='panel-body'>
                <div class='alert alert-warning alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                Error: La cédula ya existe.</div>
            </div>";
		
	}
	
	///	Si todo pasa enviamos los datos a la base de datos mediante PDO para evitar Inyecciones SQL
	$query2 = '	INSERT INTO reembolsos (
				                gastos_codigo,
                                asegurado_cedula,
                                monto, 
                                fecha,
                                estatus
                                
				    ) VALUES (
                                :gastos_codigo,
                                :asegurado_cedula,
                                :monto, 
                                :fecha,
                                :estatus
				            )
        		';
	
	$query_params = array(
	':gastos_codigo' => $_POST['gastos_codigo'],
	':asegurado_cedula' => $_POST['asegurado_cedula'],
	':monto' => $_POST['monto'],
	':fecha' => $_POST['fecha'],
	':estatus' => $_POST['estatus']            
	);
	
	try {
		
		$stmt = $db->prepare($query2);
		
		$result = $stmt->execute($query_params);
		
	}
	catch (PDOException $ex) {
		
		// 		Si tenemos problemas para ejecutar la consulta imprimimos el error
		echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
					</div>
				  </div>".$ex->getMessage();
		
	}
$db->commit();	
	
	
	header('Location: index.php?do=listareembolsos');
	
}


if (isset($_GET['accion'])) {
	
	
	//c	heck the action
	switch ($_GET['accion']) {
		
		case 'error':
		echo "<div class='panel-body'>
                    <div class='alert alert-success alert-dismissable'>
                      <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                      Hay varios errores en tu registro.
                      Si necesitas ayuda puedes hacer clic al botón de Ayuda en el fondo de la página.
					</div>
				</div>";
		
		break;
		
	}
	
}


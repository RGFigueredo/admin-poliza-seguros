<?php
/*
  funcion: Procesa una busqueda en la base de datos de los datos del usuario pedido
  return: Retorna un arreglo con todos los datos del usuario pasado por argumento.
 */
    function getDataBySession($session, PDO $db)
    {
        $query = 'SELECT nombre,
                     apellido
              FROM   usuarios
              WHERE  cookie = :id
             ';
        $query_params = array(
              ':id' => $session,
          );
        try {
            $stmt = $db->prepare($query);
            $stmt->execute($query_params);
        } catch (PDOException $ex) {
            echo 'Error > '.$ex->getMessage();
        }
        $dataUsuario = $stmt->fetch();

        return $dataUsuario;
    }

function modificar($var1, $var2, PDO $db){
  switch ($var1) {
    case 'corredor':{
      $query = '  UPDATE corredor   
                  SET 
                          nombres = :nombres,
                          apellidos = :apellidos,
                          fechanacimiento = :fechanacimiento,
                          telefono = :telefono,
                          correo = :correo,
                          direccion = :direccion,
                          fecharegistro = :fecharegistro,
                          estatus = :estatus,
                          aseguradora_rif =: aseguradora_rif
                   WHERE cedula = $cedula
                ';
        $query_params = array(
            ':nombres' => $_POST['nombres'],
            ':apellidos' => $_POST['apellidos'],
            ':direccion' => $_POST['direccion'],
            ':telefono' => $_POST['telefono'],
            ':correo' => $_POST['correo'],
            ':estatus' => $_POST['estatus'],
            ':fechanacimiento' => $_POST['fechanacimiento'],
            ':fecharegistro' => $_POST['fecharegistro'],
            ':aseguradora_rif' => $_POST['aseguradora_rif']
            );
        try {
            $stmt = $db->prepare($query);
            $result = $stmt->execute($query_params);
        } catch (PDOException $ex) {
            // Si tenemos problemas para ejecutar la consulta imprimimos el error
            echo "<div class='panel-body'>
                     <div class='alert alert-warning alert-dismissable'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        Tenemos problemas al ejecutar la consulta :c El error es el siguiente:
          </div>
          </div>".$ex->getMessage();
        }//fin catch error
        #header('Location: index.php?do=listacorredor');
        break;
    } //fin case corredor
      case 'aseguradora':
        # code...
        break;
      case 'asegurado':
        # code...
        break;
      case 'beneficiario':
        # code...
        break;
    default:
      header('Location: index.php?do=listacorredor');
      break;
} // fin switch
}//fin funcion
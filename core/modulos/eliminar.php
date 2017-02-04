<?PHP

if (!defined('SRCP')) {
    die('Logged Hacking attempt!');
}

// funcion borrar cualquiera! - inseguro pero funciona.
function Query( $get_var ) 
{
    switch($get_var)
    {
        case 'corredor':
            $tbl = 'corredores';
            break;
        case 'asegurados':
            $tbl = 'corredores';
            break;
        case 'beneficiaros':
            $tbl = 'corredores';
            break;
        case 'polizas':
            $tbl = 'corredores';
            break;
        case 'planes':
            $tbl = 'corredores';
            break;
        case 'usuarios':
            $tbl = 'corredores';
            break;

    }

    $sql = "SELECT * FROM $tbl";
}

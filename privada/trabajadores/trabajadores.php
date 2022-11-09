<?php
session_start();/*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

//$db->debug = true;
contarRegistros($db,"trabajadores");

paginacion("trabajadores.php?",$smarty);

$sql3 = $db->Prepare("SELECT *
                    FROM trabajadores
                WHERE estado<> 0
                ORDER BY id_trabajador DESC
                LIMIT ? OFFSET ?
  ");

$smarty->assign("trabajadores", $db->GetAll($sql3, array($nElem,$regIni)));

$smarty->assign("direc_css",$direc_css);
$smarty->display("trabajadores.tpl");
?>

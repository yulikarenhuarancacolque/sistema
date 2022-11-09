<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../../resaltarBusqueda.inc.php");
$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					FROM bancos b
					WHERE b.estado <> '0'
					ORDER BY b.id_banco DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("bancos", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display("sucursal_nuevo.tpl");
?>
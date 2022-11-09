<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql=$db->Prepare("SELECT *
					FROM sucursales
					WHERE id_sucursal>0
					ORDER BY id_sucursal DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("sucursales", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("sucursales.tpl");
?>
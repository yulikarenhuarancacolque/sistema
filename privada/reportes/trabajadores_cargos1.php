<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$smarty = new Smarty();
//$db->debug=true;
$sql = $db->Prepare("SELECT * 
	FROM trabajadores t, cargos c 
	WHERE t.id_trabajador = c.id_trabajador
	AND t.estado= '1' 
	AND c.estado= '1'
	ORDER BY (c.id_trabajador) DESC
	");
$rs = $db->GetAll($sql);

$sql1 = $db->Prepare("SELECT * 
	FROM panaderia 
	WHERE id_panaderia = 1 
	AND estado <> '0' 
	");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo = $rs1[0]["logo"];

$fecha = date("Y-m-d H:i:s");

$smarty->assign("trabajadores_cargos", $rs);
$smarty->assign("logo", $logo);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display("trabajadores_cargos1.tpl");
?>
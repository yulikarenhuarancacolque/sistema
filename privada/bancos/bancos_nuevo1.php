<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");


$__nombres = $_POST["nombres"];
$__direccion = $_POST["direccion"];
$__telefono = $_POST["telefono"];
$__url = $_POST["url"];

$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_panaderia"] = 1;
$reg["nombres"] = $__nombres;
$reg["direccion"] = $__direccion;
$reg["telefono"] = $__telefono;
$reg["url"] = $__url;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("bancos", $reg, "INSERT");
if($rs1){
	header("Location: bancos.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("bancos_nuevo1.tpl");
}
?>
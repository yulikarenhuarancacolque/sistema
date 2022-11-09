<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_trabajador =$_POST["id_trabajador"];
$__cargo=$_POST["cargo"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_trabajador"] = $__id_trabajador;
$reg["cargo"] = $__cargo;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("cargos", $reg, "INSERT");
if($rs1){
	header("Location: cargos.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("cargos_nuevo1.tpl");
}
?>
<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_banco = $_POST["id_banco"];
$__sucursal = $_POST["sucursal"];
$__direccion = $_POST["direccion"];
$__telefono = $_POST["telefono"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_banco"] = $__id_banco;
$reg["sucursal"] = $__sucursal;
$reg["direccion"] = $__direccion;
$reg["telefono"] = $__telefono;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_sucursal"];
$rs1 = $db->AutoExecute("sucursales", $reg, "INSERT");
if($rs1){
	header("Location: sucursal.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("sucursal_nuevo1.tpl");
}
?>
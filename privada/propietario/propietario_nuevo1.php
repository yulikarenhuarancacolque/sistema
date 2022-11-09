<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__direccion = $_POST["direccion"];
$__nombres = $_POST["nombres"];
$__apellidos = $_POST["apellidos"];
$__celular = $_POST["celular"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_panaderia"] = 1;
$reg["direccion"] = $__direccion;
$reg["nombres"] = $__nombres;
$reg["apellidos"] = $__apellidos;
$reg["celular"] = $__celular;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("propietario", $reg, "INSERT");
if($rs1){
	header("Location: propietario.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("propietario_nuevo1.tpl");
}
?>
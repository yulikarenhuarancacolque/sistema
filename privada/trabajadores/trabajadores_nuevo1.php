<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__direccion = $_POST["direccion"];
$__nombres = $_POST["nombres"];
$__apellidos = $_POST["apellidos"];
$__celular = $_POST["celular"];
$__fecha_inicio = $_POST["fecha_inicio"];
$__fecha_final = $_POST["fecha_final"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_panaderia"] = 1;
$reg["direccion"] = $__direccion;
$reg["nombres"] = $__nombres;
$reg["apellidos"] = $__apellidos;
$reg["celular"] = $__celular;
$reg["fecha_inicio"] = $__fecha_inicio;
$reg["fecha_final"] = $__fecha_final;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("trabajadores", $reg, "INSERT");
if($rs1){
	header("Location: trabajadores.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("trabajadores_nuevo1.tpl");
}
?>
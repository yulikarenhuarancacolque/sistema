<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_propietario = $_REQUEST["id_propietario"];

$__direccion = $_POST["direccion"];
$__nombres = $_POST["nombres"];
$__apellidos = $_POST["apellidos"];
$__celular = $_POST["celular"];


//$db->debug=true;
$smarty = new Smarty;

$reg = array();

$reg["direccion"] = $__direccion;
$reg["nombres"] = $__nombres;
$reg["apellidos"] = $__apellidos;
$reg["celular"] = $__celular;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("propietario", $reg, "UPDATE", "id_propietario='".$__id_propietario."'");
if($rs1){
	header("Location: propietario.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_propietario", $__id_cliente);
	$smarty->display("propietario_modificar1.tpl");
}
?>
<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente = $_REQUEST["id_cliente"];

$__direccion = $_POST["direccion"];
$__nombres = $_POST["nombres"];
$__apellidos = $_POST["apellidos"];
$__celular = $_POST["celular"];
$__nit = $_POST["nit"];


$db->debug=true;
$smarty = new Smarty;

$reg = array();

$reg["direccion"] = $__direccion;
$reg["nombres"] = $__nombres;
$reg["apellidos"] = $__apellidos;
$reg["celular"] = $__celular;
$reg["nit"] = $__nit;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("clientes", $reg, "UPDATE", "id_cliente='".$__id_cliente."'");
if($rs1){
	header("Location: clientes.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_cliente", $__id_cliente);
	$smarty->display("clientes_modificar1.tpl");
}
?>
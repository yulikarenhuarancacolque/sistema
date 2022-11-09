<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente=$_POST["id_cliente"];
$__monto_venta=$_POST["monto_venta"];
$__fecha_venta=$_POST["fecha_venta"];
$__descuento=$_POST["descuento"];
$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_cliente"] = $__id_cliente;
$reg["descuento"] = $__descuento;
$reg["monto_venta"] = $__monto_venta;
$reg["fecha_venta"] = $__fecha_venta;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("ventas", $reg, "INSERT");
if($rs1){
	header("Location: ventas.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("ventas_nuevo1.tpl");
}
?>
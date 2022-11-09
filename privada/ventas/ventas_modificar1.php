<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente = $_REQUEST["id_cliente"];
$__id_venta = $_REQUEST["id_venta"];
$__fecha_venta = $_POST["fecha_venta"];
$__monto_venta = $_POST["monto_venta"];
$__descuento = $_POST["descuento"];
 //$db->debug=true;

$smarty = new Smarty;

$reg = array();

$reg["id_cliente"] = $__id_cliente;
$reg["fecha_venta"] = $__fecha_venta;
$reg["monto_venta"] = $__monto_venta;
$reg["descuento"] = $__descuento;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];

$rs1 = $db->AutoExecute("ventas", $reg, "UPDATE", "id_venta='".$__id_venta."'");
if($rs1){
	header("Location: ventas.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_venta", $__id_venta);
	$smarty->display("ventas_modificar1.tpl");
}
?>
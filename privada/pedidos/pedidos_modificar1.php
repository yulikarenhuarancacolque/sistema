<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cliente = $_REQUEST["id_cliente"];
$__id_pedido = $_REQUEST["id_pedido"];
$__direccion_envio = $_POST["direccion_envio"];
$__descuento = $_POST["descuento"];
$__fecha_pedido = $_POST["fecha_pedido"];
$__monto_pedido = $_POST["monto_pedido"];

 $db->debug=true;

$smarty = new Smarty;

$reg = array();

$reg["id_cliente"] = $__id_cliente;
$reg["direccion_envio"] = $__direccion_envio;
$reg["descuento"] = $__descuento;
$reg["fecha_pedido"] = $__fecha_pedido;
$reg["monto_pedido"] = $__monto_pedido;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];

$rs1 = $db->AutoExecute("pedidos", $reg, "UPDATE", "id_pedido='".$__id_pedido."'");
if($rs1){
	header("Location: pedidos.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_pedido", $__id_pedido);
	$smarty->display("pedidos_modificar1.tpl");
}
?>
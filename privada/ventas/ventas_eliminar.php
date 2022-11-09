<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_venta = $_REQUEST["id_venta"];

$smarty = new Smarty;
$db->debug = true;

$sql = $db->Prepare("SELECT *
	                FROM clientes
                WHERE id_venta = ?
                AND estado <> '0'
                ");
$rs = $db->GetAll($sql, array($__id_venta));
if (!$rs){
  $reg = array();
$reg["estado"] = '0';
$reg["usuario"] = $_SESSION["sesion_id_usuario"] ;
$rs1= $db->AutoExecute("ventas", $reg, "UPDATE", "id_venta='".$__id_venta."'");
header("Location:ventas.php");
	exit();
}else{
$smarty->assign("mensaje", "ERROR: Los datos no se eliminaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("ventas_eliminar.tpl");
}
?>


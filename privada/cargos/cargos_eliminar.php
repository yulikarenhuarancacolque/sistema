<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_cargo = $_REQUEST["id_cargo"];

$smarty = new Smarty;
//$db->debug = true;

$sql = $db->Prepare("SELECT *
	                FROM trabjadores
                WHERE id_cargo = ?
                AND estado <> '0'
                ");
$rs = $db->GetAll($sql, array($__id_cargo));
if (!$rs){
  $reg = array();
$reg["estado"] = '0';
$reg["usuario"] = $_SESSION["sesion_id_usuario"] ;
$rs1= $db->AutoExecute("cargos", $reg, "UPDATE", "id_cargo='".$__id_cargo."'");
header("Location:cargos.php");
	exit();
}else{
$smarty->assign("mensaje", "ERROR: Los datos no se eliminaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("cargos_eliminar.tpl");
}
?>


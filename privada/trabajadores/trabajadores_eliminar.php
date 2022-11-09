<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_trabajador = $_REQUEST["id_trabajador"];

$smarty = new Smarty;
//$db->debug = true;

$sql = $db->Prepare("SELECT *
	                FROM cargos
                WHERE id_trabajador = ?
                AND estado <> '0'
                ");
$rs = $db->GetAll($sql, array($__id_trabajador));
if (!$rs){
  $reg = array();
$reg["estado"] = '0';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1= $db->AutoExecute("trabajadores", $reg, "UPDATE", "id_trabajador='".$__id_trabajador."'");
header("Location:trabajadores.php");
	exit();
}else{
$smarty->assign("mensaje", "ERROR: Los datos no se eliminaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("trabajadores_eliminar.tpl");
}
?>


<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_producto=$_REQUEST["id_producto"];

$smarty = new Smarty;

//$db->debug=true;

	$sql = $db->Prepare("SELECT *
		                 FROM producto
		                 WHERE id_producto = ?
		                 AND estado <> '0'

		");
	$rs = $db->GetAll($sql, array($id_producto));
  $sql1 = $db->Prepare("SELECT *
		                 FROM panaderia
		                 WHERE id_panaderia = 1
		                 AND estado <> '0'
		");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo = $rs1[0]["logo"];
 $smarty->assign("logo",$logo);

 $smarty->assign("producto",$rs);
 $smarty->assign("direc_css", $direc_css); 
 $smarty->display("ficha_tec_producto1.tpl");
?>
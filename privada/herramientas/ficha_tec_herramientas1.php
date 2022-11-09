<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$nombre=$_REQUEST["nombre"];

$smarty = new Smarty;
//$db->debug=true;
if ($nombre=="T"){
	$sql = $db->Prepare("SELECT  ob.nombre, he.nombre,he.cantidad
			FROM obra ob, herramientas he
			WHERE ob.id_obra=he.id_obra
		              ");
	$rs=$db->GetAll($sql);

} else {
$sql = $db->Prepare("SELECT ob.nombre, he.nombre,he.cantidad
			FROM obra ob, herramientas he
			WHERE ob.id_obra=he.id_obra
		              ");
$rs = $db->GetAll($sql1, array ($nombre));
}
$sql1=$db->Prepare("SELECT *
	                    FROM panaderia
	                    WHERE id_panaderia=1
	                    AND estado <>'0'
	                    ");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$foto = $rs1[0]["logo"];
$smarty->assign("logo",$logo);

 $fecha =date("Y-m-d H:i:s");
 $smarty->assign("obras1", $rs);
 $smarty->assign("fecha", $fecha); 
 $smarty->assign("direc_css", $direc_css); 
 $smarty->display("ficha_tec_herramientas1.tpl");
?>
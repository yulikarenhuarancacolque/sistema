<?php
session_start();
require_once ("../../smarty/libs/Smarty.class.php"); 
require_once("../../conexion.php");

$cargo=$_REQUEST["cargo"];

$smarty = new Smarty;
//$db->debug=true;
if ($cargo=="T"){
	$sql=$db->Prepare("SELECT *
		               FROM trabajadores
		               WHERE estado<>'0'
		              ");
	$rs=$db->GetAll($sql);

} else {
 $sql1 = $db->Prepare("SELECT *
				 	FROM trabajadores 
				 	WHERE cargo = ?
				 	AND estado <> '0'
 					");
$rs = $db->GetAll($sql1, array ($cargo));
}

$sql1=$db->Prepare("SELECT *
	                    FROM panaderia
	                    WHERE id_panaderia=1
	                    AND estado <>'0'
	                    ");
$rs1 = $db->GetAll($sql1);
$nombre = $rs1[0]["nombre"];
$logo = $rs1[0]["logo"];
$smarty->assign("logo",$logo);

 $fecha =date("Y-m-d H:i:s");
 $smarty->assign("trabajadores_cargos1", $rs);
 $smarty->assign("fecha", $fecha); 
 $smarty->assign("direc_css", $direc_css); 
 $smarty->display("rpt_trabajadores_cargos1.tpl");
?>

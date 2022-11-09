<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
var_dump($_POST);
$id_cliente=$_POST["id_cliente"];
$descripcion=$_POST["descripcion"];
$monto= $_POST["monto"];
$fecha_inicio= $_POST["fecha_inicio"];
$fecha_fin= $_POST["fecha_fin"];


$smarty=new Smarty;
$db->debug=true;
	$reg=array();
	$reg["id_cliente"] =$id_cliente;
	$reg["descripcion"]=$descripcion;
	$reg["monto"]=$monto;
	$reg["fecha_inicio"]=$fecha_inicio;
	$reg["fecha_fin"]=$fecha_fin;
	$reg["fec_insercion"]=date("Y-m-d H:i:s");
	$reg["estado"]='0';
	$reg["usuario"]=$_SESSION["sesion_id_usuario"];
	$rs1=$db->AutoExecute("seguros", $reg, "INSERT");

if ($rs1){
	header("Location: seguros.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insetaron!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("seguros_nuevo1.tpl");
}
?>


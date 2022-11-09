<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

/*$nombre = $_POST["nombre"];*/
$sucursal = $_POST["sucursal"];
$direccion = $_POST["direccion"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_panaderia"] = 1;
/*$reg["nombre"] = $nombre;*/
$reg["sucursal"] = $sucursal;
$reg["direccion"] = $nombres;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("sucursales", $reg, "INSERT");

if ($rs1){
	header("Location: sucursales.php");
	exit();
}else{
	
	$smarty->assign("direc_css",$direc_css);
	$smarty->display("ficha_tec_sucursales1.tpl");
}
?>
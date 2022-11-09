<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$ci = $_POST["ci"];
$nombres = $_POST["nombres"];
$ap = $_POST["ap"];
$am = $_POST["am"];
$direccion = $_POST["direccion"];
$telef = $_POST["telef"];

//var_dump( $_POST);
//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_consultora"] = 1;
$reg["ci"] = $ci;
$reg["nombres"] = $nombres;
$reg["ap"] = $ap;
$reg["am"] = $am;
$reg["direccion"] = $direccion;
$reg["telef"] = $telef;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("personas", $reg, "INSERT");

if ($rs1){
	header("Location: personas.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!");
	$smarty->assign("direc_css",$direc_css);
	$smarty->display("persona_nuevo1.tpl");
}
?>
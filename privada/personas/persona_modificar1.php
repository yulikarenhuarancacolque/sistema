<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_persona = $_REQUEST["id_persona"];
$ci = $_POST["ci"];

$nombres = $_POST["nombres"];
$ap = $_POST["ap"];
$am = $_POST["am"];
$direccion = $_POST["direccion"];
$telef = $_POST["telef"];
$genero = $_POST["genero"];

var_dump( $_POST);
$db->debug=false;

$smarty = new Smarty;

$reg = array();
$reg["ci"] = $ci;
$reg["nombres"] = $nombres;
$reg["ap"] = $ap;
$reg["am"] = $am;
$reg["direccion"] = $direccion;
$reg["telef"] = $telef;
$reg["genero"] = $genero;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("personas", $reg, "UPDATE", "id_persona='".$id_persona."'");

if ($rs1){
	header("Location: personas.php");
	exit();
}else{
	$smarty->assing("mensaje","ERROR:Los datos no se modificaron!!!!!!!");
	$smarty->assign("direc_css",$direc_css);
	$smarty->assign("id_persona",$id_persona);
	$smarty->display("persona_modificar1.tpl");
}
?>
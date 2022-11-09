<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_persona = $_POST['id_persona'];

$smarty = new Smarty;

$db->debug=true;

$sql = $db->Prepare("SELECT *
	                   FROM usuarios
	                   WHERE id_persona= ?	
	                   AND estado <> '0'	                
	                   ");
$rs = $db->GetAll($sql, array($id_persona));

if (!$rs){
	$reg =array();
	$reg["estado"] ='0';
    $reg["usuario"] = $_SESSION['sesion_id_persona'];
    $reg["fec_modificacion"]= date("Y-m-d H:i:s");
	$rs1 = $db->AutoExecute("personas", $reg, "UPDATE", "id_persona='".$id_persona."'");
	header("Location:personas.php");
	exit();


}else {

$smarty->assign("mensaje", "ERROR: Los datos no se eliminaron!!!!!!!!!!!");
$smarty->assign("direc_css", $direc_css);
$smarty->display("personas_eliminar.tpl");

}
?>


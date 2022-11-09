<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_panaderia = $_REQUEST["id_panaderia"];
$__nombre = $_POST["nombre"];
$__nit_panaderia = $_POST["nit_panaderia"];
$__direccion = $_POST["direccion"];
$__telefono = $_POST["telefono"];
$__pagina_web = $_POST["pagina_web"];

$__logo = $_POST["logo"];
$__nombre_log = $_FILES["logo1"]['name'];
//$db->debug=true;
$smarty = new Smarty;
//esto es para guardar la foto
if((!empty($_FILES['logo1'])) and is_uploaded_file($_FILES['logo1']['tmp_name'])){
copy($_FILES['logo1']['tmp_name'],'logos/'.$__nombre_log);
$logo = $_FILES['logo1']['name'];
}elseif($__logo == ""){
  $logo1 = '';
  $__nombre_log = '';
}else
$__nombre_log = $__logo1;

$reg = array();
$reg["nombre"] = $__nombre;
$reg["nit_panaderia"] = $__nit_panaderia;
$reg["direccion"] = $__direccion;
$reg["telefono"] = $__telefono;
$reg["pagina_web"] = $__pagina_web;
$reg["logo"] = $__nombre_log;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("panaderia", $reg, "UPDATE", "id_panaderia='".$__id_panaderia."'");
if($rs1){
   $smarty->assign("mensaje", "los datos se modificaron ACTUALIZAR EL SISTEMA!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("panaderia1.tpl");
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("panaderia1.tpl");
}
?>







<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$id_persona = $_REQUEST["id_persona"];

$smarty = new Smarty;

$sq1 = $db->Prepare("SELECT *
					FROM personas
					WHERE id_persona = ?
					");
$rs = $db->GetAll($sq1, array($id_persona));
$smarty->assign("persona",$rs);

$smarty->assign("direc_css",$direc_css);
$smarty->display("persona_modificar.tpl");

?>
<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_trabajador = $_REQUEST["id_trabajador"];

$smarty = new Smarty;
$db->debug = true;

$sql = $db->Prepare("SELECT *
                    FROM trabajadores
                WHERE id_trabajador = ?
                ");
$rs = $db->GetAll($sql, array($__id_trabajador));
$smarty->assign("trabajadores", $rs);

$smarty->assign("direc_css",$direc_css);
$smarty->display("trabajadores_modificar.tpl");
?>


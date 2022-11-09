<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_cliente = $_REQUEST["id_cliente"];

$smarty = new Smarty;
$db->debug = true;

$sql = $db->Prepare("SELECT *
                    FROM clientes
                WHERE id_cliente = ?
                ");
$rs = $db->GetAll($sql, array($__id_cliente));
$smarty->assign("clientes", $rs);

$smarty->assign("direc_css",$direc_css);
$smarty->display("clientes_modificar.tpl");
?>


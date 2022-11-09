<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_venta = $_REQUEST["id_venta"];
$__id_cliente = $_REQUEST["id_cliente"];

$smarty = new Smarty;

//$db-> debug = true;

$sql = $db->Prepare("SELECT *
                    FROM ventas
                WHERE id_venta = ?    
  ");
$rs = $db->GetAll($sql, array($__id_venta));


$sql2 = $db->Prepare("SELECT *
                    FROM clientes
                    WHERE id_cliente = ?
                    AND estado <> '0'             
  ");
$rs2 = $db->GetAll($sql2, array($__id_cliente));

$sql3 = $db->Prepare("SELECT *
                    FROM clientes
                    WHERE id_cliente <> ?
                    AND estado <> '0'             
  ");
$rs3 = $db->GetAll($sql3, array($__id_cliente));

$smarty->assign("ventas", $rs);
$smarty->assign("cliente", $rs2);
$smarty->assign("clientes", $rs3);
$smarty->assign("direc_css", $direc_css);
$smarty->display("ventas_modificar.tpl");
?>
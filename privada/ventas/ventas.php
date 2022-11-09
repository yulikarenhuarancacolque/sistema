<?php
session_start(); 
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;


//$db->debug=true;

$sql = $db->Prepare("SELECT *
                    FROM ventas v, clientes c
                    WHERE v.id_cliente = c.id_cliente
                    AND v.estado <> '0'
                    AND c.estado <> '0'
                    ORDER BY v.id_venta DESC
                    ");
$rs = $db->GetAll($sql);

$smarty->assign("ventas", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("ventas.tpl");
?>
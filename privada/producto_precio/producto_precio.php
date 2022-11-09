<?php
session_start(); 
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;


//$db->debug=true;

$sql = $db->Prepare("SELECT *
                    FROM producto_precio a, producto p
                    WHERE a.id_producto = p.id_producto
                    AND a.estado <> '0'
                    AND p.estado <> '0'
                    ORDER BY a.id_producto_precio DESC
                    ");
$rs = $db->GetAll($sql);

$smarty->assign("producto_precio", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("producto_precio.tpl");
?>
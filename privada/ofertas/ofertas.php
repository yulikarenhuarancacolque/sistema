<?php
session_start(); 
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;


//$db->debug=true;

$sql = $db->Prepare("SELECT *
                    FROM ofertas o, producto p
                    WHERE o.id_producto = p.id_producto
                    AND o.estado <> '0'
                    AND p.estado <> '0'
                    ORDER BY o.id_ofertas DESC
                    ");
$rs = $db->GetAll($sql);

$smarty->assign("ofertas", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("ofertas.tpl");
?>
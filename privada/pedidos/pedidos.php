<?php
session_start(); 
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;


//$db->debug=true;

$sql = $db->Prepare("SELECT *
                    FROM pedidos p, clientes c
                    WHERE p.id_cliente = c.id_cliente
                    AND p.estado <> '0'
                    AND c.estado <> '0'
                    ORDER BY p.id_pedido DESC
                    ");
$rs = $db->GetAll($sql);

$smarty->assign("pedidos", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("pedidos.tpl");
?>
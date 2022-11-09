<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$sql = $db->Prepare("SELECT *
					FROM clientes
	                ");	
$rs = $db->GetAll($sql);

$sql1 = $db->Prepare("SELECT *	
                    FROM clientes cli
                    INNER JOIN seguros seg ON cli.id_cliente = seg.id_cliente
                    ORDER BY seg.id_cliente DESC
                    ");
$rs1 = $db->GetAll($sql1);

$smarty->assign("clientes", $rs); 
$smarty->assign("seguros", $rs1); 
$smarty->assign("direc_css", $direc_css);
$smarty->display("seguros.tpl"); 
?>

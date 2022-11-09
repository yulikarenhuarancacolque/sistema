<?php
session_start();/*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug = true;
$sql = $db->Prepare("SELECT *
					FROM bancos
	                ");		
$rs = $db->GetAll($sql);

$sql1 = $db->Prepare("SELECT *
                    FROM bancos ban 
                    INNER JOIN sucursales su ON ban.id_banco = su.id_sucursal
                ORDER BY su.id_banco DESC
  ");

$rs=$db->GetAll($sql1);

$smarty->assign("bancos",$rs);
$smarty->assign("sucursales",$rs1);
$smarty->assign("direc_css",$direc_css);
$smarty->display("sucursal.tpl");
?>

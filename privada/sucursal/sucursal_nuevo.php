<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
$smarty= new  Smarty;
//$db->debug=true;

$sql3 = $db->Prepare("SELECT *
	                    FROM bancos 
                        ORDER BY id_banco DESC
	              
	                   ");
$rs=$db->GetAll($sql3);

$smarty->assign("sucursales",$rs);
$smarty->assign("direc_css",$direc_css);
$smarty->display("sucursal_nuevo.tpl");

?>
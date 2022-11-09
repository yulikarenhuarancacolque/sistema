<?php
session_start();/*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;
//$db->debug = true;
$sql = $db->Prepare("SELECT *
                    FROM panaderia
                    WHERE id_panaderia = 1
                    ");
$rs = $db->GetAll($sql);
$smarty->assign("panaderia", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display("panaderia.tpl");
?>
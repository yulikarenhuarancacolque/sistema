<?php
session_start();/*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug = true;

$sql = $db->Prepare("SELECT *
                    FROM sucursales s, bancos b
                WHERE s.id_banco = b.id_banco
                AND  s.estado<> '0'
                AND b.estado <> '0'
                ORDER BY u.id_usuario DESC
                 ");


$rs=$db->GetAll($sql);

$smarty->assign("sucursales",$rs);
$smarty->assign("direc_css",$direc_css);
$smarty->display("sucursales.tpl");
?>

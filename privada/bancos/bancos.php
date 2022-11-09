<?php
session_start();/*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

$db->debug = true;

paginacion("bancos.php?",$smarty);

$sql3 = $db->Prepare("SELECT *
                    FROM bancos
                    INNER JOIN bancos ban ON ban.id_banco = ban.id_banco
                ORDER BY ban.id_banco DESC
  ");

$smarty->assign("bancos", $db->GetAll($sql3, array($nElem,$regIni)));

$smarty->assign("direc_css",$direc_css);
$smarty->display("bancos.tpl");
?>

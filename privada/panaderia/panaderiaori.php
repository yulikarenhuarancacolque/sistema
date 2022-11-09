<?php
session_start();/*inicio de sesion*/

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

//$db->debug = true;
contarRegistros($db,"panaderia");

paginacion("panaderia.php?",$smarty);

$sql3 = $db->Prepare("SELECT *
                    FROM panaderia
                WHERE estado <> '0'
                AND id_panaderia >=1
                ORDER BY id_panaderia DESC
                LIMIT ? OFFSET ?
  ");

$smarty->assign("panaderia", $db->GetAll($sql3, array($nElem,$regIni)));

$smarty->assign("direc_css",$direc_css);
$smarty->display("panaderia.tpl");
?>
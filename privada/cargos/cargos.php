<?php
session_start(); 
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;


//$db->debug=true;

$sql = $db->Prepare("SELECT *
                    FROM cargos c, trabajadores t
                    WHERE c.id_trabajador = t.id_trabajador
                    AND c.estado <> '0'
                    AND t.estado <> '0'
                    ORDER BY c.id_cargo DESC
                    ");
$rs = $db->GetAll($sql);

$smarty->assign("cargos", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("cargos.tpl");
?>
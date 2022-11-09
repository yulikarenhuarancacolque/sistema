<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_cargo = $_REQUEST["id_cargo"];
$__id_trabajador = $_REQUEST["id_trabajador"];

$smarty = new Smarty;

//$db-> debug = true;

$sql = $db->Prepare("SELECT *
                    FROM cargos
                WHERE id_cargo = ?    
  ");
$rs = $db->GetAll($sql, array($__id_cargo));


$sql2 = $db->Prepare("SELECT *
                    FROM trabajadores
                    WHERE id_trabajador = ?
                    AND estado <> '0'             
  ");
$rs2 = $db->GetAll($sql2, array($__id_trabajador));

$sql3 = $db->Prepare("SELECT *
                    FROM trabajadores
                    WHERE id_trabajador <> ?
                    AND estado <> '0'             
  ");
$rs3 = $db->GetAll($sql3, array($__id_trabajador));

$smarty->assign("cargos", $rs);
$smarty->assign("trabajador", $rs2);
$smarty->assign("trabajadores", $rs3);
$smarty->assign("direc_css", $direc_css);
$smarty->display("cargos_modificar.tpl");
?>
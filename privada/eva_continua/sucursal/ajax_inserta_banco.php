<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");


$nombre1 = $_POST["nombre1"];
$direccion1 = $_POST["direccion1"];
$telefono1 = $_POST["telefono1"];
$url1 = $_POST["url1"];

$reg = array();
$reg["id_panaderia"] = 1;
$reg["nombre"] = $nombre1;
$reg["direccion"] = $direccion1;
$reg["telefono"] = $telefono1;
$reg["url"] = $url1;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("bancos", $reg, "INSERT");

?>
<?php
session_start();/*inicio de sesion*/
require_once("../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");


$ap1 = $_POST["ap"];
$am1 = $_POST["am"];
$nombres1 = $_POST["nombres"];
$ci1 = $_POST["ci"];
$direccion1 = $_POST["direccion"];
$telefono1 = $_POST["telefono"];
$genero1 = $_POST["genero"];

$reg = array();
$reg["id_panaderia"] = 1;
$reg["ap"] = $ap;
$reg["am"] = $am;
$reg["nombres"] = $nombres;
$reg["ci"] = $ci;
$reg["direccion"] = $direccion;
$reg["telefono"] = $telefono;
$reg["genero"] = $genero;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("personas", $reg, "INSERT");

?>
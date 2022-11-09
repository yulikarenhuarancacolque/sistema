<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");


$nombres1 = $_POST["nombres1"];
$apellidos1 = $_POST["apellidos1"];
$celular1 = $_POST["celular1"];
$nit1 = $_POST["nit1"];
$direccion1 = $_POST["direccion1"];

$reg = array();
$reg["id_panaderia"] = 1;
$reg["nombres"] = $nombres1;
$reg["apellidos"] = $apellidos1;
$reg["celular"] = $celular1;
$reg["nit"] = $nit1;
$reg["direccion"] = $direccion1;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("clientes", $reg, "INSERT");

?>

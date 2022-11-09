<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombres = strip_tags(stripslashes($_POST["nombres"]));
$apellidos = strip_tags(stripcslashes($_POST["apellidos"]));
$celular = strip_tags(stripcslashes($_POST["celular"]));
$nit = strip_tags(stripcslashes($_POST["nit"]));

//$db->debug=true;

if ($nombres or $apellidos or $celular or $nit){
	$sql3 = $db->Prepare("SELECT*
						  FROM clientes
						  WHERE nombres LIKE ?
						  AND apellidos LIKE ?
						  AND celular LIKE ?
						  AND nit LIKE ?
						  AND estado <> '0'
						  ");
	$rs3 = $db->GetAll($sql3, array($nombres."%", $apellidos."%", $celular."%", $nit."%"));

	if($rs3) {
		echo"<center>
			<table width='60%' border='1'
				<tr>
					<th>NOMBRES</th><th>APELLIDOS</th><th>CELULAR</th><th>NIT</th>
					</tr>";
				foreach ($rs3 as $k => $fila) {
						 $str = $fila["nombres"];
						 $str1 = $fila["apellidos"];
						 $str2 = $fila["celular"];
						 $str3 = $fila["nit"];
					echo"<tr>
							<td align='center'>".resaltar($nit, $str)."</td>
							<td>".resaltar($nombres, $str1)."</td>
							<td>".resaltar($apellidos, $str2)."</td>
							<td>".resaltar($celular, $str3)."</td>
							<td align='center'>
								<input type='radio' name='opcion' value='' onClick='buscar_cliente(".$fila["id_cliente"].")'>
							</td>
							</tr>";
				}
				echo"</table>
				</center>";
	}else {
		echo"<center><b> EL CLIENTE NO EXISTE!!</b></center><br>";
		echo"<center>
			<table class='listado'>
			<tr>
					<td><b>DIRECCION</b></td>
					<td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>NOMBRES</b></td>
					<td><input type='text' name='nombres1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>APELLIDOS</b></td>
					<td><input type='text' name='apellidos1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>CELULAR</b></td>
					<td><input type='text' name='celular1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
			<tr>
					<td><b>NIT</b></td>
					<td><input type='text' name='nit1' size='10'></td>
				</tr>

				<td align='center' colspan='2'>
					<input type='button' value='ADICIONAR CLIENTE' onClick='insertar_cliente()' >
				</td>
				</tr>
			</table>
			</center>
			";
	}
}
?>
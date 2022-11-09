<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombres = strip_tags(stripslashes($_POST["nombres"]));
$apellidos = strip_tags(stripcslashes($_POST["apellidos"]));

$db->debug=true;

if ($nombres or $apellidos){
	$sql3 = $db->Prepare("SELECT *
						  FROM clientes
						  WHERE nombres LIKE ?
						  AND apellidos LIKE ?
						  ");
	$rs3 = $db->GetAll($sql3, array($nombres."%", $apellidos."%"));

	if($rs3) {
		echo"<center>
			<table width='60%' border='1'
				<tr>
					<th>NOMBRES</th><th>APELLIDOS</th><th>?</th>
					</tr>";
				foreach ($rs3 as $k => $fila) {
						 $str = $fila["nombres"];
						 $str1 = $fila["apellidos"];
					echo"<tr>
							<td align='center'>".resaltar($nombres, $str)."</td>
							<td align='center'>".resaltar($apellidos, $str1)."</td>
						</td>
							<td align='center'>
								<input type='radio' name='opcion' value='' onClick='buscar_cliente(".$fila["id_cliente"].")'>
							</td>
							</tr>";
				}
				echo"</table>
				</center>";
	}else {
		echo"<center><b>  NO EXISTE!!</b></center><br>";
		echo"<center>
			<table class='listado'>
				<tr>
					<td><b>NOMBRES</b></td>
					<td><input type='text' name='nombres1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>APELLIDOS</b></td>
					<td><input type='text' name='apellidos1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>DIRECCION</b></td>
					<td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>TELEFONO</b></td>
					<td><input type='text' name='telefono1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>

				<tr>
				<td align='center' colspan='2'>
					<input type='button' value='ADICIONAR' onClick='insertar_cliente()' >
				</td>
				</tr>
			</table>
			</center>
			";
	}
}
?>
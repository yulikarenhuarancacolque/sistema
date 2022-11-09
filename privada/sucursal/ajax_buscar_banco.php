<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$direccion = strip_tags(stripcslashes($_POST["direccion"]));

//$db->debug=true;      
if ($nombre or $direccion ){
	$sql3 = $db->Prepare("SELECT*
						 FROM bancos
						  WHERE nombre LIKE ?
						  AND direccion LIKE ?
						  ");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $direccion."%"));

	if($rs3) {
		echo"<center>
			<table width='60%' border='1'
				<tr>
					<th>NOMBRE</th><th>DIRECCION</th>?</th>
					</tr>";
				foreach ($rs3 as $k => $fila) {
						 $str = $fila["nombre"];
						 $str1 = $fila["direccion"];
					echo"<tr>
							<td align='center'>".resaltar($nombre, $str)."</td>
							<td>".resaltar($direccion, $str1)."</td>
							<td align='center'>
								<input type='radio' name='opcion' value='' onClick='buscar_banco(".$fila["id_banco"].")'>
							</td>
							</tr>";
				}
				echo"</table>
				</center>";
	}else {
		echo"<center><b> EL BANCO NO EXISTE!!</b></center><br>";
		echo"<center>
			<table class='listado'>
				<tr>
					<td><b>nombre</b></td>
					<td><input type='text' name='nombre1' size='10'></td>
				</tr>
				<tr>
					<td><b>direccion</b></td>
					<td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>telefono</b></td>
					<td><input type='text' name='telefono1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>url</b></td>
					<td><input type='text' name='url1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				
				<tr>
				<td align='center' colspan='2'>
					<input type='button' value='ADICIONAR BANCO' onClick='insertar_banco()' >
				</td>
				</tr>
			</table>
			</center>
			";
	}
}
?>
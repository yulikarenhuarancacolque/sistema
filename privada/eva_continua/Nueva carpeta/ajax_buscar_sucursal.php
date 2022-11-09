<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre=strip_tags(stripslashes($_POST["nombre"]));
$sucursal=strip_tags(stripslashes($_POST["sucursal"]));
$direccion=strip_tags(stripslashes($_POST["direccion"]));


if ($nombre or $sucursal or $direccion) {
	$sql3 = $db->Prepare("SELECT *
		                 FROM sucursales
		                 WHERE nombre LIKE ?
		                 AND sucursal LIKE ?
		                 AND direccion LIKE ?
		");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $sucursal."%", $direccion."%"));
	if ($rs3) {
		echo"<center>
		<table class='listado'>
			<tr>
				<th>BANCO</th><th>SUCURSAL</th><th>DIRECCION</th>
				<th><img src='../../imagenes/modificar.jpg'></th><th><img src='../../imagenes/eliminar.png'></th>
			</tr>";
			foreach($rs3 as $k => $fila){
				$str =  $fila["nombre"];
				$str1 = $fila["sucursal"];
				$str2 = $fila["direccion"];
			echo "<tr>
				<td aling='center'>".resaltar($nombre, $str)."</td>
				<td>".resaltar($sucursal, $str1)."</td>
				<td>".resaltar($direccion, $str2)."</td>
				
				
		</tr>";

}
				echo"</table>
				</center>";
	}else {
		echo"<center><b> LA SUCURSAL NO EXISTE!!</b></center><br>";
		echo"<center>
			<table class='listado'>
				<tr>
					<td><b>BANCO</b></td>
					<td><input type='text' name='nombre' size='10'onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>SUCURSAL</b></td>
					<td><input type='text' name='sucursal' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>DIRECCION</b></td>
					<td><input type='text' name='direccion' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				
			</table>
			</center>
			";
	}
}
?>
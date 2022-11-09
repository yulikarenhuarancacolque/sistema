<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombres = strip_tags(stripcslashes($_POST["nombres"]));
$descripcion_producto = strip_tags(stripcslashes($_POST["descripcion_producto"]));

//$db->debug=true;

if ($nombres or $descripcion_producto){
	$sql3 = $db->Prepare("SELECT*
						  FROM producto
						  WHERE nombres LIKE ?
						  AND descripcion_producto LIKE ?
						  AND estado <> '0'
						  ");
	$rs3 = $db->GetAll($sql3, array($nombres."%", $descripcion_producto."%"));

	if($rs3) {
		echo"<center>
			<table width='60%' border='1'
				<tr>
					<th>NOMBRES</th><th>DESCRIPCION_PRODUCTO<th>?</th>
					</tr>";
				foreach ($rs3 as $k => $fila) {
						 $str = $fila["nombres"];
						 $str1 = $fila["descripcion_producto"];
					echo"<tr>
							<td align='center'>".resaltar($nombres, $str)."</td>
							<td>".resaltar($descripcion_producto, $str1)."</td>
							<td align='center'>
								<input type='radio' name='opcion' value='' onClick='mostrar(".$fila["id_producto"].")'>
							</td>
							</tr>";
				}
				echo"</table>
				</center>";
	}else {
		echo"<center><b> EL PRODUCTO NO EXISTE!!</b></center><br>";
		echo"<center>
			<table class='listado'>
				<tr>
					<td><b>Nombres</b></td>
					<td><input type='text' name='nombres' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
					<td><b>Descripcion_producto</b></td>
					<td><input type='text' name='descripcion_producto' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
				</tr>
				<tr>
				<td align='center' colspan='2'>
					<input type='button' value='ADICIONAR PRODUCTO' onClick='insertar_producto()' >
				</td>
				</tr>
			</table>
			</center>
			";
	}
}
?>
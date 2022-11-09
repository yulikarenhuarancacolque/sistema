<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$direccion = strip_tags(stripslashes($_POST["direccion"]));
$telefono = strip_tags(stripslashes($_POST["telefono"]));
$url = strip_tags(stripslashes($_POST["url"]));


//$db->debug=true;
if ($nombre or $producto or $caracteristica or $precio){
	$sql3 = $db->Prepare("SELECT ban.nombre, su.sucursal, su.direccion, su.telefono
						FROM bancos ban, sucursales su
						WHERE ban.nombre LIKE ? 
						AND su.sucursal LIKE ?
						AND su.direccion LIKE ?
						AND su.telefono LIKE ?
						AND su.id_banco=ban.id_sucursal
						");
	$rs3 = $db->GetAll($sql3, array($nombre."%",$direccion."%", $telefono."%", $url."%"
));
	if ($rs3) {
		echo"<center>
			<table class='listado'>
					<tr>
					<th>nombre</th><th>direccion</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombre"];
			$str1 = $fila["direccion"];
			$str2 = $fila["telefono"];
			$str3 = $fila["url"];
			echo"
			<td aling='center'>".resaltar($nombre, $str)."</td>
				<td>".resaltar($direccion, $str1)."</td>
				<td>".resaltar($telefono, $str2)."</td>
				<td>".resaltar($url, $str3)."</td>
				</tr>";
		}
		echo "</table>
		</center>";
	}else {
		echo "<center><b>BANCO NO EXISTE!!</b></center><br>";
	}
}
?>
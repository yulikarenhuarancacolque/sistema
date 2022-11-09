<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombres = strip_tags(stripslashes($_POST["nombres"]));
$apellidos = strip_tags(stripslashes($_POST["apellidos"]));
$descripcion = strip_tags(stripslashes($_POST["descripcion"]));
$monto = strip_tags(stripslashes($_POST["monto"]));


//$db->debug=true;
if ($nombres or $apellidos or $descripcion or $monto){
	$sql3 = $db->Prepare("SELECT cli.nombres, cli.apellidos, seg.descripcion, seg.monto, seg.id_seguro
						FROM clientes cli, seguros seg
						WHERE cli.nombres LIKE ? 
						AND cli.apellidos LIKE ?
						AND seg.descripcion LIKE ?
						AND seg.monto LIKE ?
						AND cli.id_cliente=seg.id_cliente
						");
	$rs3 = $db->GetAll($sql3, array($nombres."%",$apellidos."%", $descripcion."%", $monto."%"
));
	if ($rs3) {
		echo"<center>
			<table class='listado'>
					<tr>
					<th>nombres</th><th>apellidos</th><th>descripcion</th><th>monto</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombres"];
			$str1 = $fila["apellidos"];
			$str2 = $fila["descripcion"];
			$str3 = $fila["monto"];
			echo"
			<td aling='center'>".resaltar($nombres, $str)."</td>
				<td>".resaltar($apellidos, $str1)."</td>
				<td>".resaltar($descripcion, $str2)."</td>
				<td>".resaltar($monto, $str3)."</td>
				</tr>";
		}
		echo "</table>
		</center>";
	}else {
		echo "<center><b>NO EXISTE!!</b></center><br>";
	}
}
?>
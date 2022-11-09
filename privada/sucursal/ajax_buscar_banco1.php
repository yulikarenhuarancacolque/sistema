<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$id_banco=$_POST["id_banco"];
var_dump($id_banco);

//$db->debug=true;
	$sql3 = $db->Prepare("SELECT *
                     FROM bancos 
                     WHERE id_banco like ?   

		");
 $rs3 = $db->GetAll($sql3, array($id_banco));

		echo"<center>
		<table width='60%' border='1'>
			<tr>
			<th colspan='4'>Datos banco</th>
			</tr>
			";
			foreach($rs3 as $k => $fila){
			echo "<tr>
				<td aling='center'>".$fila["nombre"]."</td>
				<td>".$fila["direccion"]."</td>
                <td>".$fila["telefono"]."</td>
                <td>".$fila["url"]."</td>
<tr>";
}
			echo"</table>
	        </center>";		
?>
<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");
$direccion = strip_tags(stripcslashes($_POST["direccion"]));
$nombres = strip_tags(stripcslashes($_POST["nombres"]));
$apellidos = strip_tags(stripcslashes($_POST["apellidos"]));
$celular = strip_tags(stripcslashes($_POST["celular"]));

//$db->debug=true;
if ($direccion or $nombres or $apellidos or $celular){
	$sql3 = $db->Prepare("SELECT *
                    FROM trabajadores
                    WHERE direccion LIKE ?
                     AND nombres LIKE ?
                     AND apellidos LIKE ?
                     AND celular LIKE ?
                       AND estado <>'0'
                      ");
$rs3 = $db->GetAll($sql3, array ($direccion. "%", $nombres."%", $apellidos."%",$celular."%"));
if($rs3){
echo"<center>
    <table class='listado'>
    <tr>
    <th>direccion</th><th>nombres</th><th>apellidos</th><th>celular<th><img src='../../imagenes/modificar.png' width='40%''></th><th><img src='../../imagenes/borrar.png'width='40%'></th>
     </tr>";
    foreach($rs3 as $k => $fila){
            $str = $fila["direccion"];
             $str1 = $fila["nombres"];
            $str2 = $fila["apellidos"];
            $str3 = $fila["celular"];
         echo"<tr>
              <td align='center'>".resaltar($direccion,$str)."</td>
              <td>".resaltar($nombres, $str1)."</td>
              <td>".resaltar($apellidos, $str2)."</td> 
              <td>".resaltar($celular, $str3)."</td>
              <td align='center'>
<form name='formModif".$fila["id_trabajador"]."' method='post' action='trabajadores_modificar.php'>
        <input type='hidden' name='id_trabajador' value='".$fila{'id_trabajador'}."'>
        <a href='javascript:document.formModif".$fila['id_trabajador'].".submit();' title='Modificar trabajador Sistema'>
          Modificar>>
          </a>
        </form>
      </td>
    <td align='center'>
      <form name='formElimi".$fila["id_trabajador"]."' method='post' action='trabajadores_eliminar.php'>
        <input type='hidden' name='id_trabajador' value='".$fila{"id_trabajador"}."'>
        <a href='javascript:document.formElimi".$fila['id_trabajador'].".submit();' title='Eliminar trabajador Sistema'
        onclick='javascript:return(confirm(\"Desea realmente Eliminar a la trabajador\"))';
         location.href='trabajador_eliminar.php''>
          Eliminar>>
        </a>
       </form>
       </td>
    </tr>";
      }
      echo"</table>
          </center>";
          }else{
          echo"<center><b> EL TRABAJADOR NO EXISTE!! </b></center><br>";   
    
  }
}
?>

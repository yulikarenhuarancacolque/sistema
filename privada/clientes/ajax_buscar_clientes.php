<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");
$nombres = strip_tags(stripcslashes($_POST["nombres"]));
$apellidos = strip_tags(stripcslashes($_POST["apellidos"]));
$direccion = strip_tags(stripcslashes($_POST["direccion"]));

//$db->debug=true;
if ($nombres or $apellidos or $direccion ){
  $sql3 = $db->Prepare("SELECT *
                    FROM clientes
                    WHERE nombres LIKE ?
                     AND apellidos LIKE ?
                     AND direccion LIKE ?
                       AND estado <>'0'
                      ");
$rs3 = $db->GetAll($sql3, array ($nombres. "%", $apellidos."%", $direccion."%"));
if($rs3){
echo"<center>
    <table class='listado'>
    <tr>
    <th>nombres</th><th>apellidos</th><th>direccion</th> </th><th><img src='../../imagenes/borrar.png'width='40%'></th>
     </tr>";
    foreach($rs3 as $k => $fila){
            
             $str = $fila["nombres"];
            $str1 = $fila["apellidos"];
            $str2 = $fila["direccion"];
         echo"<tr>
              <td align='center'>".resaltar($nombres,$str)."</td>
              <td>".resaltar($apellidos, $str1)."</td>
              <td>".resaltar($direccion, $str2)."</td> 
              <td align='center'>
<form name='formModif".$fila["id_cliente"]."' method='post' action='cliente_modificar.php'>
        <input type='hidden' name='id_cliente' value='".$fila{'id_cliente'}."'>
        <a href='javascript:document.formModif".$fila['id_cliente'].".submit();' title='Modificar cliente Sistema'>
          Modificar>>
          </a>
        </form>
      </td>
    <td align='center'>
      <form name='formElimi".$fila["id_cliente"]."' method='post' action='cliente_eliminar.php'>
        <input type='hidden' name='id_cliente' value='".$fila{"id_cliente"}."'>
        <a href='javascript:document.formElimi".$fila['id_cliente'].".submit();' title='Eliminar cliente Sistema'
        onclick='javascript:return(confirm(\"Desea realmente Eliminar a la cliente\"))';
         location.href='cliente_eliminar.php''>
          Eliminar>>
        </a>
       </form>
       </td>
    </tr>";
      }
      echo"</table>
          </center>";
          }else{
          echo"<center><b> EL CLIENTE NO EXISTE!! </b></center><br>";   
    
  }
}
?>

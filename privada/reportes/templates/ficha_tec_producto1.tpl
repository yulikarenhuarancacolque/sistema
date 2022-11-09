<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
 var ventanaCalendario=false
 function imprimir(){
 if(confirm(' Desea Imprimir ?')){
  window.print();
     }
 }
</script>
</head>
<body style='cursor:pointer;cursor:hand' onclick='imprimir();'>
<table width="100%" border="0">
 <tr>
  <td> <img src="../../imagenes/logopanaderia.png" width="70%" > 
  </td>
  <td aling="center"  width="80%"  >
    <h1>FICHA TECNICA DE PRODUCTO </h1>
     </td>
 </tr>
</table>
 <br>
 <center>
  <table border="1" cellspacing="0">
    {foreach item=r from=$producto}
  <tr>
  <th align="right">Nombres</th><th>:</th>
        <td><input type="text" name="nombres" value="{$r.nombres}" disabled=""></td>
</tr>
<tr>
  <th align="right">Descripcion producto</th><th>:</th>
        <td><input type="text" name="descripcion_producto" value="{$r.descripcion_producto}" disabled=""></td>
</tr>
        {/foreach} 
    </table>
  </td>
  </tr>
</table>
</body>
</html>
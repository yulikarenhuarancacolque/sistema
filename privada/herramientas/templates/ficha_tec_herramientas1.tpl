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
    <h1>FICHA HERRAMIENTAS </h1>
     </td>
 </tr>
</table>
 <br>
 <center>
  <table border="1" cellspacing="0">
  	{foreach item=r from=$herramientas}
   <tr>
	<th align="right">NOMBRE</th><th>:</th>
				<td><input type="text" name="nombre" value="{$r.nombre}" disabled=""></td>
</tr>
  <tr>
	<th align="right">Nombre</th><th>:</th>
				<td><input type="text" name="nombre" value="{$r.nombre}" disabled=""></td>
</tr>
<tr>
	<th align="right">Cantidad</th><th>:</th>
				<td><input type="text" name="cantidad" value="{$r.cantidad}" disabled=""></td>
</tr>

        {/foreach} 
    </table>
  </td>
  </tr>
</table>
</body>
</html>
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
    <h1>FICHA TECNICA DE PERSONA </h1>
     </td>
 </tr>
</table>
 <br>
 <center>
  <table border="1" cellspacing="0">
  	{foreach item=r from=$persona}
   <tr>
	<th align="right">C.I.</th><th>:</th>
				<td><input type="text" name="ci" value="{$r.ci}" disabled=""></td>
</tr>
  <tr>
	<th align="right">Nombres</th><th>:</th>
				<td><input type="text" name="nombres" value="{$r.nombres}" disabled=""></td>
</tr>
<tr>
	<th align="right">Apellido Paterno</th><th>:</th>
				<td><input type="text" name="ap" value="{$r.ap}" disabled=""></td>
</tr>
<tr>
	<th align="right">Apellido Materno</th><th>:</th>
				<td><input type="text" name="am" value="{$r.am}" disabled=""></td>
</tr>
<tr>
	<th align="right">Direccion</th><th>:</th>
				<td><input type="text" name="direccion" value="{$r.direccion}" disabled=""></td>
</tr>
<tr>
	<th align="right">Telefono</th><th>:</th>
				<td><input type="text" name="telefono" value="{$r.telefono}" disabled=""></td>
</tr>
<tr>
	<th align="right">Genero</th><th>:</th>
<td>
      {if $r.genero == 'M'}<input type="text" name="genero" value="MASCULINO" disabled=""> {/if}
       {if $r.genero == 'F'}<input type="text" name="genero" value="FEMENINO" disabled=""> {/if}
       </td>
</tr>
        {/foreach} 
    </table>
  </td>
  </tr>
</table>
</body>
</html>
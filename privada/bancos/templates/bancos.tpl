<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset-utf-8"/>
</head>
<body>
  <div class="titulo_listado">
  	<h1>
  		BANCOS
  	</h1>
  </div>
  <div class="titulo_nuevo">
  <form name="formNuevo" method="post" action="bancos_nuevo.php">
 <a href="javascript:document.formNuevo.submit();">
 	Nuevo>>>
 </a> 
  </form>
  </div>
  <center>
  	<table class="listado">
  		<tr>
        <th>NRO</th><th>NOMBRE</th><th>DIRECCION</th><th>TELEFONO</th><th>URL</th>
        <th><img src="../../imagenes/modificar.png"width="40%"></th><th><img src="../../imagenes/borrar.png"width="60%"></th>
  		</tr>
       {assign var="b" value="0"}
       {assign var="total" value="`$pagina-1`"}
       {assign var="a" value="`$numreg*$total`"}
       {assign var="b" value="`$b+1+$a`"}
       {foreach item=r from=$bancos}
   <tr>
   	<td align= "center">{$b}</td>
   	<td>{$r.nombre}</td>
    <td>{$r.direccion}</td>
    <td align= "center">{$r.telefono}</td>
    <td align= "center">{$r.url}</td>
    <td align= "center">

    <form name="formModif{$r.id_banco}" method="post" action="bancos_modificar.php">
    <input type="hidden" name="id_banco" value="{$r.id_banco}">
    <a href="javascript:document.formModif{$r.id_banco}.submit();" title="Modificar banco Sistema">
    Modificar>>
    </a>
    </form>	
    </td>
    <td align="center">
    <form name="formElimi{$r.id_banco}" method="post" action="bancos_eliminar.php">
    <input type="hidden" name="id_banco" value="{$r.id_banco}">	
    <a href="javascript:document.formElimi{$r.id_banco}.submit();" title="Eliminar banco Sistema" onclick="javascript:return(confirm(' Desea realmente Eliminar a la banco..?')); location.href='bancos_eliminar.php'" >
    	Eliminar>>	
    </a>
    </form>
    </td>
    {assign var="b" value="`$b+1`"}
    {/foreach}
   </tr>
  </table>

  </center>
</body>
</html>


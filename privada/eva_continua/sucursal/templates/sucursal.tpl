<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset-utf-8"/>
</head>
<body>
  <table width="100%" border="0">
    <tr>
      <td width="33%">
        <table border="0">
          <tr>
          </tr>
        </table>
      </td>
  <td align="center" width="33%" >
    <h1>USUARIOS</h1>
  </td>   
<td align="rigth" width="33%">
  <form name="formNuevo" method="post" action="sucursal_nuevo.php">
 <a href="javascript:document.formNuevo.submit();">
  Nuevo>>>   
   </a>
  </form>
</td>
  </tr>
  </table>

  <center>
  	<table class="listado">
  		<tr>
        <th>NRO</th><th>SUCURSAL</th><th>BANCO</th>
        <th><img src="../../imagenes/modificar.png"width="40%"></th><th><img src="../../imagenes/borrar.png"width="60%"></th>
  		</tr>
       {assign var="b" value='1'}
       {foreach item=r from=$sucursales}
       <tr>
        <td align="center">{$b}</td>
        <td>{$r.usuario}</td>
        <td>{$r.sucursal}  {$r.direccion }  {$r.telefono }</td>

   	<td align= "center">
       <form name="formModif{$r.id_sucursal}" method="post" action="sucursal_modificar.php">
           <input type="hidden" name="id_usuario" value="{$r.id_sucursal}">
           <input type="hidden" name="id_banco" value="{$r.id_banco}">
            <a href="javascript:document.formModif{$r.id_sucursal}.submit();" title="Modificar sucursales">
    Modificar>>
    </a>
    </form>
    </td>


 	<td align="center">
 <form name="formElimi{$r.id_sucursal}" method="post" action="sucursal_eliminar.php">
    
    <a href="javascript:document.formElimi{$r.id_sucursal}.submit();" title="Eliminar Usuarios" 
    onclick='javascript:return(confirm("Desea realmente Eliminar al sucursal::::{$r.sucursales}..?"));'> 
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


<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../{$direc_css}" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="../../ajax.js"></script>
  <script type="text/javascript" src="../js/buscar_sucursal.js"></script>
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
    <h1>SUCURSALES</h1>
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
    <div id="sucursales">
  	<table class="listado">
  		<tr>
        <th>
         <b>NOMBRE</b><br />
          <select name="nombre" onchange="buscar_sucursal()">
          <option value="">--Seleccione--</option>
          {foreach item=r from=$bancos}
          <option value="{$r.nombre}">{$r.nombre}</option>
          {/foreach}
        </select>
          </th>
          <th>
            <b>SUCURSAL</b><br />
            <input type="text" name="sucursal" value="" size="10" onkeyup="buscar_sucursal()">
          </th>
          <th>
            <b>DIRECCION</b><br />
            <input type="text" name="direccion" value="" size="10" onkeyup="buscar_sucursal()">
          </th>
          <th>
            <b>TELEFONO</b><br />
             <input type="text" name="telefono" value="" size="10" onkeyup="buscar_sucursal()">
          </th>
        </tr>
      </table>
    </form>
  </center>
  <center>
      <div id="sucursales1">
      <table class="listado">
        <tr>
          <th>NRO</th><th>SUCURSAL</th><th>DIRECCION</th><th>TELEFONO</th>
        </tr>
        {assign var="b" value="1"}
        {foreach item=r from=$sucursales}
        <tr>
          <td align="center"> {$b} </td>
          <td> {$r.sucursal} </td>
          <td> {$r.direccion}</td>
          <td> {$r.telefono} </td>
          {assign var="b" value="`$b+1`"}
          {/foreach}
        </tr>
      </table>
  </center>
 </body>
</html>

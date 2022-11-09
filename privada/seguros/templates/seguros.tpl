<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../{$direc_css}" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="../../ajax.js"></script>
  <script type="text/javascript" src="../js/buscar_seguros.js"></script>

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
        <td align="center" width="33%">
          <h1>SEGUROS</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="seguros_nuevo.php">
            <a href="javascript:document.formNuevo.submit();">
              Nuevo>>>
            </a>            
          </form>          
        </td>
      </tr>      
    </table>

  <center>
    <form action="#" method="post" name="formu">
      <table border="1" class="listado">
        <tr>
            <th>
            <b>NOMBRE</b><br />
          <select name="nombre" onchange="buscar_seguros()">
          <option value="">--Seleccione--</option>
          {foreach item=r from=$clientes}
          <option value="{$r.nombres}{$r.apellidos}">{$r.nombres}-{$r.apellidos}</option>
          {/foreach}
        </select>
          </th>
          <th>
            <b>DESCRIPCION</b><br />
            <input type="text" name="descripcion" value="" size="10" onkeyup="buscar_seguros()">
          </th>
          <th>
            <b>MONTO</b><br />
            <input type="text" name="monto" value="" size="10" onkeyup="buscar_seguros()">
          </th>
        </tr>
      </table>
    </form>
  </center>
  <center>
      <div id="seguros1">
      <table class="listado">
        <tr>
          <th>NRO</th><th>DESCRIPCION</th><th>MONTO</th><th>FECHA_INICIO</th><th>FEHCA_FIN</th>
        </tr>
        {assign var="b" value="1"}
        {foreach item=r from=$seguros}
        <tr>
          <td align="center"> {$b} </td>
          <td> {$r.descripcion} </td>
          <td> {$r.monto}</td>
          <td> {$r.fecha_inicio} </td>
          <td> {$r.fecha_fin} </td>
          {assign var="b" value="`$b+1`"}
          {/foreach}
        </tr>
      </table>
  </center>
 </body>
</html>
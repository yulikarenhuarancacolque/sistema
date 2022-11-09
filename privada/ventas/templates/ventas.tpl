<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../{$direc_css}" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">

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
          <h1>VENTAS</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="ventas_nuevo.php">
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
          <th>NRO</th><th>FECHA_VENTA</th><th>MONTO_VENTA</th><th>DESCUENTO</th><th>CLIENTES</th>
         <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
        </tr>
        {assign var="b" value="1"}
        {foreach item=r from=$ventas}
        <tr>
          <td align="center"> {$b} </td> 
          <td> {$r.fecha_venta} </td>
           <td> {$r.monto_venta} </td>
          <td> {$r.descuento} </td>
            <td> {$r.nombres} {$r.apellidos} -- {$r.celular}-- {$r.nit}</td>
          <td align="center">
            <form name="formModif {$r.id_venta}" method="post" action="venta_modificar.php">
              <input type="hidden" name="id_venta" value="{$r.id_venta}">
              <input type="hidden" name="id_cliente" value="{$r.id_cliente}">
              <a href="javascript:document.formModif {$r.id_venta}.submit(); " title="Modificar ventas">
                Modificar>>
              </a>
            </form>
          </td>
<td align="center">
          <form name="formElimi{$r.id_venta} " method="post" action="ventas_eliminar.php">
            <input type="hidden" name="id_venta" value="{$r.id_venta}">
            <a href="javascript:document.formElimi{$r.id_venta}.submit();" title="Eliminar ventas Sistema" onclick="javascript:return(confirm ('Desea realmente eliminar al ventas..?')); location.href='ventas_eliminar.php'">
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
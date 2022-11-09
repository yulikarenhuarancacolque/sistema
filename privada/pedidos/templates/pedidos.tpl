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
          <h1>PEDIDOS</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="pedidos_nuevo.php">
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
          <th>NRO</th><th>DIRECCION_ENVIO</th><th>DESCUENTO</th><th>FECHA_PEDIDO</th><th>MONTO_PEDIDO</th><th>CLIENTES</th>
         <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
        </tr>
        {assign var="b" value="1"}
        {foreach item=r from=$pedidos}
        <tr>
          <td align="center"> {$b} </td>
          <td> {$r.direccion_envio} </td>
          <td> {$r.descuento} </td>
          <td> {$r.fecha_pedido} </td>
           <td> {$r.monto_pedido} </td>

            <td> {$r.nombres} {$r.apellidos} -- {$r.celular}-- {$r.nit}</td>
          <td align="center">
            <form name="formModif {$r.id_pedido}" method="post" action="pedidos_modificar.php">
              <input type="hidden" name="id_pedido" value="{$r.id_pedido}">
              <input type="hidden" name="id_cliente" value="{$r.id_cliente}">
              <a href="javascript:document.formModif {$r.id_pedido}.submit(); " title="Modificar pedidos">
                Modificar>>
              </a>
            </form>
          </td>
<td align="center">
          <form name="formElimi{$r.id_pedido} " method="post" action="pedidos_eliminar.php">
            <input type="hidden" name="id_pedido" value="{$r.id_pedido}">
            <a href="javascript:document.formElimi{$r.id_pedido}.submit();" title="Eliminar pedidos Sistema" onclick="javascript:return(confirm ('Desea realmente eliminar al pedidos..?')); location.href='pedidos_eliminar.php'">
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
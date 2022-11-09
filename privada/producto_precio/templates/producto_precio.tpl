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
          <h1>PRODUCTO_PRECIO</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="producto_precio_nuevo.php">
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
          <th>NRO</th><th>FECHA_ASIGNACION</th><th>PRECIO</th><th>PRODUCTO</th>
         <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
        </tr>
        {assign var="b" value="1"}

        {foreach item=r from=$producto_precio}
        <tr>
          <td align="center"> {$b} </td>

          <td> {$r.fecha_asignacion} </td>
          <td> {$r.precio} </td>
            <td> {$r.nombres} {$r.descripcion_producto}</td>
          <td align="center">
            <form name="formModif {$r.id_producto_precio}" method="post" action="producto_precio_modificar.php">
              <input type="hidden" name="id_producto_precio" value="{$r.id_producto_precio}">
              <input type="hidden" name="id_producto_precio" value="{$r.id_producto_precio}">
              <a href="javascript:document.formModif {$r.id_producto_precio}.submit(); " title="Modificar producto_precio">
                Modificar>>
              </a>
            </form>
          </td>
        <td align="center">
          <form name="formElimi{$r.id_producto_precio} " method="post" action="producto_precio_eliminar.php">
            <input type="hidden" name="id_producto_precio" value="{$r.id_producto_precio}">
            <a href="javascript:document.formElimi{$r.id_producto_precio}.submit();" title="Eliminar producto_precio Sistema" onclick="javascript:return(confirm ('Desea realmente eliminar al producto_precio..?')); location.href='producto_precio_eliminar.php'">
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
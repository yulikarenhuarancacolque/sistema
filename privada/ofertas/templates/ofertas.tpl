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
          <h1>OFERTAS</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="ofertas_nuevo.php">
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
          <th>NRO</th><th>DESCRIPCION</th><th>OFERTAS</th><th>PRODUCTO</th>
         <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
        </tr>
        {assign var="b" value="1"}
        {foreach item=r from=$ofertas}
        <tr>
          <td align="center"> {$b} </td>
          <td> {$r.descripcion} </td>
          <td> {$r.ofertas} </td>
            <td> {$r.nombres} {$r.descripcion_producto}</td>
          <td align="center">
            <form name="formModif {$r.id_ofertas}" method="post" action="ofertas_modificar.php">
              <input type="hidden" name="id_ofertas" value="{$r.id_ofertas}">
              <input type="hidden" name="id_ofertas" value="{$r.id_ofertas}">
              <a href="javascript:document.formModif {$r.id_ofertas}.submit(); " title="Modificar ofertas">
                Modificar>>
              </a>
            </form>
          </td>
          <td align="center">
            <form name="formElimi {$r.id_ofertas}" method="post" action="ofertas_eliminar.php">
              <input type="hidden" name="id_ofertas" value="{$r.id_ofertas}">
              <a href="javascript:document.formElimi {$r.id_ofertas}.submit(); " title="Eliminar ofertas" onclick='javascript: return(confirm("Desea realmente Eliminar a la ofertas ::: {$r.ofertas}?"));'>
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
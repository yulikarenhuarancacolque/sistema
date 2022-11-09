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
          <h1>CARGOS</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="cargos_nuevo.php">
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
          <th>NRO</th><th>CARGO</th><th>TRABAJADORES</th>
         <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
        </tr>
        {assign var="b" value="1"}
        {foreach item=r from=$cargos}
        <tr>
          <td align="center"> {$b} </td>
          <td> {$r.cargo} </td>

            <td> {$r.nombres} {$r.apellidos} -- {$r.celular}</td>

          <td align="center">
            <form name="formModif {$r.id_cargo}" method="post" action="cargos_modificar.php">
              <input type="hidden" name="id_cargo" value="{$r.id_cargo}">
              <input type="hidden" name="id_trabajador" value="{$r.id_trabajador}">
              <a href="javascript:document.formModif {$r.id_cargo}.submit(); " title="Modificar cargos">
                Modificar>>
              </a>
            </form>
          </td>
          <td align="center">
            <form name="formElimi {$r.id_cargo}" method="post" action="cargos_eliminar.php">
              <input type="hidden" name="id_cargo" value="{$r.id_cargo}">
              <a href="javascript:document.formElimi {$r.id_cargo}.submit(); " title="Eliminar cargos" onclick='javascript: return(confirm("Desea realmente Eliminar a la cargos ::: {$r.cargo}?"));'>
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
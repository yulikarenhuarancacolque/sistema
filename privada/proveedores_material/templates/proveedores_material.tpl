<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../{$direc_css}" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
  </head>
  <body>
    <div class="titulo_listado">
      <h1>
        PROVEEDORES_MATERIAL
      </h1>
    </div>
    <div class="titulo_nuevo">
      <form name="formNuevo" method="post" action="proveedores_material_nuevo.php">
        <a href="javascript:document.formNuevo.submit();">
          Nuevo>>>
        </a>    
      </form>
    </div>
  <center>
    <table class="listado">
      <tr>
        <th>NRO</th><th>DIRECCION</th><th>NOMBRES</th><th>APELLIDOS</th><th>CELULAR</th>
        <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
      </tr>
        {assign var="b" value="0"}
        {assign var="total" value="`$pagina-1`"} 
        {assign var="a" value="`$numreg*$total`"}
        {assign var="b" value="`$b+1+$a`"}
        {foreach item=r from=$proveedores_material}
      <tr>
        <td align="center">{$b}</td>
        <td>{$r.direccion}</td>
        <td>{$r.nombres}</td>
        <td>{$r.apellidos}</td>
        <td align="center">{$r.celular}</td>    
        <td align="center">
          <form name="formModif{$r.id_proveedor}" method="post" action="proveedores_material_modificar.php">
            <input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
            <a href="javascript:document.formModif{$r.id_proveedor}.submit();" title="Modificar proveedores_material Sistema">
              Modificar>>>              
            </a>            
          </form>
        </td>
        <td align="center">
          <form name="formElimi{$r.id_proveedor} " method="post" action="proveedores_material_eliminar.php">
            <input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
            <a href="javascript:document.formElimi{$r.id_proveedor}.submit();" title="Eliminar proveedores_material Sistema" onclick="javascript:return(confirm ('Desea realmente eliminar al proveedores_material..?')); location.href='proveedores_material_eliminar.php'">
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
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../{$direc_css}" type="text/css" >
  <meta http-equiv="Content-type" content="text/html; charset-utf-8"/>
<script type="text/javascript" src="../../ajax.js"></script>
<script type="text/javascript" src="js/buscar_trabajadores.js"></script>

</head>
<body>
  <div class="titulo_listado">
    <h1>
      TRABAJADORES
    </h1>
  </div>
  <div class="titulo_nuevo">
  <form name="formNuevo" method="post" action="trabajadores_nuevo.php">
 <a href="javascript:document.formNuevo.submit();">
  Nuevo>>>
 </a> 
  </form>
  </div>
 <!----------INICIO BUSCADOR------------>
  <center>
   <form action="" method="post" name="formu">
    <table border="1" class="listado">
    <tr>
   <th>
       <b>Direccion</b><br/>
       <input type="text" name="direccion" value="" size="10" onkeyup="buscar_trabajadores()">
      </th>
<th>
       <b>Nombres</b><br/>
       <input type="text" name="nombres" value="" size="10" onkeyup="buscar_trabajadores()">
      </th>
      <th>
<b>Apellidos</b><br/>
       <input type="text" name="apellidos" value="" size="10" onkeyup="buscar_trabajadores()">
      </th>
    <th>
       <b>Celular</b><br/>
       <input type="text" name="celular" value="" size="10" onkeyup="buscar_trabajadores()">
      </th>
    </tr>
    </table>
   </form>
  </center>
 <!----------FIN BUSCADOR------------>
 <br><br>
  <center>
    <div id="trabajadores1">
      <table class="listado">
      <tr>
        <th>NRO</th><th>DIRECCION</th><th>NOMBRES</th><th>APELLIDOS</th><th>CELULAR</th>
        <th><img src="../../imagenes/modificar.png"width="40%"></th><th><img src="../../imagenes/borrar.png"width="60%"></th>
      </tr>
       {assign var="b" value="0"}
       {assign var="total" value="`$pagina-1`"}
       {assign var="a" value="`$numreg*$total`"}
       {assign var="b" value="`$b+1+$a`"}
       {foreach item=r from=$trabajadores}
   <tr>
    <td align= "center">{$b}</td>
    <td>{$r.direccion}</td>
    <td>{$r.nombres}</td>
    <td>{$r.apellidos}</td>
    <td >{$r.celular}</td>
    <td align= "center">
    <form name="formModif{$r.id_trabajador}" method="post" action="trabajadores_modificar.php">
    <input type="hidden" name="id_trabajador" value="{$r.id_trabajador}">
    <a href="javascript:document.formModif{$r.id_trabajador}.submit();" title="Modificar Trabajadores Sistema">
    Modificar>>
    </a>
    </form> 
    </td>
    <td align="center">
    <form name="formElimi{$r.id_trabajador}" method="post" action="trabajadores_eliminar.php">
    <input type="hidden" name="id_trabajador" value="{$r.id_trabajador}"> 
    <a href="javascript:document.formElimi{$r.id_trabajador}.submit();" title="Eliminar Trabajadores Sistema" onclick="javascript:return(confirm(' Desea realmente Eliminar a la trabajadores..?')); location.href='trabajadores_eliminar.php'" >
      Eliminar>>  
    </a>
    </form>
    </td>
    {assign var="b" value="`$b+1`"}
    {/foreach}
   </tr>
  </table>

 <!--PAGINACION----------------------------------->
 <table>
        <tr align="center">
          <td>
            {if !empty($urlback)}
              <a onclick="location.href='{$urlback}'" style="font-family: Verdana;font-size: 9px;cursor:pointer"; >&laquo;
              Anterior</a>
            {/if}
            {if !empty($paginas)}
              {foreach from=$paginas item=pag}
                {if $pag.npag == $pagina}
                   {if $pagina neq '1'}|{/if} <b style="color:#FB992F;font-size: 12px;"> {$pag.npag}</b>
                {else}
| <a onclick="location.href ='{$pag.pagV}'" style="cursor:pointer;">{$pag.npag} </a>
                {/if}
              {/foreach}
            {/if}
            {if $numpaginas gt $numbotones and !empty($urlnext) and $pagina lt $numpaginas}
             | <a onclick="location.href='{$urlnext}'" style="font-family: Verdana;font-size: 9px;cursor:pointer">
             Siguiente&raquo;</a>
            {/if}
          </td>
        </tr>      
      </table>
  </center>
</body>
</html>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript" src="js/buscar_personas.js"></script>
</head>
<body>
	<div  class="titulo_listado">
         <h1>
			PERSONAS
		</h1>
	</div>
	<div class="titulo_nuevo">
		<form name="formNuevo" method="post" action="persona_nuevo.php">
			<a href="javascript:document.formNuevo.submit();">
				Nuevo>>>
			</a>
		</form>
	</div>
     <center>
     	<form action="#" method="post" name="formu">
     		<table border="1" class="listado">
     			<tr>
     				<th>
     					<b>Paterno</b>
     					<input type="text" name="ap" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     				<th>
     					<b>Materno</b>
     					<input type="text" name="am" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     				<th>
     					<b>Nombre</b>
     					<input type="text" name="nombres" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     				<th>
     					<b>C. I.</b>
     					<input type="text" name="ci" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     			</tr>
     		</table>
     	</form>
     </center>
<br><br>
	<center>
		<div id="personas1">
		<table class="listado">
			<tr>
				<th>NRO</th><th>CI</th><th>NOMBRES</th><th>AP</th><th>AM</th>
				<th><img src="../../imagenes/modificar.png"></th><th><img src="../../imagenes/borrar.png"></th>
			</tr>
			{assign var="b" value="0"}
			{assign var="total" value="`$pagina-1`"}
			{assign var="a" value="`$numreg*$total`"}
			{assign var="b" value="`$b+1+$a`"}
			{foreach item=r from=$personas}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.ci}</td>
				<td>{$r.nombres}</td>
				<td align="center">{$r.ap}</td>
				<td align="center">{$r.am}</td>
				<td align="center">
			<form name="formModif{$r.id_persona}" method="post" action="persona_modificar.php">
				<input type="hidden" name="id_persona" value="{$r.id_persona}">
				<a href="javascript:document.formModif{$r.id_persona}.submit();" title="Modificar Persona Sistema">
					Modificar>>
				</a>
			</form>
		</td>
		<td align="center">
			<form name="formElimi{$r.id_persona}" method="post" action="persona_eliminar.php">
				<input type="hidden" name="id_persona" value="{$r.id_persona}">
				<a href="javascript:document.formElimi{$r.id_persona}.submit();" title="Eliminar Persona Sistema" onclick="javascript:return(confirm('Desea realmente Eliminar a la Persona {$r.nombres} {$r.nombres} {$r.ap} ?')); location.href='persona_eliminar.php'">
					Eliminar>>
				</a>
			</form>
		</td>
		{assign var="b" value="`$b+1`"}
		{/foreach}
			</tr>
		</table>

		<!--PAGINACION----------------------------->
		<table>
			<tr align="center">
				<td>
					{if !empty($urlback)}
					<a onclick="location.href='{$urlback}'" style="font-family: Verdana;font-size: 9px;cursor:pointer"; >&laquo;Anterior</a>
					{/if}
					 {if !empty($paginas)}
					  {foreach from=$paginas item=pag}
					   {if $pag.npag == $pagina}
					   	{if $pagina neq '1'}|{/if} <b style="color:#FB992F;font-size: 12PX;">{$pag.npag}</b>
					   	{else}
					| <a onclick="location.href='{$pag.pagV}'" style="cursor: pointer;"> {$pag.npag}</a>
					{/if}
					{/foreach}
					{/if}
					{if $numpaginas gt $numbotones and !empty($urlnext) and $pagina lt $numpaginas}
					| <a onclick="location.href='{$urlnext}'" style="font-family: Verdana;font-size: 9px;cursor:pointer">Siguiente&raquo;</a>
					{/if}	
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
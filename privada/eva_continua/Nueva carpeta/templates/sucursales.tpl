<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript" src="js/buscar_sucursales.js"></script>
</head>
<body>
<div  class="titulo_listado">
         <h1>
			SUCURSAL
		</h1>
	</div>
	<div class="titulo_nuevo">
	</div>
     <center>
     	<form action="#" method="post" name="formu">
     		<table border="1" class="listado">
     			<tr>
     				<th>
     					<b>BANCO</b>
     					<input type="text" name="nombre" value="" size="10" onkeyup="buscar_sucursales()">
     				</th>
     				<th>
     					<b>SUCURSAL</b>
     					<input type="text" name="sucursal" value="" size="10" onkeyup="buscar_sucursales()">
     				</th>
     				<th>
     					<b>DIRECCION</b>
     					<input type="text" name="direccion" value="" size="10" onkeyup="buscar_sucursales()">
     				</th>
     				
     			</tr>
     		</table>
     	</form>
     </center>
<br><br>
	<center>
		<div id="sucursales1">
		<table class="listado">

	<table width="50%" border="0">
		<tr>
			<td width="33%">
				<table border="0">
					<tr>
					</tr>
				</table>
			</td>
			<td align="center" width="20%">
			</td>
		</tr>
	</table>

	<center>
		<table class="listado">
			<tr>
				<th>NRO</th><th>BANCO</th><th>SUCURSAL</th><th>DIRECCION</th>
			{assign var="b" value='1'}
			{foreach item=r from=$sucursales}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre}</td>
				<td>{$r.sucursal}</td>
				<td>{$r.direccion}</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>

		</table>

	</center>
</body>
</html>

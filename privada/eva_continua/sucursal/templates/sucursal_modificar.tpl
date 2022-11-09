<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="../js/validar_sucursal.js"></script>
</head>
<body>

	<div class="formu_ingreso_datos">
		<form action="sucursal_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR SUCURSAL</h2>
			<b>banco (*)</b>
			<select name="id_banco">
				{foreach item=r from=$banco}
				<option value="{$r.id_banco}">{$r.nombre}-{$r.direccion}-{$r.telefono}-{$r.url}</option>
				{/foreach}
				<!--
				{foreach item=r from=$personas}
				<option value="{$r.id_persona}">{$r.ap}--{$r.ap}--{$r.nombres}</option>
				{/foreach}-->
			</select>
			{foreach item=r from=$sucursal_1}
			<p>
				<input type="text" name="sucursal" size="15" placeholder="sucursal" value="{$r.sucursal1}">(*)
			</p>
			<p>
				<input type="direccion" name="direccion" size="15" placeholder="direccion"> (*)
			</p>
			<p>
				<input type="telefono" name="telefono" size="15" placeholder="telefono"> 
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="hidden" name="id_sucursal" value="{$r.id_sucursal}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='sucursal.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*) Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>
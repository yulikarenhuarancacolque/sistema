<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="{$direc_css}" type="text/css" >
</head>
<body>
	<form action="claves/" method="post" target="cuerpo">
		{if $nick == ""}
		<div class="formu_ingreso">
			<p><h2>INGRESAR AL SISTEMA</h2></p>
			<p><h2>Login:</h2><input type="text" name="nick" size="12" value="" class="limpiar"></p>
			<p><h2>Clave:</h2><input type="password" name="password" size="11" value="" ></p>
			<input type="submit" name="accion" value="Ingresar" size="5" class="boton">
		</div>
		{/if}
	</form>
</body>
</html>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_bancos.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="bancos_nuevo1.php" method="post" name="formu"onkeyup="this.value=this.value.toUpperCase()">(*)
			<h2>REGISTRAR BANCOS</h2>
			 <p>
			<input type="text" name="nombre" size="15" placeholder="Nombre"onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="direccion" size="15" placeholder="direccion" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="telefono" size="15" placeholder="Telefono" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>

			<p>
			<input type="text" name="url" size="15" placeholder="Url" 
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='bancos.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>
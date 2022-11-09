<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_cargos.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="cargos_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR CARGOS</h2>
			<b>Trabajador (*)</b>
			<select name="id_trabajador">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$trabajadores}
			  <option value="{$r.id_trabajador}"> {$r.nombres} {$r.apellidos} -- {$r.celular} </option>
			{/foreach}
			</select>
         <p>
         	<input type="text" name="cargo" placeholder="Cargo" onkeyup="this.value=this.value.toUpperCase()">(*)
         </p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='cargos.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>

	
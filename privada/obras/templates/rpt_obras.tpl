<!DOCTYPE html>
<html lang="esp">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<script type="text/javascript">
		function validar(){
			nombre = document.formu.nombre.value;
			if (document.formu.nombre.value == "") {
				alert("Porfavor Seleccione el nombre");
				document.formu.nombre.focus();
				return;
			}
			ventanaCalendario = window.open("rpt_obras1.php?nombre=" + nombre , "calendario", "width=600, height=550, left=100, top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
		}
	</script>
</literal>
</head>
<body>
<div class="formu_ingreso_datos">
	<h2>RPT OBRAS</h2>
	<form method="post" name="formu">
		<p>
			<p>*Seleccione Nombre</p>
			<select name="nombre">
				<option value="">--Seleccione--</option>
				<option value="T"> Todos </option>
				<option value="T"> Nombre </option>
				{foreach item=r from=$nombre}
					<option value="{$r.nombre}">{$r.nombre}</option>
					{/foreach}
			</select>
		</p>
		<p>
			<input type="hidden" name="accion" value="">
			<input type="button" value="Aceptar" onclick="validar();" class="boton">
		</p>
	</form>
</div>
</body>
</html>
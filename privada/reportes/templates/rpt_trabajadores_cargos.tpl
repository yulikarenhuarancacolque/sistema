<!DOCTYPE html>
<html lang="esp">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<script type="text/javascript">
		function validar(){
			cargo = document.formu.cargo.value;
			if (document.formu.cargo.value == "") {
				alert("Por favor Seleccione el cargo");
				document.formu.cargo.focus();
				return;
			}
			ventanaCalendario = window.open("rpt_trabajadores_cargos1.php?cargo=" + cargo, "calendario", "width=600, height=550, left=100, top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
		}
	</script>
</literal>
</head>
<body>
<div class="formu_ingreso_datos">
	<h2>RPT TRABAJADORES POR CARGO</h2>
	<form method="post" name="formu">
		<p>
			<p>*Seleccione cargo</p>
			<select name="cargo">
				<option value="">--Seleccione--</option>
				<option value="T"> TODOS </option>
				<option value="S"> SECRETARIA </option>
				<option value="A"> AYUDANTE</option>
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
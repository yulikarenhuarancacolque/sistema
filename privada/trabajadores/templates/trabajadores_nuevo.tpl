<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_trabajadores.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="trabajadores_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR TRABAJADOR</h2>
            <p>
			<input type="text" name="direccion" size="15" placeholder="Direccion"onkeyup="this.value=this.value.toUpperCase()"> (*)
			</p>
			<p>
			<input type="text" name="nombres" size="15" placeholder="Nombres" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="apellidos" size="15" placeholder="Apellidos" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="celular" size="15" placeholder="Celular" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
           <p>
         	<input type="text" name="fecha_inicio" placeholder="Fecha de inicio"  class="tcal" >
         </p>
          <p>
         	<input type="text" name="fecha_final" placeholder="Fecha final"  class="tcal" >
         </p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='trabajadores.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>
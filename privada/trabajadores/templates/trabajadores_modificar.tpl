<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
		<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="js/validar_trabajadores.js"></script>
	<script type="text/javascript" src="../calendario/tcal.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="trabajadores_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR TRABAJADORES</h2>
			{foreach item=r from=$trabajadores}
          <p>
			<input type="text" name="direccion" size="15" placeholder="Direccion" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.direccion}">
			</p>

			<p>
			<input type="text" name="nombres" size="15" placeholder="Nombres" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.nombres}">
			</p>
			<p>
			<input type="text" name="apellidos" size="15" placeholder="Apellidos" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.apellidos}">
			</p>
			<p>
			<input type="text" name="celular" size="15" placeholder="Celular" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.celular}">
			</p>
			<p>
         	<input type="text" name="fecha_inicio" placeholder="Fecha de inicio"  class="tcal" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.fecha_inicio}">
         </p>
          <p>
         	<input type="text" name="fecha_final" placeholder="Fecha final"  class="tcal"onkeyup="this.value=this.value.toUpperCase()" value= "{$r.fecha_final}" >
         </p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="hidden" name="id_trabajador" value= "{$r.id_trabajador}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='trabajadores.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)</b></p>
		</form>
	</div>
</body>
</html>
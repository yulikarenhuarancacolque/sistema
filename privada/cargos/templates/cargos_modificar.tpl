<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_cargos.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="cargos_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR CARGOS</h2>
			<b>trabajador (*)</b>
			<select name="id_trabajador">
			{foreach item=r from=$trabajador}
			  <option value="{$r.id_trabajador}"> {$r.nombres} {$r.apellidos} -- {$r.celular}</option>
			{/foreach}
			{foreach item=r from=$trabajadores}
			  <option value="{$r.id_trabajador}"> {$r.nombres} {$r.apellidos} -- {$r.celular}</option>
			{/foreach}
			</select>
			{foreach item=r from=$cargos}
         
         <p>
         	<input type="text" name="cargo" placeholder="Cargo" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.cargo}">(*)
         </p>
			<p>
				<input type="hidden" name="accion" value="">
					<input type="hidden" name="id_cargo"  value= "{$r.id_cargo}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='cargos.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>
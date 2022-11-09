<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_ventas.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="ventas_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR VENTAS</h2>
			<b>Cliente (*)</b>
			<select name="id_cliente">
			{foreach item=r from=$cliente}
			  <option value="{$r.id_cliente}"> {$r.nombres} {$r.apellidos} -- {$r.celular}-- {$r.nit}</option>
			{/foreach}
			{foreach item=r from=$clientes}
			  <option value="{$r.id_cliente}"> {$r.nombres} {$r.apellidos} -- {$r.celular}-- {$r.nit}</option>
			{/foreach}
			</select>
			{foreach item=r from=$ventas}
         <p>
         	<input type="text" name="fecha_venta" placeholder="Fecha de venta"  class="tcal" value= "{$r.fecha_venta}" >
         </p>
         <p>
         	<input type="text" name="monto_venta" placeholder="Monto venta" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.monto_venta}">(*)
         </p>
          <p>
			<input type="text" name="descuento" size="15" placeholder="Descuento" value= "{$r.descuento}">
			</p>
			<p>
				<input type="hidden" name="accion" value="">
					<input type="hidden" name="id_venta"  value= "{$r.id_venta}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='ventas.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_pedidos.js"></script>
	<!--INICIO CALENDARIO-->
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
    <script type="text/javascript" src="../calendario/tcal.js"></script>
    <!--FINAL CALENDARIO-->
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="pedidos_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR PEDIDOS</h2>
			<b>Cliente (*)</b>
			<select name="id_cliente">
			{foreach item=r from=$cliente}
			  <option value="{$r.id_cliente}"> {$r.nombres} {$r.apellidos} -- {$r.celular}-- {$r.nit}</option>
			<!--{/foreach}
			{foreach item=r from=$clientes}
			  <option value="{$r.id_cliente}"> {$r.nombres} {$r.apellidos} -- {$r.celular}-- {$r.nit}</option>
			{/foreach}-->
			</select>
			{foreach item=r from=$pedidos}
          <p>
			<input type="text" name="direccion_envio" size="15" placeholder="Direccion_envio" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.direccion_envio}">(*)
			</p>
            <p>
			<input type="text" name="descuento" size="15" placeholder="Descuento" value= "{$r.descuento}">
			</p>
         <p>
         	<input type="text" name="fecha_pedido" placeholder="Fecha de pedido"  class="tcal" value= "{$r.fecha_pedido}" >
         </p>
         <p>
         	<input type="text" name="monto_pedido" placeholder="Monto pedido" onkeyup="this.value=this.value.toUpperCase()" value= "{$r.monto_pedido}">(*)
         </p>
			<p>
				<input type="hidden" name="accion" value="">
					<input type="hidden" name="id_pedido"  value= "{$r.id_pedido}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='pedidos.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>
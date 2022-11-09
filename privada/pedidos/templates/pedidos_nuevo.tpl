<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_pedidos.js"></script>
	<!--INICIO CALENDARIO-->
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
    <script type="text/javascript" src="../calendario/tcal.js"></script>
    <!--FINAL CALENDARIO-->
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
		function buscar() {
			var d1, contenedor, url;
			contenedor = document.getElementById('clientes');
			contenedor2= document.getElementById('cliente_seleccionado');
			contenedor3= document.getElementById('cliente_insertada');
			d1 = document.formu.nombres.value;
			d2 = document.formu.apellidos.value;
			d3 = document.formu.celular.value;
			d4 = document.formu.nit.value;
			ajax =nuevoAjax();
			url = "ajax_buscar_cliente.php"
			param = "nombres="+d1+"&apellidos="+d2+"&celular="+d3+"&nit="+d4;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4) {
					contenedor.innerHTML = ajax.responseText;
					contenedor2.innerHTML = "";
					contenedor3.innerHTML = "";
				}
			}
			ajax.send(param);
		}
		function buscar_cliente(id_cliente){
			var d1, contenedor, url;
			contenedor = document.getElementById('cliente_seleccionado');
			contenedor2 = document.getElementById('clientes');
			document.formu.id_cliente.value = id_cliente;

			d1 = id_cliente;

			ajax = nuevoAjax();
			url = "ajax_buscar_cliente1.php";
			param = "id_cliente="+d1;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4){
					contenedor.innerHTML = ajax.responseText;
					contenedor2.innerHTML = "";
				}
			}
			ajax.send(param);
		}

		function insertar_cliente() {
			var d1, contenedor, url;
			contenedor = document.getElementById('cliente_seleccionado');
			contenedor2 = document.getElementById('clientes');
			contenedor3 = document.getElementById('cliente_insertada');
			d1= document.formu.nombres1.value;
			d2= document.formu.apellidos1.value;
			d3= document.formu.celular1.value;
			d4= document.formu.nit1.value;
            d5= document.formu.direccion1.value;
			if(d1 == ""){
				alert("El nombre es incorrecto o el campo esta vacio");
				document.formu.nombres1.focus();
				return;
			}
			if(d2 =="") {
				alert("Por favor introduzca un Apellido");
				document.formu.apellidos1.focus();
				return;
			}
			if(d3 == "") {
				alert("El celular es incorrecto o el campo esta vacio");
				document.formu.celular1.focus();
				return;
			}
			if (d4 =="") {
				alert("Por favor introduzca un nit1");
				document.formu.nit1.focus();
				return;
			}
			ajax= nuevoAjax();
			url = "ajax_inserta_cliente.php";
			param = "nombres="+d1+"&apellidos="+d2+"&celular="+d3+"&nit="+d4+"$direccion1"+d5;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function() {
				if(ajax.readyState == 4){
					contenedor.innerHTML = "";
					contenedor2.innerHTML = "";
					contenedor3.innerHTML = ajax.responseText;
				}
			}
			ajax.send(param);
		}
	</script>   
</head>
<body>
	<h1>REGISTRAR PEDIDOS</h1>
	<div class="formu_ingreso_datos">
		<form action="pedidos_nuevo1.php" method="post" name="formu">
		<table border="1">
				<tr>
					<th align="right">Elija Cliente (*)</th>
					<th>:</th>
					<td>
						<table>
							<tr>
								<td>
									<b>Nombres</b><br />
									<input type="text" name="nombres" value="" size="10" onkeyup="buscar()">
								</td>
								<td>
									<b>Apellidos</b><br />
									<input type="text" name="apellidos" value="" size="10" onkeyup="buscar()">
								</td>
								<td>
									<b>Celular</b><br />
									<input type="text" name="celular" value="" size="10" onkeyup="buscar()">
								</td>
								<td>
									<b>Nit</b><br />
									<input type="text" name="nit" value="" size="10" onkeyup="buscar()">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table width="100%">
							<tr>
								<td colspan="3">
									<div id="clientes"> </div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table width="100%">
							<tr>
								<td colspan="3">
									<div id="cliente_seleccionado"> </div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table width="100%">
							<tr>
								<td colspan="3">
									<input type="hidden" name="id_cliente">
									<div id="cliente_insertada"> </div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>	
          <p>
			<input type="text" name="direccion_envio" size="15" placeholder="Direccion_envio" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
            <p>
			<input type="text" name="descuento" size="15" placeholder="Descuento">
			</p>
         <p>
         	<input type="text" name="fecha_pedido" placeholder="Fecha de pedido"  class="tcal" >
         </p>
         <p>
         	<input type="text" name="monto_pedido" placeholder="Monto pedido" onkeyup="this.value=this.value.toUpperCase()">(*)
         </p>
			<td align="center" colspan="3">			
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();">
				<input type="button" value="Cancelar" onclick="javascript:location.href='pedidos.php';">
			</td>
			</tr>
	</table>
	<table>
		<tr>
			<td colspan="3" align="center"><b>(*) Campos Obligatorios</b></td>
		</tr>
	</table>
</form>
</center>
</body>
</html>
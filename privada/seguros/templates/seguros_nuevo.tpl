<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="../js/validar_seguros.js"></script>
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
		function buscar(){
			
			var d1, contenedor, url;
			contenedor = document.getElementById('clientes');
			contenedor2= document.getElementById('clientes_seleccionado');
			contenedor3= document.getElementById('clientes_insertada');
					
			d1 = document.formu.nombres.value;
			d2 = document.formu.apellidos.value;

				
			ajax =nuevoAjax();
			url = "ajax_buscar_seguros.php"
			param = "nombres="+d1+"&apellidos="+d2;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function(){
				if (ajax.readyState == 4){
					contenedor.innerHTML = ajax.responseText;
					contenedor2.innerHTML = "";
					contenedor3.innerHTML = "";
				}
			}
			ajax.send(param);
		}
		function buscar_cliente(id_cliente){
			var d1, contenedor, url;
			contenedor = document.getElementById('clientes_seleccionado');
			contenedor2 = document.getElementById('clientes');
			document.formu.id_cliente.value = id_cliente;

			d1 = id_cliente;

			ajax = nuevoAjax();
			url = "ajax_buscar_cliente1.php";
			param = "id_cliente="+d1;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function(){
				if (ajax.readyState == 4){
					contenedor.innerHTML = ajax.responseText;
					contenedor2.innerHTML = "";
				}
			}
			ajax.send(param);
		}

		function insertar_cliente(){
			var d1, contenedor, url;
			contenedor = document.getElementById('clientes_seleccionado');
			contenedor2 = document.getElementById('clientes');
			contenedor3 = document.getElementById('clientes_insertada');
			d1 = document.formu.nombres1.value;
			d2 = document.formu.apellidos1.value;
			d3 = document.formu.direccion1.value;
			d3 = document.formu.telefono1.value;

			if(d1 == ""){
				alert("El nombres es incorrecta o el campo esta vacio");
				document.formu.nombres1.focus();
				return;
			}

			if(d2 == ""){
				alert("La apellidos es incorrecta o el campo esta vacio");
				document.formu.apellidos1.focus();
				return;
			}

			if(d3==""){
				alert("El direccion es incorrecto o el campo esta vacio");
				document.formu.direccion1.focus();
				return;
			}
  if(d4==""){
				alert("El telefono es incorrecto o el campo esta vacio");
				document.formu.telefono1.focus();
				return;
			}
			ajax= nuevoAjax();
			url = "ajax_inserta_clientes.php";
			param = "nombres1="+d1+"&apellidos1="+d2+"&direccion1="+d3+"&telefono1="+d4;
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

			ajax.onreadystatechange = function(){
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
		<h1>REGISTRAR SEGUROS</h1>
		<center>
		<form action="seguros_nuevo1.php" method="post" name="formu">
			<table border="1">
				<tr>
					<th align="right">Seleccione el cliente (*)</th>
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
									<div id="clientes_insertada"> </div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th align="right">Seguros (*)</th>
					<th>:</th>
					<td><input type="text" name="seguro" size="15" placeholder="seguro"> </td>
				</tr>
				<tr>
					<th align="right">Descripcion (*)</th>
					<th>:</th>
					<td><input type="text" name="descripcion" size="15" placeholder="descripcion"> </td>
				</tr>
				<tr>
					<th align="right">Monto (*)</th>
					<th>:</th>
					<td><input type="text" name="monto" size="15" placeholder="monto"> </td>
				</tr>
				<tr>
				<td align="center" colspan="3">			
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();">
				<input type="button" value="Cancelar" onclick="javascript:location.href='seguros.php';">
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
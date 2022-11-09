<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_sucursal.js"></script>
	<script type="text/javascript" src="../ajax.js"></script>
	<script type="text/javascript">
		function buscar() {
			var d1, contenedor, url;
			contenedor = document.getElementById('bancos');
			contenedor2= document.getElementById('banco_seleccionado');
			contenedor3= document.getElementById('banco_insertada');
			d1 = document.formu.nombre.value;
			d2 = document.formu.direccion.value;

			ajax =nuevoAjax();
			url = "ajax_buscar_banco.php"
			param = "nombre="+d1+"&direccion="+d2;
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
		function buscar_banco(id_banco){
			var d1, contenedor, url;
			contenedor = document.getElementById('banco_seleccionado');
			contenedor2 = document.getElementById('bancos');
			document.formu.id_banco.value = id_banco;

			d1 = id_banco;

			ajax = nuevoAjax();
			url = "ajax_buscar_banco1.php";
			param = "id_banco="+d1;
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

		function insertar_banco() {
			var d1, contenedor, url;
			contenedor = document.getElementById('banco_seleccionado');
			contenedor2 = document.getElementById('bancos');
			contenedor3 = document.getElementById('banco_insertada');
			d1= document.formu.nombre1.value;
			d2= document.formu.direccion1.value;
			d3= document.formu.telefono1.value;
			d4= document.formu.url1.value;

			if(d4 == ""){
				alert("El url es incorrecto o el campo esta vacio");
				document.formu.url1.focus();
				return;
			}
			if(d1 == "") {
				alert("El nombre es incorrecto o el campo esta vacio");
				document.formu.nombre1.focus();
				return;
			}
			
           if(d2 == "") {
				alert("El direccion es incorrecto o el campo esta vacio");
				document.formu.direccion1.focus();
				return;
			}
           if(d3 == "") {
				alert("El telefono es incorrecto o el campo esta vacio");
				document.formu.telefono1.focus();
				return;
			}
			ajax= nuevoAjax();
			url = "ajax_inserta_banco.php";
			param = "nombre1="+d1+"&direccion1="+d2+"&telefono1="+d3+"&url1="+d4;
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
		<h1>REGISTRO BANCO</h1>
		<center>
		<form action="sucursal_nuevo1.php" method="post" name="formu">
			<table border="1">
				<tr>
					<th align="right">Seleccione banco (*)</th>
					<th>:</th>
					<td>
						<table>
							<tr>
								<td>
									<b>nombre</b><br />
									<input type="text" name="nombre" value="" size="10" onkeyup="buscar()">
								</td>
								<td>
									<b>direccion</b><br />
									<input type="text" name="direccion" value="" size="10" onkeyup="buscar()">
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
									<div id="bancos"> </div>
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
									<div id="banco_seleccionado"> </div>
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
									<input type="hidden" name="id_banco">
									<div id="bancos_insertada"> </div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th align="right">sucursal (*)</th>
					<th>:</th>
					<td><input type="text" name="sucursal"> </td>
				</tr>
				<tr>
					<th align="right">direccion (*)</th>
					<th>:</th>
					<td><input type="text" name="direccion"> </td>
				</tr>
				<tr>
					<th align="right">telefono (*)</th>
					<th>:</th>
					<td><input type="text" name="telefono"> </td>
				</tr>

				<tr>
				<td align="center" colspan="3">			
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();">
				<input type="button" value="Cancelar" onclick="javascript:location.href='sucursal.php';">
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
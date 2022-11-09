<!DOCTYPE html>
<html lang="esp">
<head>
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<meta charset="utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
		function buscar() {
			var d1, d2, d3, d4, contenedor, ajax, url, param;
			contenedor = document.getElementById('herramientas1');
			d1 = document.formu.nombre.value;
			d2 = document.formu.nombre.value;
			d3 = document.formu.cantidad.value;
			ajax =nuevoAjax();
			url = "ajax_buscar_heramienta.php"
			param = "nombre="+d1+"&nombre="+d2+"&cantidad="+d3;
			//alert(param);
			ajax.open("POST", url, true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4) {
					contenedor.innerHTML = ajax.responseText;
				}
			}
			ajax.send(param);
		}

		function mostrar(id_herramienta){
			var d1, ventanaCalendario;
			d1 = id_herramienta;
            //alert(param);
            ventanaCalendario = window.open("ficha_tec_heramientas1.php?id_herramienta="+d1, "calendario", "width=600,height=550,left=100,top=100,scroballbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
	</script>
</head>
<body>
	<!---------BUSCADOR------->
		<h1>
	 FICHA TECNICA HERRAMIENTAS

		</h1>
		<center>

		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Nombre</b><br />
									<input type="text" name="nombre" value="" size="10" onkeyup="buscar()">
					</th>
								<th>
									<b>Nombre</b><br />
									<input type="text" name="nombre" value="" size="10" onkeyup="buscar()">
								</th>
								<th>
									<b>Cantidad</b><br />
									<input type="text" name="cantidad" value="" size="10" onkeyup="buscar()">
								</th>
								
							</tr>
						</table>
              </form>
          </center>
        <!--------BUSCADOR----------->
<center>
	<div id="herramientas1">
	</div>
</body>
</html>
<!DOCTYPE html>
<html lang="esp">
<head>
	<link rel="stylesheet" type="text/css" href="../{$direc_css}">
	<meta charset="utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
		function buscar() {
			var d1, d2, contenedor, ajax, url, param;
			contenedor = document.getElementById('producto1');
			d1 = document.formu.nombres.value;
			d2 = document.formu.descripcion_producto.value;
			ajax =nuevoAjax();
			url = "ajax_buscar_producto.php"
			param = "nombres="+d1+"&descripcion_producto="+d2;
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

		function mostrar(id_producto){
			var d1, ventanaCalendario;
			d1 = id_producto;
            //alert(param);
            ventanaCalendario = window.open("ficha_tec_producto1.php?id_producto="+d1, "calendario", "width=600,height=550,left=100,top=100,scroballbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
	</script>
</head>
<body>
	<!---------BUSCADOR------->
		<h1>
	 FICHA TECNICA PRODUCTO

		</h1>
		<center>

		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
								<th>
									<b>Nombres</b><br />
									<input type="text" name="nombres" value="" size="10" onkeyup="buscar()">
								</th>
								<th>
									<b>Descripcion producto</b><br />
									<input type="text" name="descripcion_producto" value="" size="30" onkeyup="buscar()">
								</th>
							</tr>
						</table>
              </form>
          </center>
        <!--------BUSCADOR----------->
<center>
	<div id="producto1">
	</div>
</body>
</html>
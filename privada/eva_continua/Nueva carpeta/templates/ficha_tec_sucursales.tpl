<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta charset="utf-8">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="../js/validar_sucursal.js"></script>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
	
	function buscar() {
			var d1, d2, d3, contenedor, ajax, url, param;
			contenedor = document.getElementById('sucursales1');
			d1 = document.formu.nombre.value;
			d2 = document.formu.sucursal.value;
			d2 = document.formu.direccion.value;
			ajax =nuevoAjax();
			url = "ajax_buscar_sucursal.php"
			param = "nombre="+d1+"&sucursal="+d2+"&direccion="+d3;
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

		function mostrar(id_sucursal){
			var d1, ventanaCalendario;
			d1 = id_sucursal;
            //alert(param);
            ventanaCalendario = window.open("ficha_tec_sucursales1.php?id_sucursal="+d1, "calendario", "width=600,height=550,left=100,top=100,scroballbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
			}
			</script>
</head>
<body>
		<form action="ficha_tec_sucursales1.php" method="post" name="formu">

			<h2>SUCURSAL</h2>
			<br>
			<tr>
				<th>NRO</th><th>BANCOS</th><th>SUCURSAL</th><th>DIRECCION</th>
			</tr>
				{assign var="b" value="1"}
	            {foreach item=r from=$ficha_tec_sucursales}
	            <tr>
	            	<td align="center">{$b}</td>
				    <td>{$r.nombre}</td>
				    <td>{$r.sucursal}{$r.direccion}</td>
				   {assign var="b" value="`$b+1`"} 
	            </tr>
	            {/foreach}
			
		</form>
	</div>
</body>
</html>
onkeyup="buscar()">
					</th>
								<th>
									<b>nombre</b><br />
									<input type="text" name="nombre" value="" size="10" onkeyup="buscar()">
								</th>
								<th>
									<b>sucursal</b><br />
									<input type="text" name="sucursal" value="" size="10" onkeyup="buscar()">
								</th>
								<th>
									<b>direccion</b><br />
									<input type="text" name="direccion" value="" size="10" onkeyup="buscar()">
								</th>
							</tr>
						</table>
              </form>
          </center>
        <!--------BUSCADOR----------->
        <h2>
			<input type="radio" name="seleccionar" onclick="javascript:imprimir()">Imprimir
		</h2>
<center>
	<div id="sucursales1">
	</div>
</body>
</html>
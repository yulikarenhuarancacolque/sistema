"use strict"
function buscar_sucursales(){
  var d1, d2, d3,  ajax,url,param,contenedor;
  contenedor =document.getElementById('sucursales1');
   d1 =document.formu.nombre.value;
   d2 =document.formu.sucursal.value;
   d3 =document.formu.direccion.value;
   ajax=nuevoAjax();
   url="ajax_buscar_sucursal.php"
   param="nombres="+d1+"&sucursal="+d2+"&direccion="+d3;
   ajax.open("POST",url,true);
   ajax.setRequestHeader('Content-type','application/x-www-form-urlencoded');
   ajax.onreadystatechange = function(){
   	if (ajax.readyState == 4) {
   		contenedor.innerHTML = ajax.responseText;

   	 }
   }
   ajax.send(param);
}
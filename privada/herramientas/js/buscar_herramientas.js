"use strict"
function buscar_personas(){
  var d1, d2, d3, d4, ajax,url,param,contenedor;
  contenedor =document.getElementById('herramientas1');
   d1 =document.formu.nombre.value;
   d2 =document.formu.nombre.value;
   d3 =document.formu.cantidad.value;
   ajax=nuevoAjax();
   url="ajax_buscar_herramientas.php"
   param="nombre="+d1+"&nombre="+d2+"&cantidad="+d3;
   ajax.open("POST",url,true);
   ajax.setRequestHeader('Content-type','application/x-www-form-urlencoded');
   ajax.onreadystatechange = function(){
   	if (ajax.readyState == 4) {
   		contenedor.innerHTML = ajax.responseText;

   	 }
   }
   ajax.send(param);
}
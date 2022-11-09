"use strict"
function buscar_personas(){
  var d1, d2, d3, d4, d5, d6 ajax,url,param,contenedor;
  contenedor =document.getElementById('seguros1');
   d1 =document.formu.nombres.value;
   d2 =document.formu.apellidos.value;
   d3 =document.formu.descripcion.value;
   d4 =document.formu.monto.value;
   d5 =document.formu.fecha_inicio.value;
   d6 =document.formu.fin.value;
   ajax=nuevoAjax();
   url="ajax_buscar_seguro.php"
   param="nombres="+d1+"&apellidos="+d2+"descripcion="+d1+"&monto="+d2+"&fecha_inicio="+d5+"&fecha_fin="+d6;
   ajax.open("POST",url,true);
   ajax.setRequestHeader('Content-type','application/x-www-form-urlencoded');
   ajax.onreadystatechange = function(){
   	if (ajax.readyState == 4) {
   		contenedor.innerHTML = ajax.responseText;

   	 }
   }
   ajax.send(param);
}
 "use strict"
function buscar_trabajadores(){
	var d1, d2, d3, d4, ajax,url, param, contenedor;
    contenedor = document.getElementById('trabajadores1');
    d1 = document.formu.direccion.value;
    d2 = document.formu.nombres.value;
    d3 = document.formu.apellidos.value;
    d4 = document.formu.celular.value;
    ajax = nuevoAjax();
    url = "ajax_buscar_trabajadores.php";
    param = "direccion="+d1+"&nombres="+d2+"&apellidos="+d3+"&celular="+d4;
    //alert(param);
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.onreadystatechange = function(){
     if(ajax.readyState == 4) {
        contenedor.innerHTML = ajax.responseText;
   }
}
ajax.send(param);
}
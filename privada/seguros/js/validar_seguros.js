"use strict"
function validar(){
  var monto = document.formu.monto.value;
 var nombres = document.formu.nombres.value;
  var apellidos = document.formu.apellidos.value;
  var descripcion = document.formu.descripcion.value;
   var monto = document.formu.monto.value;
  var fecha_inicio = document.formu.fecha_inicio.value;
  var fecha_fin = document.formu.fecha_fin.value;
 
  if (nombres==""){
    alert("Por favor ingrese el numero de nombre");
    document.formu.nombres.focus();
    return;
  }
  if (apellidos==""){
    alert("Por favor ingrese el numero de apellidos");
    document.formu.apellidos.focus();
    return;
  }

  if (monto==""){
    alert("Por favor ingrese el numero de monto");
    document.formu.monto.focus();
    return;
  }
  if (descripcion==""){
    alert("Por favor ingrese el numero de descripcion");
    document.formu.descripcion.focus();
    return;
  }
  /*valida dato obligatorio */
if (fecha_inicio == ""){
    alert("la fecha inicio esta vacia ");
    document.formu.fecha_inicio.focus();
    return;
}
/*valida dato obligatorio */
if (fecha_fin == ""){
    alert("la fecha fin esta vacia ");
    document.formu.fecha_fin.focus();
    return;
}
if (fecha_inicio>fecha_fin){
    alert("la fecha inicio no puede ser mayor a la fecha final ");
    document.formu.fecha_inicio.focus();
    return;
}
  document.formu.submit();
}

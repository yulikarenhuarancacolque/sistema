"use strict"
function validar(){
  var ci = document.formu..value;
  var nombres = document.formu.nombres.value;
  var sucursal = document.formu.sucursal.value;
  var direccion = document.formu.direccion.value;


  if (nombre==""){
    alert("Por favor ingrese el nombre");
    document.formu.nombre.focus();
    return;
  }
 if (sucursal==""){
    alert("Por favor ingrese la sucursal");
    document.formu.sucursal.focus();
    return;
  }
 if (direccion==""){
    alert("Por favor ingrese la direccion");
    document.formu.direccion.focus();
    return;
  }
 
  document.formu.submit();
}

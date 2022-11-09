 "use strict"
function validar(){
	var sucursal = document.formu.sucursal.value;
    var direccion = document.formu.direccion.value;
    var telefono = document.formu.telefono.value;

if (sucursal == "") {
    alert("Por favor ingrese al sucursal");
    document.formu.sucursal.focus();
    return;
}
    if (direccion == "") {
    alert("Por favor ingrese la direccion");
    document.formu.direccion.focus();
    return;
  
}
  if (telefono == "") {
    alert("Por favor ingrese la telefono");
    document.formu.telefono.focus();
    return;
  
}
document.formu.submit();
} 

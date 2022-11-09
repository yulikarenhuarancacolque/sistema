 "use strict"
function validar(){
	var id_banco = document.formu.id_banco.value;
	var usuario = document.formu.usuario.value;
    var clave = document.formu.clave.value;
/*validar como dato obligatorio y dato correcto (letras y espacios en blanco)*/
   if (id_banco == "") {
    alert("Por favor seleccione una banco");
    document.formu.id_banco.focus();
    return;
    }
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

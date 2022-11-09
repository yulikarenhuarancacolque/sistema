"use function"
function validar(){
    
    var nombres = document.formu.nombres.value;
    var direccion = document.formu.direccion.value;
    var telefono = document.formu.telefono.value;
    var url = document.formu.url.value;  

    if (!v1.test(nombre)) {
    alert("los nombre son incorrectos o esta vacio");
    document.formu.nombre.focus();
    return;
}

    if (!v1.test(direccion)) {
    alert("los direccion es incorrectos o esta vacio");
    document.formu.direccion.focus();
    return;
}

 if (!v22.test(telefono)){
    alert("el telefono es incorrectos o esta vacio");
    document.formu.telefono.focus();
    return;
}
if (url=""){
    alert("la url esta vacia ");
    document.formu.url.focus();
    return;
}  

document.formu.submit();
}
"use function"
function validar(){
    var direccion = document.formu.direccion.value;
    var nombres = document.formu.nombres.value;
    var apellidos = document.formu.apellidos.value;
    var celular = document.formu.celular.value;
if (direccion=""){
    alert("la direccion esta vacia ");
    document.formu.direccion.focus();
    return;
}   

    if (!v1.test(nombres)) {
    alert("los nombres son incorrectos o esta vacio");
    document.formu.nombres.focus();
    return;
}

    if (!v1.test(apellidos)) {
    alert("los apellidos es incorrectos o esta vacio");
    document.formu.apellidos.focus();
    return;
}

 if (!v22.test(celular)){
    alert("el celular es incorrectos o esta vacio");
    document.formu.celular.focus();
    return;
}

document.formu.submit();
}
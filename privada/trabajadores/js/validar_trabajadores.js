"use function"
function validar(){
     var direccion = document.formu.direccion.value;
    var nombres = document.formu.nombres.value;
    var apellidos = document.formu.apellidos.value;
    var celular = document.formu.celular.value;
    var fecha_inicio = document.formu.fecha_inicio.value;
    var fecha_final = document.formu.fecha_final.value;

/*valida dato obligatorio */
if (!v1.test(direccion) ){
    alert("la direccion esta vacia ");
    document.formu.direccion.focus();
    return;
}
/*validar como dato obligatorio y dato correcto (letras y espacios en blanco)*/
    if (!v1.test(nombres)) {
    alert("los nombres son incorrectos o esta vacio");
    document.formu.nombres.focus();
    return;
}
/*validar como dato obligatorio y dato correcto (letras y espacios en blanco)*/
    if (!v1.test(apellidos)) {
    alert("los apellidos es incorrectos o esta vacio");
    document.formu.apellidos.focus();
    return;
}
/*validar como dato obligatorio y dato correcto*/
 if (!v22.test(celular)){
    alert("el celular es incorrectos o esta vacio");
    document.formu.celular.focus();
    return;
}
/*valida dato obligatorio */
if (fecha_inicio == ""){
    alert("la fecha inicio esta vacia ");
    document.formu.fecha_inicio.focus();
    return;
}
/*valida dato obligatorio */
if (fecha_final == ""){
    alert("la fecha final esta vacia ");
    document.formu.fecha_final.focus();
    return;
}
if (fecha_inicio>fecha_final){
    alert("la fecha inicio no puede ser mayor a la fecha final ");
    document.formu.fecha_inicio.focus();
    return;
}
document.formu.submit();
}
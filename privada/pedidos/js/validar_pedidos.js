"use function"
function validar(){
    var id_cliente = document.formu.id_cliente.value;
     var direccion_envio = document.formu.direccion_envio.value;
    var descuento = document.formu.descuento.value;
     var fecha_pedido = document.formu.fecha_pedido.value;
   var monto_pedido = document.formu.monto_pedido.value; 
 if (id_cliente == "") {
    alert("Por favor seleccione un cliente");
    document.formu.id_cliente.focus();
    return;
    }
if(!v1.test(direccion_envio)) {
    alert("Por favor ingrese al direccion_envio");
    document.formu.direccion_envio.focus();
    return;
}
    /*validar dato correcto */
if (descuento=""){
    alert("el descuento esta vaci0 ");
    document.formu.descuento.focus();
    return;
}   
/*valida dato obligatorio */
if (fecha_pedido == ""){
    alert("la fecha de pedido esta vacia ");
    document.formu.fecha_pedido.focus();
    return;
}
 /*valida dato obligatorio */
if (!v22.test(monto_pedido) ){
    alert("el monto pedido esta vacia ");
    document.formu.monto_pedido.focus();
    return;
    }
document.formu.submit();
} 

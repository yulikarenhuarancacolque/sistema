"use strict"
function validar(){
    var id_cliente = document.formu.id_cliente.value;
    var descuento = document.formu.descuento.value;
     var fecha_venta = document.formu.fecha_venta.value;
   var monto_venta = document.formu.monto_venta.value; 
 if (id_cliente == "") {
    alert("Por favor seleccione un cliente");
    document.formu.id_cliente.focus();
    return;
    }

    /*validar dato correcto */
if (descuento=""){
    alert("el descuento esta vaci0 ");
    document.formu.descuento.focus();
    return;
}   
/*valida dato obligatorio */
if (fecha_venta == ""){
    alert("la fecha de venta esta vacia ");
    document.formu.fecha_venta.focus();
    return;
}
 /*valida dato obligatorio */
if (!v22.test(monto_venta) ){
    alert("el monto venta esta vacia ");
    document.formu.monto_venta.focus();
    return;
    }
document.formu.submit();
} 

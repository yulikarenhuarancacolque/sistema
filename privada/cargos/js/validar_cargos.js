"use strict"
function validar(){
    var id_trabajador = document.formu.id_trabajador.value;
    var cargo = document.formu.cargo.value;
    
 if (id_trabajador == "") {
    alert("Por favor seleccione un trabajador");
    document.formu.id_trabajador.focus();
    return;
    }
    /*validar dato correcto */
if (cargo=""){
    alert("el cargo esta vaci0 ");
    document.formu.cargo.focus();
    return;
}   

document.formu.submit();
} 

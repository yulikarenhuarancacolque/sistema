<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
 var ventanaCalendario=false
 function imprimir(){
 if(confirm(' Desea Imprimir ?')){
  window.print();
     }
 }
</script>
</head>
<body style='cursor:pointer;cursor:hand' onclick='imprimir();'>
<table width="100%" border="0">
 <tr>
  <td> <img src="../../imagenes/logopanaderia.png" width="70%" > 
  </td>
  <td aling="center"  width="80%"  >
    <h1>PERSONAS CON FECHAS </h1>
     </td>
 </tr>
</table>
 <br>
 <center>
  <table border="1" cellpadding="0">
   <tr>
  <th>NRO</th><th>PERSONAS</th><th>FECHA INSERCION</th>
      </tr>
      {assign var="b" value="1"}
       {foreach item=r from=$personas_fechas1}
       <tr> 
        <td align = "center ">{$b}</td>
        <td>{$r.nombres}{$r.ap} {$r.am} </td> 
        <td> {$r.fec_insercion}</td> 
        {assign var="b" value="`$b+1`"} 
        {/foreach} 
        </tr>
    </table>
  </center>
  <p>
  <b>DEL:</b>{$fecha1} <b>A</b> {$fecha2}
  </p>
</body>
</html>
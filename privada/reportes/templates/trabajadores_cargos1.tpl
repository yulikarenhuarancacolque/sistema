
<!DOCTYPE html>
<html>
<head>
<script>
 var ventanaCalendario=false
 function imprimir(){}
 if(confirm('Desea Imprimir?')){
  window.print();
 }
</script>
</head>
<body style='cursor:pointer; cursor:hand' onClick='imprimir'(); >
<table width="100%" border="0">


 <tr>
  <td> <img src="../../imagenes/logopanaderia.png" width="70%" > </td>
  <td aling="center"  width="80%"  ><h1>TRABAJADORES CARGOS</h1> </td>
 </tr>
</table>
 <br>
 <center>
  <table>
   <tr>
   <th>NRO</th>
   <th>TRABAJADORES</th>
   <th>CARGO</th>
   </tr>
   {assign var='b' value='1'}
   {foreach item=r from=$trabajadores_cargos}
   <tr>
    <td aling="center">{$b}</td>
    <td>{$r.nombres}--{$r.apellidos}--{$r.celular}</td>

     <td><i>{$r.cargo}</i></td>
    {assign var="b" value="`$b+1`"} 
    {/foreach}
   </tr>
  </table>
  <br>
  <br>
  <b>Fecha:</b>{$fecha}
 </center>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript">
    var ventanaCalendario=false
    function imprimir(){
      if (confirm(' Desea imprimir? ')){
        window.print();
      }
    }
  </script>
</head>
<body style='cursor: pointer;cursor:hand' onclick='imprimir()'>
  <table width="100%" border="0">
    <tr>
      <td>
       <img src="../../imagenes/logopanaderia.png" width="40%" > 
      </td>
      <td>
        <h1> OBRAS</h1>
      </td>
    </tr>
  </table>
  <br>
  <center>
    <table border="1" cellspacing="0">
      <tr>
        <th>NRO</th><th>NOMBRE</th><th>HERRAMIENTA</th><th>CANTIDAD</th>
      </tr>
      {assign var="b" value="1"}
      {foreach item=r from=$obras}
      <tr>
        <td align= "center">{$b}</td>
      
        <td>{$r.nombre}</td>
        <td>{$r.nombre}</td>
        <td>{$r.cantidad}</td>


        {assign var="b" value="`$b+1`"}
        {/foreach}
      </tr>
    </table>
    <br><br>
    <b>Fecha:</b> {$fecha}
  </center>
</body>
</html>


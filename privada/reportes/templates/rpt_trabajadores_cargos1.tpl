
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript">
    var ventanaCalendario=false
    function imprimir(){
      if (confirm('Desea imprimir?')){
        window.print();
      }
    }
  </script>
</head>
<body style='cursor: pointer;cursor:hand' onclick='imprimir()'>
  <table width="100%" border="0">
    <tr>
      <td>
        <img src="../../imagenes/logopanaderia.png" width="70%" > 
      </td>
      <td>
        <h1> TRABAJADORES-- CARGOS</h1>
      </td>
    </tr>
  </table>
  <br>
  <center>
    <table border="1" cellspacing="0">
  <th>NRO</th><th>TRABAJADORES</th><th>CARGO</th>
      </tr>
        {assign var="b" value="1"}
              {foreach item=r from=$trabajadores_cargos1}
              <tr>
                <td align="center">{$b}</td>
            <td>{$r.nombres}</td>
           <td> {$r.apellidos}</td>
        <td>{if $r.cargo=='S'}SECRETARIA{else}AYUDANTE{/if} </td>
        {assign var="b" value="`$b+1`"}
        {/foreach}
      </tr>
    </table>
    <br><br>
    <b>Fecha:</b> {$fecha}
  </center>
</body>
</html>


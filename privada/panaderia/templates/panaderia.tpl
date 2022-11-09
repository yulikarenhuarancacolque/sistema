<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
<script type="text/javascript" src="js/validar_panaderia.js"></script>
</head>
<body>
  <br>
  <center>
    <h1>PANADERIA</h1>
     <form action="panaderia1.php" method="post" name="formu" enctype="multipart/form-data">
  	<table border="1">
       {foreach item=r from=$panaderia}
       <tr>
            <th> Nombre(*)</th><th>:</th>
            <td><input type="text" name="nombre" onkeyup="this.value=this.value.toUpperCase()" value="{$r.nombre}"> </td>
          </tr>
 <tr>
            <th align="right">Nit_panaderia<th></th>:</th>
            <td>
              <input type="text" name="nit_panaderia" onkeyup="this.value=this.value.toUpperCase()" value="{$r.nit_panaderia}"> </td>
          </tr>
          <tr>
            <th align="right">Direccion<th></th>:</th>
            <td>
              <input type="text" name="direccion" onkeyup="this.value=this.value.toUpperCase()" value="{$r.direccion}"> </td>
          </tr>
          <tr>
           <th align="right">Telefono<th></th>:</th>
            <td>
              <input type="text" name="telefono" onkeyup="this.value=this.value.toUpperCase()" value="{$r.telefono}"> </td> 
          </tr>
           <tr>
            <th align="right">Pagina_Web(*)<th></th>:</th>
            <td>
              <input type="text" name="pagina_web" onkeyup="this.value=this.value.toUpperCase()" value="{$r.pagina_web}"> </td>
          </tr>
          <tr>
            <th>Logo(*)</th><th>:</th>

            <td>
          <input type="hidden" name="MAX-FILE-SIZE" value="1000000">
          <input type="file" name="logo1">
          <input type="hidden" name="logo" value="{$r.logo1}">
          <br><b>{$r.logo}</b>
        </td>
        </tr>
        <tr>
          <td align="center" colspan="3">
            <input type="hidden" name="accion" value="">
            <input type="hidden" name="id_panaderia" value="{$r.id_panaderia}">
            <input type="button" value="Aceptar" onclick="validar();">
          </td>
        </tr>
       {/foreach}
      </table>
      <table>
      <tr>
      <td colspan="3" aling="center"><b>(*)Campos Obligatorios</b></td>
    </tr>
  </table>
</form>
    </center>
  </body>
</html>
  </center>
</body>
</html>


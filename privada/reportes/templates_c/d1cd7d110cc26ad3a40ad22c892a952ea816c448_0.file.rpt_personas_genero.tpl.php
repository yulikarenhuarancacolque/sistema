<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:47:44
  from 'C:\wamp64\www\www\sis_panaderia\privada\reportes\templates\rpt_personas_genero.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_635481206a1f13_78760031',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd1cd7d110cc26ad3a40ad22c892a952ea816c448' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\reportes\\templates\\rpt_personas_genero.tpl',
      1 => 1661909022,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_635481206a1f13_78760031 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="esp">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
">
	<?php echo '<script'; ?>
 type="text/javascript">
		function validar(){
			genero = document.formu.genero.value;
			if (document.formu.genero.value == "") {
				alert("Porfavor Seleccione el Genero");
				document.formu.genero.focus();
				return;
			}
			ventanaCalendario = window.open("rpt_personas_genero1.php?genero=" + genero , "calendario", "width=600, height=550, left=100, top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
		}
	<?php echo '</script'; ?>
>
</literal>
</head>
<body>
<div class="formu_ingreso_datos">
	<h2>RPT PERSONAS POR GENERO</h2>
	<form method="post" name="formu">
		<p>
			<p>*Seleccione Genero</p>
			<select name="genero">
				<option value="">--Seleccione--</option>
				<option value="T"> Todos </option>
				<option value="F"> Femenino </option>
				<option value="M"> Masculino </option>
			</select>
		</p>
		<p>
			<input type="hidden" name="accion" value="">
			<input type="button" value="Aceptar" onclick="validar();" class="boton">
		</p>
	</form>
</div>
</body>
</html><?php }
}

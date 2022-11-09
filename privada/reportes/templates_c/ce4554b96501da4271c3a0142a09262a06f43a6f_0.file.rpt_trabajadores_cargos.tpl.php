<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:48:14
  from 'C:\wamp64\www\www\sis_panaderia\privada\reportes\templates\rpt_trabajadores_cargos.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6354813e660d02_15576136',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ce4554b96501da4271c3a0142a09262a06f43a6f' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\reportes\\templates\\rpt_trabajadores_cargos.tpl',
      1 => 1661918505,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6354813e660d02_15576136 (Smarty_Internal_Template $_smarty_tpl) {
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
			cargo = document.formu.cargo.value;
			if (document.formu.cargo.value == "") {
				alert("Por favor Seleccione el cargo");
				document.formu.cargo.focus();
				return;
			}
			ventanaCalendario = window.open("rpt_trabajadores_cargos1.php?cargo=" + cargo, "calendario", "width=600, height=550, left=100, top=100,scrollbars=yes,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
		}
	<?php echo '</script'; ?>
>
</literal>
</head>
<body>
<div class="formu_ingreso_datos">
	<h2>RPT TRABAJADORES POR CARGO</h2>
	<form method="post" name="formu">
		<p>
			<p>*Seleccione cargo</p>
			<select name="cargo">
				<option value="">--Seleccione--</option>
				<option value="T"> TODOS </option>
				<option value="S"> SECRETARIA </option>
				<option value="A"> AYUDANTE</option>
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

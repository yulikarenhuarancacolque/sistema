<?php
/* Smarty version 3.1.36, created on 2022-09-30 01:59:05
  from 'C:\wamp64\www\sis_panaderia\privada\clientes\templates\clientes_nuevo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63364d69212361_16845090',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9442676ead9917c9b7085077022440d122497147' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_panaderia\\privada\\clientes\\templates\\clientes_nuevo.tpl',
      1 => 1664503135,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63364d69212361_16845090 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
"type="text/css">
	<?php echo '<script'; ?>
 type="text/javascript" src="../js/expresiones_regulares.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 type="text/javascript" src="js/validar_clientes.js"><?php echo '</script'; ?>
>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="clientes_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR CLIENTES</h2>
			
			
			<p>
			<input type="text" name="nombres" size="15" placeholder="Nombres" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="apellidos" size="15" placeholder="Apellidos" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
             <p>
			<input type="text" name="direccion" size="15" placeholder="Direccion">
			</p>

			<p>
			<input type="text" name="telefono" size="15" placeholder="Telefono" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='clientes.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html><?php }
}

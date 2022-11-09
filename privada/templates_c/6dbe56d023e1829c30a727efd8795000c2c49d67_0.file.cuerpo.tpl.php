<?php
/* Smarty version 3.1.36, created on 2022-09-30 01:45:52
  from 'C:\wamp64\www\sis_panaderia\privada\templates\cuerpo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63364a50692d62_42708840',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6dbe56d023e1829c30a727efd8795000c2c49d67' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_panaderia\\privada\\templates\\cuerpo.tpl',
      1 => 1652402825,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63364a50692d62_42708840 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css" >
</head>
<body>
	<form action="claves/" method="post" target="cuerpo">
		<?php if ($_smarty_tpl->tpl_vars['nick']->value == '') {?>
		<div class="formu_ingreso">
			<p><h2>INGRESAR AL SISTEMA</h2></p>
			<p><h2>Login:</h2><input type="text" name="nick" size="12" value="" class="limpiar"></p>
			<p><h2>Clave:</h2><input type="password" name="password" size="11" value="" ></p>
			<input type="submit" name="accion" value="Ingresar" size="5" class="boton">
		</div>
		<?php }?>
	</form>
</body>
</html>

<?php }
}

<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:23:39
  from 'C:\wamp64\www\www\sis_panaderia\privada\templates\cuerpo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63547b7b249919_66807755',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd31926e48abb4950195eab65da4461158e50a1ab' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\templates\\cuerpo.tpl',
      1 => 1652402825,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63547b7b249919_66807755 (Smarty_Internal_Template $_smarty_tpl) {
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

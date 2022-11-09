<?php
/* Smarty version 3.1.36, created on 2022-09-30 01:45:52
  from 'C:\wamp64\www\sis_panaderia\privada\templates\menu_sup.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63364a5054b009_36768338',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'de9c91473b0d3c9bd80f11a101d0c8ac614f17c9' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_panaderia\\privada\\templates\\menu_sup.tpl',
      1 => 1659834843,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63364a5054b009_36768338 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>

	<title>PANADERIA "SAN ANDRES"</title>
	<meta http-equiv="content_type" content="text/html; charset=utf-8"/>

	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css" >
</head>
<body>
	

	<div class="cabecera">
		<img src="panaderia/logos/<?php echo $_smarty_tpl->tpl_vars['logo']->value;?>
" width="10%">
		<div class="titulo">
			PANADERIA "<?php echo $_smarty_tpl->tpl_vars['nombre']->value;?>
"
		</div>
		<div class="usuario">
			Usuario:<b><?php echo $_smarty_tpl->tpl_vars['sesion']->value['usuario'];?>
</b>
				Rol:<b><?php echo $_smarty_tpl->tpl_vars['sesion']->value['rol'];?>
</b>
		</div>
	</div>
</body>
</html>

<?php }
}

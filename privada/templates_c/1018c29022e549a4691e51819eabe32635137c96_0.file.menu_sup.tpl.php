<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:23:39
  from 'C:\wamp64\www\www\sis_panaderia\privada\templates\menu_sup.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63547b7b180985_46414371',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1018c29022e549a4691e51819eabe32635137c96' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\templates\\menu_sup.tpl',
      1 => 1659834843,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63547b7b180985_46414371 (Smarty_Internal_Template $_smarty_tpl) {
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

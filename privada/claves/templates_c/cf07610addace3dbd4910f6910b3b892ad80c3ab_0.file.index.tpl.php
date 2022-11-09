<?php
/* Smarty version 3.1.36, created on 2022-09-30 01:51:16
  from 'C:\wamp64\www\sis_panaderia\privada\claves\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63364b94a10129_56616843',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cf07610addace3dbd4910f6910b3b892ad80c3ab' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_panaderia\\privada\\claves\\templates\\index.tpl',
      1 => 1649816368,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63364b94a10129_56616843 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
	<?php echo '<script'; ?>
 type="text/javascript">
		function refrescar (){
			var p=window.parent;
			p.location.href='../';
		}
	<?php echo '</script'; ?>
>
</head>
<body ONLOAD="self.setTimeout('refrescar()',50000);"> 
	<center>
		<h1><?php echo $_smarty_tpl->tpl_vars['mensage']->value;?>
</h1>
		<h3 style="color:red;"><?php echo $_smarty_tpl->tpl_vars['nom_completo']->value;?>
</h3>
		<h1><?php echo $_smarty_tpl->tpl_vars['mensage1']->value;?>
</h1>
	</center>
</body>
</html><?php }
}

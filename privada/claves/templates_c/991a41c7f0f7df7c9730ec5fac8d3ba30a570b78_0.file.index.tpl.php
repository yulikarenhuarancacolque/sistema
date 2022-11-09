<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:23:56
  from 'C:\wamp64\www\www\sis_panaderia\privada\claves\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63547b8cb4fce1_57870961',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '991a41c7f0f7df7c9730ec5fac8d3ba30a570b78' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\claves\\templates\\index.tpl',
      1 => 1649816368,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63547b8cb4fce1_57870961 (Smarty_Internal_Template $_smarty_tpl) {
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

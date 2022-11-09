<?php
/* Smarty version 3.1.36, created on 2022-10-23 02:29:34
  from 'C:\wamp64\www\www\sis_panaderia\privada\personas\templates\personas.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6354a70e2fc398_75694500',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7c78d84ddc1ceecb0cc1e692ce6b41a424992c9b' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\personas\\templates\\personas.tpl',
      1 => 1660258318,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6354a70e2fc398_75694500 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<?php echo '<script'; ?>
 type="text/javascript" src="../../ajax.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 type="text/javascript" src="js/buscar_personas.js"><?php echo '</script'; ?>
>
</head>
<body>
	<div  class="titulo_listado">
         <h1>
			PERSONAS
		</h1>
	</div>
	<div class="titulo_nuevo">
		<form name="formNuevo" method="post" action="persona_nuevo.php">
			<a href="javascript:document.formNuevo.submit();">
				Nuevo>>>
			</a>
		</form>
	</div>
     <center>
     	<form action="#" method="post" name="formu">
     		<table border="1" class="listado">
     			<tr>
     				<th>
     					<b>Paterno</b>
     					<input type="text" name="ap" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     				<th>
     					<b>Materno</b>
     					<input type="text" name="am" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     				<th>
     					<b>Nombre</b>
     					<input type="text" name="nombres" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     				<th>
     					<b>C. I.</b>
     					<input type="text" name="ci" value="" size="10" onkeyup="buscar_personas()">
     				</th>
     			</tr>
     		</table>
     	</form>
     </center>
<br><br>
	<center>
		<div id="personas1">
		<table class="listado">
			<tr>
				<th>NRO</th><th>CI</th><th>NOMBRES</th><th>AP</th><th>AM</th>
				<th><img src="../../imagenes/modificar.png"></th><th><img src="../../imagenes/borrar.png"></th>
			</tr>
			<?php $_smarty_tpl->_assignInScope('b', "0");?>
			<?php $_smarty_tpl->_assignInScope('total', ((string)($_smarty_tpl->tpl_vars['pagina']->value-1)));?>
			<?php $_smarty_tpl->_assignInScope('a', ((string)($_smarty_tpl->tpl_vars['numreg']->value*$_smarty_tpl->tpl_vars['total']->value)));?>
			<?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1+$_smarty_tpl->tpl_vars['a']->value)));?>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['personas']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
			<tr>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['b']->value;?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['ci'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
</td>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['ap'];?>
</td>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['am'];?>
</td>
				<td align="center">
			<form name="formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
" method="post" action="persona_modificar.php">
				<input type="hidden" name="id_persona" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
">
				<a href="javascript:document.formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
.submit();" title="Modificar Persona Sistema">
					Modificar>>
				</a>
			</form>
		</td>
		<td align="center">
			<form name="formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
" method="post" action="persona_eliminar.php">
				<input type="hidden" name="id_persona" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
">
				<a href="javascript:document.formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
.submit();" title="Eliminar Persona Sistema" onclick="javascript:return(confirm('Desea realmente Eliminar a la Persona <?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
 <?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
 <?php echo $_smarty_tpl->tpl_vars['r']->value['ap'];?>
 ?')); location.href='persona_eliminar.php'">
					Eliminar>>
				</a>
			</form>
		</td>
		<?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1)));?>
		<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</tr>
		</table>

		<!--PAGINACION----------------------------->
		<table>
			<tr align="center">
				<td>
					<?php if (!empty($_smarty_tpl->tpl_vars['urlback']->value)) {?>
					<a onclick="location.href='<?php echo $_smarty_tpl->tpl_vars['urlback']->value;?>
'" style="font-family: Verdana;font-size: 9px;cursor:pointer"; >&laquo;Anterior</a>
					<?php }?>
					 <?php if (!empty($_smarty_tpl->tpl_vars['paginas']->value)) {?>
					  <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['paginas']->value, 'pag');
$_smarty_tpl->tpl_vars['pag']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['pag']->value) {
$_smarty_tpl->tpl_vars['pag']->do_else = false;
?>
					   <?php if ($_smarty_tpl->tpl_vars['pag']->value['npag'] == $_smarty_tpl->tpl_vars['pagina']->value) {?>
					   	<?php if ($_smarty_tpl->tpl_vars['pagina']->value != '1') {?>|<?php }?> <b style="color:#FB992F;font-size: 12PX;"><?php echo $_smarty_tpl->tpl_vars['pag']->value['npag'];?>
</b>
					   	<?php } else { ?>
					| <a onclick="location.href='<?php echo $_smarty_tpl->tpl_vars['pag']->value['pagV'];?>
'" style="cursor: pointer;"> <?php echo $_smarty_tpl->tpl_vars['pag']->value['npag'];?>
</a>
					<?php }?>
					<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					<?php }?>
					<?php if ($_smarty_tpl->tpl_vars['numpaginas']->value > $_smarty_tpl->tpl_vars['numbotones']->value && !empty($_smarty_tpl->tpl_vars['urlnext']->value) && $_smarty_tpl->tpl_vars['pagina']->value < $_smarty_tpl->tpl_vars['numpaginas']->value) {?>
					| <a onclick="location.href='<?php echo $_smarty_tpl->tpl_vars['urlnext']->value;?>
'" style="font-family: Verdana;font-size: 9px;cursor:pointer">Siguiente&raquo;</a>
					<?php }?>	
				</td>
			</tr>
		</table>
	</center>
</body>
</html><?php }
}

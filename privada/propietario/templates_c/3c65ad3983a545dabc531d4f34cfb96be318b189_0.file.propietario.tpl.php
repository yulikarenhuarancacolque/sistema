<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:49:04
  from 'C:\wamp64\www\www\sis_panaderia\privada\propietario\templates\propietario.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63548170edc9e9_82501386',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3c65ad3983a545dabc531d4f34cfb96be318b189' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\propietario\\templates\\propietario.tpl',
      1 => 1652404548,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63548170edc9e9_82501386 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset-utf-8"/>
</head>
<body>
  <div class="titulo_listado">
  	<h1>
  		PROPIETARIO
  	</h1>
  </div>
  <div class="titulo_nuevo">
  <form name="formNuevo" method="post" action="propietario_nuevo.php">
 <a href="javascript:document.formNuevo.submit();">
 	Nuevo>>>
 </a> 
  </form>
  </div>
  <center>
  	<table class="listado">
  		<tr>
        <th>NRO</th><th>DIRECCION</th><th>NOMBRES</th><th>APELLIDOS</th><th>CELULAR</th>
        <th><img src="../../imagenes/modificar.png"width="40%"></th><th><img src="../../imagenes/borrar.png"width="60%"></th>
  		</tr>
       <?php $_smarty_tpl->_assignInScope('b', "0");?>
       <?php $_smarty_tpl->_assignInScope('total', ((string)($_smarty_tpl->tpl_vars['pagina']->value-1)));?>
       <?php $_smarty_tpl->_assignInScope('a', ((string)($_smarty_tpl->tpl_vars['numreg']->value*$_smarty_tpl->tpl_vars['total']->value)));?>
       <?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1+$_smarty_tpl->tpl_vars['a']->value)));?>
       <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['propietario']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
   <tr>
   	<td align= "center"><?php echo $_smarty_tpl->tpl_vars['b']->value;?>
</td>
   	<td><?php echo $_smarty_tpl->tpl_vars['r']->value['direccion'];?>
</td>
    <td><?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
</td>
    <td align= "center"><?php echo $_smarty_tpl->tpl_vars['r']->value['apellidos'];?>
</td>
    <td align= "center"><?php echo $_smarty_tpl->tpl_vars['r']->value['celular'];?>
</td>
    <td align= "center">
    <form name="formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_propietario'];?>
" method="post" action="propietario_modificar.php">
    <input type="hidden" name="id_propietario" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_propietario'];?>
">
    <a href="javascript:document.formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_propietario'];?>
.submit();" title="Modificar Propietario Sistema">
    Modificar>>
    </a>
    </form>	
    </td>
    <td align="center">
    <form name="formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_propietario'];?>
" method="post" action="propietario_eliminar.php">
    <input type="hidden" name="id_propietario" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_propietario'];?>
">	
    <a href="javascript:document.formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_propietario'];?>
.submit();" title="Eliminar Propietario Sistema" onclick="javascript:return(confirm(' Desea realmente Eliminar a la propietario..?')); location.href='propietario_eliminar.php'" >
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

 <!--PAGINACION----------------------------------->
 <table>
        <tr align="center">
          <td>
            <?php if (!empty($_smarty_tpl->tpl_vars['urlback']->value)) {?>
              <a onclick="location.href='<?php echo $_smarty_tpl->tpl_vars['urlback']->value;?>
'" style="font-family: Verdana;font-size: 9px;cursor:pointer"; >&laquo;
              Anterior</a>
            <?php }?>
            <?php if (!empty($_smarty_tpl->tpl_vars['paginas']->value)) {?>
              <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['paginas']->value, 'pag');
$_smarty_tpl->tpl_vars['pag']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['pag']->value) {
$_smarty_tpl->tpl_vars['pag']->do_else = false;
?>
                <?php if ($_smarty_tpl->tpl_vars['pag']->value['npag'] == $_smarty_tpl->tpl_vars['pagina']->value) {?>
                   <?php if ($_smarty_tpl->tpl_vars['pagina']->value != '1') {?>|<?php }?> <b style="color:#FB992F;font-size: 12px;"> <?php echo $_smarty_tpl->tpl_vars['pag']->value['npag'];?>
</b>
                <?php } else { ?>
| <a onclick="location.href ='<?php echo $_smarty_tpl->tpl_vars['pag']->value['pagV'];?>
'" style="cursor:pointer;"><?php echo $_smarty_tpl->tpl_vars['pag']->value['npag'];?>
 </a>
                <?php }?>
              <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
            <?php }?>
            <?php if ($_smarty_tpl->tpl_vars['numpaginas']->value > $_smarty_tpl->tpl_vars['numbotones']->value && !empty($_smarty_tpl->tpl_vars['urlnext']->value) && $_smarty_tpl->tpl_vars['pagina']->value < $_smarty_tpl->tpl_vars['numpaginas']->value) {?>
             | <a onclick="location.href='<?php echo $_smarty_tpl->tpl_vars['urlnext']->value;?>
'" style="font-family: Verdana;font-size: 9px;cursor:pointer">
             Siguiente&raquo;</a>
            <?php }?>
          </td>
        </tr>      
      </table>
  </center>
</body>
</html>

<?php }
}

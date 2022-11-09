<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:49:22
  from 'C:\wamp64\www\www\sis_panaderia\privada\proveedores_material\templates\proveedores_material.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63548182574f42_32996246',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4cb715179f08ccf6a177aca764c18d5620f68a4a' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\proveedores_material\\templates\\proveedores_material.tpl',
      1 => 1652404548,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63548182574f42_32996246 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
  </head>
  <body>
    <div class="titulo_listado">
      <h1>
        PROVEEDORES_MATERIAL
      </h1>
    </div>
    <div class="titulo_nuevo">
      <form name="formNuevo" method="post" action="proveedores_material_nuevo.php">
        <a href="javascript:document.formNuevo.submit();">
          Nuevo>>>
        </a>    
      </form>
    </div>
  <center>
    <table class="listado">
      <tr>
        <th>NRO</th><th>DIRECCION</th><th>NOMBRES</th><th>APELLIDOS</th><th>CELULAR</th>
        <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
      </tr>
        <?php $_smarty_tpl->_assignInScope('b', "0");?>
        <?php $_smarty_tpl->_assignInScope('total', ((string)($_smarty_tpl->tpl_vars['pagina']->value-1)));?> 
        <?php $_smarty_tpl->_assignInScope('a', ((string)($_smarty_tpl->tpl_vars['numreg']->value*$_smarty_tpl->tpl_vars['total']->value)));?>
        <?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1+$_smarty_tpl->tpl_vars['a']->value)));?>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['proveedores_material']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
      <tr>
        <td align="center"><?php echo $_smarty_tpl->tpl_vars['b']->value;?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['r']->value['direccion'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['r']->value['apellidos'];?>
</td>
        <td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['celular'];?>
</td>    
        <td align="center">
          <form name="formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_proveedor'];?>
" method="post" action="proveedores_material_modificar.php">
            <input type="hidden" name="id_proveedor" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_proveedor'];?>
">
            <a href="javascript:document.formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_proveedor'];?>
.submit();" title="Modificar proveedores_material Sistema">
              Modificar>>>              
            </a>            
          </form>
        </td>
        <td align="center">
          <form name="formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_proveedor'];?>
 " method="post" action="proveedores_material_eliminar.php">
            <input type="hidden" name="id_proveedor" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_proveedor'];?>
">
            <a href="javascript:document.formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_proveedor'];?>
.submit();" title="Eliminar proveedores_material Sistema" onclick="javascript:return(confirm ('Desea realmente eliminar al proveedores_material..?')); location.href='proveedores_material_eliminar.php'">
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
    </center>
  </body>
</html><?php }
}

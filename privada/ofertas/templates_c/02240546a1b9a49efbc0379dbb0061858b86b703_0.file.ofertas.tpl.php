<?php
/* Smarty version 3.1.36, created on 2022-10-22 23:49:13
  from 'C:\wamp64\www\www\sis_panaderia\privada\ofertas\templates\ofertas.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63548179a38bd7_31953981',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '02240546a1b9a49efbc0379dbb0061858b86b703' => 
    array (
      0 => 'C:\\wamp64\\www\\www\\sis_panaderia\\privada\\ofertas\\templates\\ofertas.tpl',
      1 => 1652404548,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63548179a38bd7_31953981 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">

  </head>
  <body>
    <table width="100%" border="0">
      <tr>
        <td width="33%">
          <table border="0">
            <tr>
            </tr>            
          </table>
        </td>
        <td align="center" width="33%">
          <h1>OFERTAS</h1>          
        </td>
        <td align="right" width="33%">
          <form name="formNuevo" method="post" action="ofertas_nuevo.php">
            <a href="javascript:document.formNuevo.submit();">
              Nuevo>>>
            </a>            
          </form>          
        </td>
      </tr>      
    </table>

    <center>
      <table class="listado">
        <tr>
          <th>NRO</th><th>DESCRIPCION</th><th>OFERTAS</th><th>PRODUCTO</th>
         <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
        </tr>
        <?php $_smarty_tpl->_assignInScope('b', "1");?>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['ofertas']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
        <tr>
          <td align="center"> <?php echo $_smarty_tpl->tpl_vars['b']->value;?>
 </td>
          <td> <?php echo $_smarty_tpl->tpl_vars['r']->value['descripcion'];?>
 </td>
          <td> <?php echo $_smarty_tpl->tpl_vars['r']->value['ofertas'];?>
 </td>
            <td> <?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
 <?php echo $_smarty_tpl->tpl_vars['r']->value['descripcion_producto'];?>
</td>
          <td align="center">
            <form name="formModif <?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
" method="post" action="ofertas_modificar.php">
              <input type="hidden" name="id_ofertas" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
">
              <input type="hidden" name="id_ofertas" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
">
              <a href="javascript:document.formModif <?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
.submit(); " title="Modificar ofertas">
                Modificar>>
              </a>
            </form>
          </td>
          <td align="center">
            <form name="formElimi <?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
" method="post" action="ofertas_eliminar.php">
              <input type="hidden" name="id_ofertas" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
">
              <a href="javascript:document.formElimi <?php echo $_smarty_tpl->tpl_vars['r']->value['id_ofertas'];?>
.submit(); " title="Eliminar ofertas" onclick='javascript: return(confirm("Desea realmente Eliminar a la ofertas ::: <?php echo $_smarty_tpl->tpl_vars['r']->value['ofertas'];?>
?"));'>
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

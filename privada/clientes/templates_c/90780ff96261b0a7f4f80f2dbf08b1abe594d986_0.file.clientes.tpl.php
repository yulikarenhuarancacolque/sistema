<?php
/* Smarty version 3.1.36, created on 2022-09-30 01:54:18
  from 'C:\wamp64\www\sis_panaderia\privada\clientes\templates\clientes.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_63364c4aad7024_32959690',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '90780ff96261b0a7f4f80f2dbf08b1abe594d986' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_panaderia\\privada\\clientes\\templates\\clientes.tpl',
      1 => 1664502848,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63364c4aad7024_32959690 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
  <?php echo '<script'; ?>
 type="text/javascript" src="../../ajax.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="js/buscar_clientes.js"><?php echo '</script'; ?>
>

  </head>
  <body>
    <div class="titulo_listado">
      <h1>
        CLIENTES
      </h1>
    </div>
    <div class="titulo_nuevo">
      <form name="formNuevo" method="post" action="clientes_nuevo.php">
        <a href="javascript:document.formNuevo.submit();">
          Nuevo>>>
        </a>    
      </form>
    </div>
    <!----------INICIO BUSCADOR------------>
  <center>
   <form action="" method="post" name="formu">
    <table border="1" class="listado">
    <tr>
   <th>
       <b>Direccion</b><br/>
       <input type="text" name="direccion" value="" size="10" onkeyup="buscar_clientes()">
      </th>
<th>
       <b>Nombres</b><br/>
       <input type="text" name="nombres" value="" size="10" onkeyup="buscar_clientes()">
      </th>
      <th>
<b>Apellidos</b><br/>
       <input type="text" name="apellidos" value="" size="10" onkeyup="buscar_clientes()">
      </th>
    
    </tr>
    </table>
   </form>
  </center>
 <!----------FIN BUSCADOR------------>
 <br><br>
  <center>
    <div id="clientes1">
    <table class="listado">
      <tr>
        <th>NRO</th><th>DIRECCION</th><th>NOMBRES</th><th>APELLIDOS</th><th>TELEFONO</th>
        <th><img src="../../imagenes/modificar.png" width="40%"></th><th><img src="../../imagenes/borrar.png" width="60%"></th>
      </tr>
        <?php $_smarty_tpl->_assignInScope('b', "0");?>
        <?php $_smarty_tpl->_assignInScope('total', ((string)($_smarty_tpl->tpl_vars['pagina']->value-1)));?> 
        <?php $_smarty_tpl->_assignInScope('a', ((string)($_smarty_tpl->tpl_vars['numreg']->value*$_smarty_tpl->tpl_vars['total']->value)));?>
        <?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1+$_smarty_tpl->tpl_vars['a']->value)));?>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['clientes']->value, 'r');
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
        <td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['telefono'];?>
</td>    
        
        <td align="center">
          <form name="formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_cliente'];?>
" method="post" action="clientes_modificar.php">
            <input type="hidden" name="id_cliente" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_cliente'];?>
">
            <a href="javascript:document.formModif<?php echo $_smarty_tpl->tpl_vars['r']->value['id_cliente'];?>
.submit();" title="Modificar cliente Sistema">
              Modificar>>>              
            </a>            
          </form>
        </td>
<td align="center">
    <form name="formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_cliente'];?>
" method="post" action="clientes_eliminar.php">
    <input type="hidden" name="id_cliente" value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_cliente'];?>
"> 
    <a href="javascript:document.formElimi<?php echo $_smarty_tpl->tpl_vars['r']->value['id_cliente'];?>
.submit();" title="Eliminar clientes Sistema" onclick="javascript:return(confirm(' Desea realmente Eliminar a la clientes..?')); location.href='clientes_eliminar.php'" >
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

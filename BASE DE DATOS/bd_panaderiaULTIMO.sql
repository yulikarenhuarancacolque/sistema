-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-08-2022 a las 01:50:49
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_panaderia`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `listado_descuento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_descuento` (IN `mont_min` FLOAT, IN `monto_max` FLOAT)  BEGIN

   SELECT *
   FROM pedidos
   WHERE descuento BETWEEN mont_min AND monto_max
   AND estado='1';

  END$$

DROP PROCEDURE IF EXISTS `listado_descuento_pedidos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_descuento_pedidos` (IN `f_inicio` DATE, IN `f_fin` DATE)  BEGIN

   SELECT *
   FROM pedidos
   WHERE descuento BETWEEN f_inicio AND f_fin
   AND estado='1';

  END$$

DROP PROCEDURE IF EXISTS `listado_modificacion_pedidos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_modificacion_pedidos` (IN `f_inicio` DATE, IN `f_fin` DATE)  BEGIN

   SELECT *
   FROM pedidos
   WHERE fec_modificacion BETWEEN f_inicio AND f_fin
   AND estado='1';

  END$$

DROP PROCEDURE IF EXISTS `listado_personas_fechas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_personas_fechas` (IN `f_inicio` DATE, IN `f_fin` DATE)  BEGIN

   SELECT *
   FROM personas
   WHERE fec_insercion BETWEEN f_inicio AND f_fin
   AND estado='1';

  END$$

DROP PROCEDURE IF EXISTS `listado_trabajadores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_trabajadores` (IN `fecha_inicio` DATE, IN `fecha_final` DATE)  BEGIN

   SELECT *
   FROM trabajadores
   WHERE fecha_inicio BETWEEN fecha_inicio AND fecha_final
   AND estado='1';

  END$$

DROP PROCEDURE IF EXISTS `trabajadores_cargos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `trabajadores_cargos` (IN `usuario` INT)  BEGIN

   SELECT tra.nombres,tra.apellidos,tra.celular,ca.cargo
   FROM trabajadores tra, cargos ca
   WHERE tra.id_trabajador = ca.id_trabajador
   AND tra.estado ='1';

  END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `contar_registros`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_registros` () RETURNS INT(11) BEGIN
      DECLARE resultado INT;

      SELECT COUNT(cli.id_cliente) INTO resultado
      FROM clientes cli
      INNER JOIN ventas ve ON cli.id_cliente=ven.id_cliente
      INNER JOIN pedidos pe ON pe.id_cliente=pe.id_cliente
       WHERE cli.estado=1;

      RETURN resultado;

    END$$

DROP FUNCTION IF EXISTS `contar_registros_clientes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_registros_clientes` () RETURNS INT(11) BEGIN
      DECLARE resultado INT;

      SELECT COUNT(cli.id_cliente) INTO resultado
      FROM clientes cli
      INNER JOIN ventas ve ON cli.id_cliente=ve.id_cliente
      INNER JOIN pedidos pe ON pe.id_cliente=pe.id_cliente
       WHERE cli.estado=1;

      RETURN resultado;

    END$$

DROP FUNCTION IF EXISTS `contar_ventas`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_ventas` () RETURNS INT(11) BEGIN
      DECLARE resultado INT;

      SELECT AVG(id_venta) INTO resultado
      FROM ventas
       WHERE estado='1';

      RETURN resultado;

    END$$

DROP FUNCTION IF EXISTS `promedio_ventas`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `promedio_ventas` () RETURNS FLOAT BEGIN
      DECLARE resultado FLOAT;

      SELECT AVG(monto_venta) INTO resultado
      FROM ventas
       WHERE estado='1';

      RETURN resultado;

    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

DROP TABLE IF EXISTS `accesos`;
CREATE TABLE IF NOT EXISTS `accesos` (
  `id_acceso` int(11) NOT NULL AUTO_INCREMENT,
  `id_opcion` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_acceso`),
  KEY `id_rol` (`id_rol`),
  KEY `id_opcion` (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id_acceso`, `id_opcion`, `id_rol`, `fec_insercion`, `fec_modif`, `usuario`, `estado`) VALUES
(1, 1, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(2, 2, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(3, 3, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(4, 4, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(5, 5, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(6, 6, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(7, 7, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(8, 8, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(9, 9, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(10, 10, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(11, 11, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(12, 12, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(13, 13, 1, '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(14, 14, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(15, 15, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(16, 16, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(17, 17, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(18, 18, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(19, 19, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(20, 20, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(21, 21, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1'),
(22, 22, 1, '2022-07-07 22:32:39', '2022-07-07 22:32:39', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NOT NULL,
  `cargo` varchar(25) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  KEY `id_trabajador` (`id_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `id_trabajador`, `cargo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'ADMINISTRADOR', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(2, 2, 'SECRETARIA', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(3, 3, 'AYUDANTE', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(4, 4, 'AYUDANTE', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(5, 5, 'AYUDANTE', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(6, 6, 'ADMINISTRADOR', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(7, 7, 'SECRETARIA', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(8, 8, 'AYUDANTE', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(9, 9, 'AYUDANTE', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(10, 10, 'AYUDANTEEEE', '2022-07-08 04:11:33', '2022-07-08 00:11:33', 1, '1'),
(11, 8, 'VENDEDORA', '2022-07-08 04:10:48', '2022-07-08 00:11:25', 1, '0'),
(12, 8, 'SEGURIDADDD', '2022-07-08 04:24:52', '2022-07-08 00:24:58', 1, '0'),
(13, 10, 'ADMIN', '2022-07-08 04:25:15', '2022-07-08 00:25:15', 1, '1'),
(14, 8, 'ADMIN', '2022-08-24 04:44:10', '2022-08-24 00:44:10', 1, '1'),
(15, 8, 'EJECUTORA', '2022-08-24 05:39:19', '2022-08-24 01:39:19', 1, '1'),
(16, 8, 'ADMIN', '2022-08-24 05:47:01', '2022-08-24 01:47:01', 1, '1');

--
-- Disparadores `cargos`
--
DROP TRIGGER IF EXISTS `insertar_registro_cargos`;
DELIMITER $$
CREATE TRIGGER `insertar_registro_cargos` BEFORE INSERT ON `cargos` FOR EACH ROW BEGIN
    INSERT INTO registro_cargos(descripcion, fec_modificacion, usuario)VALUES
    ("INSERT-CARGOS", NEW.fec_modificacion, NEW.usuario);

  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_panaderia` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_panaderia` (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_panaderia`, `direccion`, `nombres`, `apellidos`, `celular`, `nit`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'aAV,MONTES ', 'JUAN', 'RUEDA', '79775756', '123432', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(2, 2, 'AV. LA PAZ', 'PEDRO', 'INCA', '68345634', '324324', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(3, 3, 'SAN MARTIN ', 'ELIANA', 'FLORES', '69123784', '3455', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(4, 4, 'JUAN  ', 'DANIELA', 'POMA', '61234232', '434343', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(5, 5, 'SAN BERNARDO', 'JUANA', 'DUARTE', '6448365', '', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(6, 6, '15 DE ABRIL', 'MARCOS', 'MARTINEZ', '61948573', '', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(7, 7, 'PEDRO ANTONIO', 'RAMIRO', 'JURADO', '63246384', '', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(8, 8, '2 DE MAYO ', 'KAREN', 'VALDEZ', '72342397', '3244432', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(9, 9, 'LOURDES ', 'JHONYY', 'CAMACHO', '75372645', '5665443', '2022-07-07 22:32:29', '2022-08-12 00:45:21', 1, '1'),
(10, 10, 'ZAMORA', 'LUNA', 'MAMANI', '72746253', '4325543', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedidos`
--

DROP TABLE IF EXISTS `detalles_pedidos`;
CREATE TABLE IF NOT EXISTS `detalles_pedidos` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles_pedidos`
--

INSERT INTO `detalles_pedidos` (`id_detalle_pedido`, `id_pedido`, `cantidad`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 10, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(2, 2, 20, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(3, 3, 30, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(4, 4, 40, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(5, 5, 50, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(6, 6, 30, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(7, 7, 20, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(8, 8, 100, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(9, 9, 50, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(10, 10, 20, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--

DROP TABLE IF EXISTS `detalles_ventas`;
CREATE TABLE IF NOT EXISTS `detalles_ventas` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `id_venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles_ventas`
--

INSERT INTO `detalles_ventas` (`id_detalle_venta`, `id_venta`, `cantidad`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 10, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(2, 2, 5, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(3, 3, 100, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(4, 4, 7, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(5, 5, 5, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(6, 6, 10, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(7, 7, 60, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(8, 8, 40, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(9, 9, 100, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(10, 10, 10, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(14) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id_grupo`, `grupo`, `fec_insercion`, `fec_modif`, `usuario`, `estado`) VALUES
(1, 'HERRAMIENTAS', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(2, 'PARAMENTRO', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(3, 'PANADERIA', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(4, 'REPORTES', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
CREATE TABLE IF NOT EXISTS `ofertas` (
  `id_ofertas` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `ofertas` varchar(30) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_ofertas`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`id_ofertas`, `id_producto`, `descripcion`, `ofertas`, `fecha_inicio`, `fecha_final`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '2x1', 'oferta dia padre', '2022-03-31', '2022-04-30', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(2, 1, '2x3', 'oferta', '2022-03-01', '2022-04-24', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(3, 1, '', 'oferta del dia', '2022-03-11', '2022-04-26', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(4, 1, '2x3', 'oferta mes', '2022-03-13', '2022-04-23', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(5, 1, '2x1', 'oferta dia madre', '2022-03-15', '2022-04-28', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(6, 1, '2x1', 'oferta padre', '2022-03-17', '2022-04-16', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(7, 1, '3x2', 'oferta', '2022-03-18', '2022-04-18', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(8, 1, '', 'oferta', '2022-03-22', '2022-04-22', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(9, 1, '2x1', 'oferta dia madre', '2022-03-26', '2022-04-18', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(10, 1, '2x1', 'oferta', '2022-03-23', '2022-04-29', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

DROP TABLE IF EXISTS `opciones`;
CREATE TABLE IF NOT EXISTS `opciones` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `opcion` varchar(100) DEFAULT NULL,
  `contenido` varchar(100) DEFAULT NULL,
  `orden` varchar(100) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `id_grupo`, `opcion`, `contenido`, `orden`, `fec_insercion`, `fec_modif`, `usuario`, `estado`) VALUES
(1, 1, 'PERSONAS', '../privada/personas/personas.php', '10', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(2, 1, 'USUARIOS', '../privada/usuarios/usuarios.php', '20', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(3, 1, 'GRUPOS', '../privada/grupos/grupos.php', '30', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(4, 1, 'ROLES', '../privada/roles/roles.php', '40', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(5, 1, 'USUARIOS ', '../privada/usuarios_roles/usuarios_roles.php', '50', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(6, 1, 'OPCIONES', '../privada/opciones/opciones.php', '60', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(7, 1, 'ACCESOS', '../privada/accesos/accesos.php', '70', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(8, 2, 'PRODUCTO', '../privada/producto/producto.php', '10', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(9, 2, 'OFERTAS', '../privada/ofertas/ofertas.php', '20', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(10, 2, 'PRODUCTO_PRECIO', '../privada/producto_precio/producto_precio.php', '30', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(11, 2, ' PROPIETARIO', '../privada/propietario/propietario.php', '40', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(12, 2, ' PROVEEDORES_MATERIAL', '../privada/proveedores_material/proveedores_material.php', '50', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(13, 2, 'CLIENTES', '../privada/clientes/clientes.php', '60', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(14, 3, 'PANADERIA', '../privada/panaderia/panaderia.php', '10', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(15, 3, 'VENTAS', '../privada/ventas/ventas.php', '20', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(16, 3, 'PEDIDOS', '../privada/pedidos/pedidos.php', '30', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(17, 3, 'TRABAJADORES', '../privada/trabajadores/trabajadores.php', '40', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(18, 3, 'CARGOS', '../privada/cargos/cargos.php', '50', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(19, 4, 'PERSONAS_USUARIOS', '../privada/reportes/personas_usuarios.php', '10', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(20, 4, 'REPORTES DE PERSONAS CON FECHAS DE INSERCION', '../privada/reportes/personas_fechas.php', '20', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(21, 4, 'TRABAJADORES_CARGOS', '../privada/reportes/trabajadores_cargos.php', '30', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1'),
(22, 4, 'REPORTES DE TRABJADORES CON FECHAS DE INSERCION', '../privada/reportes/trabajadores_fechas.php', '40', '2022-07-07 22:32:38', '2022-07-07 22:32:38', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `panaderia`
--

DROP TABLE IF EXISTS `panaderia`;
CREATE TABLE IF NOT EXISTS `panaderia` (
  `id_panaderia` int(11) NOT NULL AUTO_INCREMENT,
  `nit_panaderia` varchar(20) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `pagina_web` varchar(25) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `panaderia`
--

INSERT INTO `panaderia` (`id_panaderia`, `nit_panaderia`, `direccion`, `nombre`, `telefono`, `logo`, `pagina_web`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, '12121', 'av. la paz', 'R Y K', '67392352', 'Captura de pantalla (830).png', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-08-07 01:16:19', 1, '1'),
(2, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(3, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(4, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(5, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(6, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(7, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(8, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(9, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:28', '2022-07-07 22:32:28', 1, '1'),
(10, '12121', 'av. la paz', 'SAN ANDRES', '67392352', 'logofinal.jpg', 'Pana80@.com.bo', '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `direccion_envio` varchar(25) NOT NULL,
  `descuento` float DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `monto_pedido` float NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `direccion_envio`, `descuento`, `fecha_pedido`, `monto_pedido`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'JUAN PEPE', 5, '2022-11-03', 23, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(2, 2, 'JUAN PABLO', 10, '2022-11-02', 11, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(3, 3, 'AVAROA', 12, '2022-11-04', 13, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(4, 4, 'MEJILLONES', 13, '2022-11-05', 24, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(5, 5, 'LOURDES', 14, '2022-11-06', 25, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(6, 6, 'AMERICA', 15, '2022-11-07', 27, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(7, 7, 'FROILAN', 16, '2022-11-08', 28, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(8, 8, 'CAMPESINO', 17, '2022-10-09', 29, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(9, 9, 'JUAN 23', 18, '2022-08-10', 18, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(10, 10, 'COLON', 21, '2022-12-13', 17, '2022-07-07 22:32:29', '2022-07-07 22:32:29', 1, '1'),
(11, 10, 'RICARDO', 20, '2022-08-02', 1000, '2022-08-03 06:01:59', '2022-08-03 02:01:59', 1, '1');

--
-- Disparadores `pedidos`
--
DROP TRIGGER IF EXISTS `insertar_registro_pedidos`;
DELIMITER $$
CREATE TRIGGER `insertar_registro_pedidos` BEFORE INSERT ON `pedidos` FOR EACH ROW BEGIN
    INSERT INTO registro_pedidos(descripcion, fec_insercion, usuario)VALUES
    ("INSERT-VENTASS", NEW.fec_insercion, NEW.usuario);

  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `id_panaderia` int(11) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `ap` varchar(25) NOT NULL,
  `am` varchar(25) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `id_panaderia` (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `id_panaderia`, `ci`, `nombres`, `ap`, `am`, `direccion`, `telefono`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '10657288', 'YULI KAREN', 'HUARANCA', 'COLQUE', '69334597', 'B.1 DE MAYO', '2022-08-03 01:48:35', '2022-08-03 01:48:35', 1, '1'),
(2, 2, '10654348', ' KAREN', 'HUARACHI', 'COLQUE', '69334597', 'B.2 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(3, 3, '10621338', ' KARINA', 'MOLLO', 'HUARANI', '69332297', 'B.3 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(4, 4, '10652126', ' KAREN', 'SEGOVIA', 'MAMANI', '69336797', 'B.6 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(5, 5, '10656565', 'RAMIRO', 'MENDEZ', 'CONDORI', '69346697', 'B.7 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(6, 6, '10657645', 'BENITO', 'ARCE', 'COLQUE', '69334454', 'B.8DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(7, 7, '10657667', 'MARTHA', 'HUARANCA', 'SUARES', '69654597', 'B.4 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(8, 8, '10657276', 'ELIANA', 'ARCO', 'COLQUE', '69334677', 'B.6 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(9, 9, '10657256', 'DALIA', 'JAURES', 'COLQUE', '69332397', 'B.7 DE MAYO', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(10, 10, '1065726522', 'JUANNN', 'CRUZ', 'COLQUE', '69334532', '4334', '2022-07-07 22:32:35', '2022-08-12 00:10:02', 1, '1');

--
-- Disparadores `personas`
--
DROP TRIGGER IF EXISTS `insertar_registro_huellas`;
DELIMITER $$
CREATE TRIGGER `insertar_registro_huellas` BEFORE INSERT ON `personas` FOR EACH ROW BEGIN
    INSERT INTO registro_huellas(consulta, fec_insercion, usuario)VALUES
    ("INSERT-PERSONAS", NEW.fec_insercion, NEW.usuario);

  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_panaderia` int(11) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `descripcion_producto` varchar(40) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_panaderia` (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_panaderia`, `nombres`, `descripcion_producto`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'PAN REDONDO', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(2, 2, 'PAN FRANCES', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(3, 3, 'PAN COLIZA', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(4, 4, 'PAN GALLETA', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(5, 5, 'PAN CARACOL', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(6, 6, 'PAN HAMBURGUEZA', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(7, 7, 'PAN REDONDO', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(8, 8, 'PAN COLIZA', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(9, 9, 'PAN CAUCA', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(10, 10, 'PAN GALLETA', '', '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_precio`
--

DROP TABLE IF EXISTS `producto_precio`;
CREATE TABLE IF NOT EXISTS `producto_precio` (
  `id_producto_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `precio` float NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_producto_precio`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_precio`
--

INSERT INTO `producto_precio` (`id_producto_precio`, `id_producto`, `fecha_asignacion`, `precio`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(2, 2, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(3, 3, '2022-04-10', 2, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(4, 4, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(5, 5, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(6, 6, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(7, 7, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(8, 8, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(9, 9, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1'),
(10, 10, '2022-04-10', 1, '2022-07-07 22:32:32', '2022-07-07 22:32:32', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

DROP TABLE IF EXISTS `propietario`;
CREATE TABLE IF NOT EXISTS `propietario` (
  `id_propietario` int(11) NOT NULL AUTO_INCREMENT,
  `id_panaderia` int(11) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_propietario`),
  KEY `id_panaderia` (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`id_propietario`, `id_panaderia`, `direccion`, `nombres`, `apellidos`, `celular`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'AV.MONTES ', 'JUAN', 'RUEDA', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(2, 2, 'AV.MONTES ', 'MAITE', 'MAMANI', '74535756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(3, 3, 'AV.MONTES ', 'JUAN', 'COLQUE', '73677756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(4, 4, 'AV.MONTES ', 'ANA', 'PANTOJA', '79433336', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(5, 5, 'AV.MONTES ', 'RAMIRO', 'AVIS', '79755466', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(6, 6, 'AV.MONTES ', 'ANDRES', 'RODRIGUES', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(7, 7, 'AV.MONTES ', 'JUANA', 'RUEDA', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(8, 8, 'AV.MONTES ', 'MIKAELA', 'RUEDA', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(9, 9, 'AV.MONTES ', 'DALIA', 'FLORES', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(10, 10, 'AV.MONTES ', 'DANIELA', 'HUARANCA', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_material`
--

DROP TABLE IF EXISTS `proveedores_material`;
CREATE TABLE IF NOT EXISTS `proveedores_material` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_panaderia` int(11) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `id_panaderia` (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores_material`
--

INSERT INTO `proveedores_material` (`id_proveedor`, `id_panaderia`, `direccion`, `nombres`, `apellidos`, `celular`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'AV.LAZ PAZ ', 'JUAN', 'RUEDA', '79775756', '2022-07-07 22:32:33', '2022-07-07 22:32:33', 1, '1'),
(2, 2, 'LAS PASCUAS ', 'MARIA', 'SANCHEZ', '633775756', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(3, 3, 'AV. CIRCUNVALACION', 'JUANITA', 'PERALES', '63487756', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(4, 4, 'AV.AMERICAS ', 'PAOLA', 'RUEDA', '63445756', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(5, 5, 'AV.RICADO ', 'BENITO', 'MAMANI', '79352355', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(6, 6, 'AV.RICADO ', 'EDUARDO', 'COLQUE', '79732532', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(7, 7, 'AV.RICADO ', 'PEDRO', 'MAMANI', '64234434', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(8, 8, 'AV.RICADO ', 'JUALIAN', 'JUAREZ', '79734432', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(9, 9, 'AV.RICADO ', 'PEDRO', 'MAMANI', '79432555', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(10, 10, 'AV.RICADO ', 'JUAN', 'ORCO', '74532664', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_cargos`
--

DROP TABLE IF EXISTS `registro_cargos`;
CREATE TABLE IF NOT EXISTS `registro_cargos` (
  `id_registro_cargos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_cargos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_cargos`
--

INSERT INTO `registro_cargos` (`id_registro_cargos`, `descripcion`, `fec_modificacion`, `usuario`) VALUES
(1, 'INSERT-CARGOS', '2022-08-24 01:47:01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_compras`
--

DROP TABLE IF EXISTS `registro_compras`;
CREATE TABLE IF NOT EXISTS `registro_compras` (
  `id_registro_compra` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_huellas`
--

DROP TABLE IF EXISTS `registro_huellas`;
CREATE TABLE IF NOT EXISTS `registro_huellas` (
  `id_registro_huella` int(11) NOT NULL AUTO_INCREMENT,
  `consultas` varchar(50) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_huella`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pedidos`
--

DROP TABLE IF EXISTS `registro_pedidos`;
CREATE TABLE IF NOT EXISTS `registro_pedidos` (
  `id_registro_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_pedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_pedidos`
--

INSERT INTO `registro_pedidos` (`id_registro_pedidos`, `descripcion`, `fec_insercion`, `usuario`) VALUES
(1, 'INSERT-VENTASS', '2022-08-03 06:01:59', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_trabajadores`
--

DROP TABLE IF EXISTS `registro_trabajadores`;
CREATE TABLE IF NOT EXISTS `registro_trabajadores` (
  `id_registro_trabajador` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_ventas`
--

DROP TABLE IF EXISTS `registro_ventas`;
CREATE TABLE IF NOT EXISTS `registro_ventas` (
  `id_registro_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_ventas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_ventas`
--

INSERT INTO `registro_ventas` (`id_registro_ventas`, `descripcion`, `fec_insercion`, `usuario`) VALUES
(1, 'INSERT-VENTASS', '2022-08-03 05:57:08', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`, `fec_insercion`, `fec_modif`, `usuario`, `estado`) VALUES
(1, 'ADMINISTRADOR', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
CREATE TABLE IF NOT EXISTS `trabajadores` (
  `id_trabajador` int(11) NOT NULL AUTO_INCREMENT,
  `id_panaderia` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_trabajador`),
  KEY `id_panaderia` (`id_panaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id_trabajador`, `id_panaderia`, `direccion`, `nombres`, `apellidos`, `celular`, `fecha_inicio`, `fecha_final`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'B. 1 DE MAYO', 'MARIA', 'MONTERO', '79775756', '2021-11-12', '2022-09-10', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(2, 2, 'B. 16 JULIO', 'JOSE', 'JURADO', '79775756', '2021-01-12', '2022-08-14', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(3, 3, 'B. 2 DE MAYO', 'JULIA', 'HUANCA', '79775756', '2021-11-15', '2022-09-17', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(4, 4, 'B. LAS PAZCUAS', 'MIKAELA', 'CONDORI', '79775756', '2021-12-16', '2022-11-10', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(5, 5, 'B. HUERTA', 'MARIA', 'MARTINEZ', '79775756', '2022-11-19', '2022-10-13', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(6, 6, 'B. 1 DE MAYO', 'MARIA', 'MONTERO', '79775756', '2021-11-12', '2022-09-10', '2022-07-07 22:32:34', '2022-07-07 22:32:34', 1, '1'),
(7, 7, 'AAAAAAAA', 'JOSE', 'JURADO', '79775756', '2021-01-12', '2022-08-14', '2022-07-07 22:32:34', '2022-08-24 01:43:18', 1, '1'),
(8, 8, 'KKKKKKKKKK', 'JULIA', 'HUANCA', '79775756', '2021-11-15', '2022-09-17', '2022-07-07 22:32:34', '2022-08-24 01:42:20', 1, '1'),
(9, 9, 'YYYYYYY', 'MIKAELA', 'CONDORI', '79775756', '2021-12-16', '2022-11-10', '2022-07-07 22:32:34', '2022-08-24 01:37:28', 1, '1'),
(10, 10, 'bb', 'MARIA', 'MARTINEZ', '79775756', '2022-11-19', '2022-10-13', '2022-07-07 22:32:34', '2022-07-08 01:02:48', 1, '1'),
(11, 1, 'WWW', 'WWW', 'WWW', '111', '2022-06-15', '2022-07-07', '2022-07-08 04:10:04', '2022-07-08 00:10:09', 1, '0'),
(12, 1, 'AABB', 'AAABB', 'AAABB', '11222', '2022-07-13', '2022-07-04', '2022-07-08 04:22:17', '2022-07-08 00:23:35', 1, '0'),
(13, 1, 'EEEAAA', 'EEAA', 'EEAA', '1111', '2022-07-13', '2022-07-05', '2022-07-08 04:24:08', '2022-07-08 00:24:40', 1, '0'),
(14, 1, 'AF', 'AF', 'AF', '25', '2022-07-05', '2022-07-13', '2022-07-08 04:59:09', '2022-08-12 03:01:01', 1, '0'),
(15, 1, 'A', 'A', 'A', '1', '2022-07-01', '2020-07-30', '2022-07-08 05:38:56', '2022-08-12 02:03:42', 1, '0'),
(16, 1, 'Y', 'Y', 'Y', '9', '2022-07-07', '2022-07-04', '2022-07-08 05:41:45', '2022-07-08 01:43:01', 1, '0'),
(17, 1, 'U', 'U', 'U', '6', '2022-07-06', '2022-07-01', '2022-07-08 05:42:50', '2022-07-08 01:42:58', 1, '0'),
(18, 1, 'YY', 'XXX', 'ZZZ', '7', '2022-07-07', '2022-07-05', '2022-07-08 05:44:39', '2022-08-12 03:01:33', 1, '0'),
(19, 1, 'YY', 'XXX', 'ZZZ', '7', '2022-07-07', '2022-07-05', '2022-07-08 05:44:41', '2022-08-12 03:01:43', 1, '0');

--
-- Disparadores `trabajadores`
--
DROP TRIGGER IF EXISTS `modificar_registro_trabajadores`;
DELIMITER $$
CREATE TRIGGER `modificar_registro_trabajadores` BEFORE INSERT ON `trabajadores` FOR EACH ROW BEGIN
    INSERT INTO registro_trabajadores(descripcion, fec_modificacion, usuario)VALUES
    ("INSERT-TRABAJADOR", NEW.fec_modificacion, NEW.usuario);

  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `usuarios` varchar(20) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `usuarios`, `clave`, `fec_insercion`, `fec_modif`, `usuario`, `estado`) VALUES
(1, 1, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(2, 2, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(3, 3, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(4, 4, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:35', '2022-07-07 22:32:35', 1, '1'),
(5, 5, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:36', '2022-07-07 22:32:36', 1, '1'),
(6, 6, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(7, 7, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(8, 8, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(9, 9, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(10, 10, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1'),
(11, 9, NULL, '$2y$10$PZrbitYDtyq8LhCYTpkwFOR9gXrAhQoHxDTHP9/T3LXSt4ebkYLdO', '2022-08-05 02:56:42', '2022-08-04 22:56:42', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
CREATE TABLE IF NOT EXISTS `usuarios_roles` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`id_usuario_rol`, `id_usuario`, `id_rol`, `fec_insercion`, `fec_modif`, `usuario`, `estado`) VALUES
(1, 1, 1, '2022-07-07 22:32:37', '2022-07-07 22:32:37', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `monto_venta` float NOT NULL,
  `descuento` float DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `fecha_venta`, `monto_venta`, `descuento`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '2022-11-13', 20, 2, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(2, 2, '2022-08-12', 30, 3, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(3, 3, '2022-11-15', 40, 4, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(4, 4, '2022-07-13', 250, 5, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(5, 5, '2022-11-15', 50, 6, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(6, 6, '2022-11-12', 230, 7, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(7, 7, '2022-10-22', 210, 8, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(8, 8, '2022-12-24', 30, 9, '2022-07-07 22:32:30', '2022-07-07 22:32:30', 1, '1'),
(9, 9, '2022-11-27', 40, 10, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(10, 10, '2022-11-26', 60, 12, '2022-07-07 22:32:31', '2022-07-07 22:32:31', 1, '1'),
(11, 10, '2022-08-02', 1000, 100, '2022-08-03 05:57:08', '2022-08-03 01:57:08', 1, '1');

--
-- Disparadores `ventas`
--
DROP TRIGGER IF EXISTS `insertar_registro_ventas`;
DELIMITER $$
CREATE TRIGGER `insertar_registro_ventas` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    INSERT INTO registro_ventas(descripcion, fec_insercion, usuario)VALUES
    ("INSERT-VENTASS", NEW.fec_insercion, NEW.usuario);

  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistas_clientes`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vistas_clientes`;
CREATE TABLE IF NOT EXISTS `vistas_clientes` (
`id_cliente` int(11)
,`direccion` varchar(30)
,`nombres` varchar(25)
,`apellidos` varchar(25)
,`celular` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistas_pedidos`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vistas_pedidos`;
CREATE TABLE IF NOT EXISTS `vistas_pedidos` (
`id_cliente` int(11)
,`direccion_envio` varchar(25)
,`descuento` float
,`fecha_pedido` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistas_personas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vistas_personas`;
CREATE TABLE IF NOT EXISTS `vistas_personas` (
`ci` varchar(20)
,`nombres` varchar(25)
,`ap` varchar(25)
,`am` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistas_trabajadores_cargos`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vistas_trabajadores_cargos`;
CREATE TABLE IF NOT EXISTS `vistas_trabajadores_cargos` (
`id_trabajador` int(11)
,`nombres` varchar(25)
,`apellidos` varchar(25)
,`celular` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistas_clientes`
--
DROP TABLE IF EXISTS `vistas_clientes`;

DROP VIEW IF EXISTS `vistas_clientes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistas_clientes`  AS  select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`direccion` AS `direccion`,`clientes`.`nombres` AS `nombres`,`clientes`.`apellidos` AS `apellidos`,`clientes`.`celular` AS `celular` from `clientes` where (`clientes`.`estado` = '1') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistas_pedidos`
--
DROP TABLE IF EXISTS `vistas_pedidos`;

DROP VIEW IF EXISTS `vistas_pedidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistas_pedidos`  AS  select `pedidos`.`id_cliente` AS `id_cliente`,`pedidos`.`direccion_envio` AS `direccion_envio`,`pedidos`.`descuento` AS `descuento`,`pedidos`.`fecha_pedido` AS `fecha_pedido` from `pedidos` where (`pedidos`.`estado` = '1') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistas_personas`
--
DROP TABLE IF EXISTS `vistas_personas`;

DROP VIEW IF EXISTS `vistas_personas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistas_personas`  AS  select `personas`.`ci` AS `ci`,`personas`.`nombres` AS `nombres`,`personas`.`ap` AS `ap`,`personas`.`am` AS `am` from `personas` where (`personas`.`estado` = '1') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistas_trabajadores_cargos`
--
DROP TABLE IF EXISTS `vistas_trabajadores_cargos`;

DROP VIEW IF EXISTS `vistas_trabajadores_cargos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistas_trabajadores_cargos`  AS  select `trabajadores`.`id_trabajador` AS `id_trabajador`,`trabajadores`.`nombres` AS `nombres`,`trabajadores`.`apellidos` AS `apellidos`,`trabajadores`.`celular` AS `celular` from `trabajadores` where (`trabajadores`.`estado` = '1') ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`);

--
-- Filtros para la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD CONSTRAINT `cargos_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_panaderia`) REFERENCES `panaderia` (`id_panaderia`);

--
-- Filtros para la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD CONSTRAINT `detalles_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Filtros para la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD CONSTRAINT `detalles_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`id_panaderia`) REFERENCES `panaderia` (`id_panaderia`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_panaderia`) REFERENCES `panaderia` (`id_panaderia`);

--
-- Filtros para la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  ADD CONSTRAINT `producto_precio_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`id_panaderia`) REFERENCES `panaderia` (`id_panaderia`);

--
-- Filtros para la tabla `proveedores_material`
--
ALTER TABLE `proveedores_material`
  ADD CONSTRAINT `proveedores_material_ibfk_1` FOREIGN KEY (`id_panaderia`) REFERENCES `panaderia` (`id_panaderia`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`id_panaderia`) REFERENCES `panaderia` (`id_panaderia`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `usuarios_roles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuarios_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

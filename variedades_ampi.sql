-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2022 a las 16:20:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `variedades_ampi`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `factura` (IN `codigo` INT)   BEGIN 
SELECT * ,totaldepedido(codigo)as total ,
descuentos(totaldepedido(codigo),SUM(cantidad)) as totalcondescuento FROM facturas WHERE pedido = codigo GROUP BY producto; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reportes` (`codigo` INT)   BEGIN 
SELECT * ,totaldepedido(codigo)as total ,descuentos(totaldepedido(codigo),SUM(cantidad)) as totalcondescuento 
FROM reporte2 WHERE pedido = codigo GROUP BY producto; 
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_total_vendido` (`num1` INT) RETURNS VARCHAR(20) CHARSET utf8mb4  begin
	return (select sum(cantidad) from detalles_pedido where id_producto = num1);
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `cantidadproductos` () RETURNS INT(11)  BEGIN
RETURN(SELECT nombre_producto, COUNT(id_producto) FROM producto WHERE id_categoria_FK=codigo);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `descuento` (`num1` FLOAT, `cantidad` FLOAT) RETURNS FLOAT  BEGIN 
IF cantidad >=10 THEN
RETURN(SELECT num1-((num1*10)/100));
end if;
IF cantidad <10 THEN
RETURN(SELECT num1);
end if;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `precio_total_producto` (`precio` DOUBLE, `cantidad` DOUBLE) RETURNS DOUBLE  BEGIN
    RETURN (precio * cantidad);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `SentenciaUsuario` (`codigo` INT) RETURNS FLOAT  BEGIN 
    RETURN(SELECT SUM(uspe.id_pedido_fk) FROM usuario_pedido as uspe INNER JOIN pedido as pedi ON uspe.id_pedido_fk=pedi.id_pedido WHERE uspe.id_usuario_cliente_FK=codigo); 
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `totaldepedido` (`codigo` INT) RETURNS FLOAT  BEGIN 
RETURN(SELECT sum(precio_unidad*cantidad) FROM detalles_pedido  WHERE id_pedido= codigo);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` text NOT NULL,
  `nombre_img_categoria` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `nombre_img_categoria`) VALUES
(1, 'Frutas', 'Frutos comestibles obtenidos de plantas cultivadas', '656134546verduras.png'),
(2, 'Carnes', 'Producto comestible obtenidos de animales', '237629324proteina.png'),
(3, 'Condimentos', 'Ingredientes que se usa para dar sabor a la comida', '699604481condimento.png'),
(4, 'Aseo personal', 'producto de limpieza para uso personal', '901681685productos-aseo.jpg'),
(5, 'Lacteos', 'Producto comestible obtenido de vacas', '572598419productos-lacteos.png'),
(6, 'Bebidas', 'Productos de consumo liquido', '189102910reciclar.png'),
(7, 'Repostería', 'Productos comestibles hechos de harina', '381212549panaderia.png'),
(8, 'Verduras', 'Alimentos obtenidos de plantas cultivadas', '42023901verduras.png'),
(9, 'Enlatados', 'Productos enlatados para el consumo', '487498711botellas-de-vino.png'),
(10, 'Limpieza', 'Productos químicos para la limpieza y desinfección ', '584603072productos-aseo.jpg'),
(11, 'Papelería ', 'Productos de papeleria', '114674905papeleria.png'),
(12, 'Ferretería', 'Productos de ferretería', '135645900ferreteria.png'),
(13, 'Panadería ', 'Productos hechos en harina', '962646797panaderia.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_unidad` double NOT NULL,
  `cantidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id_pedido`, `id_producto`, `precio_unidad`, `cantidad`) VALUES
(1, 3, 22000, 1),
(1, 4, 22500, 1),
(2, 4, 22500, 1),
(3, 6, 7500, 2),
(4, 7, 450, 5),
(4, 8, 450, 5),
(4, 9, 450, 5),
(4, 10, 450, 10),
(5, 20, 2900, 2),
(5, 23, 5000, 2),
(6, 4, 22500, 1),
(6, 11, 12350, 1),
(6, 22, 1100, 1),
(7, 5, 4200, 2),
(8, 2, 1400, 6),
(8, 12, 2950, 10),
(8, 14, 2100, 5),
(9, 23, 5000, 1),
(10, 5, 4200, 2),
(10, 25, 6200, 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `factura`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `factura` (
`pedido` int(11)
,`producto` varchar(50)
,`cantidad` double
,`precio` double
,`costeporproducto` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(50) NOT NULL,
  `informacion_marca` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`, `informacion_marca`) VALUES
(1, 'Crerry', 'Comercializadora de frutas y verduras'),
(2, 'Frubis', 'Comercializadora de frutas'),
(3, 'Macpollo', 'Comercializadora de frutas y enbutidos'),
(4, 'Zenu', 'Comercializadora de carnes para el hogar'),
(5, 'Rey', 'Comercializadora de condimentos para la comida'),
(6, 'Dove', 'Empresa distribuidora de jabones para baño'),
(7, 'Dersa', 'Empresa distribuidora de jabones para la ropa'),
(8, '3D', 'Empresa distribuidora de jabones para la ropa'),
(9, 'Scott', 'Comercializadora de papel higiénico'),
(10, 'Familia', 'Comercializadora de papel higiénico'),
(11, 'Colgate', 'Comercializadora de productos para el aseo dental'),
(12, 'Klim', 'Comercializadora de lacteos'),
(13, 'Parmalat', 'Comercializadora de lacteos'),
(14, 'Alpina', 'Comercializadora de lacteos'),
(15, 'Alqueria', 'Comercializadora de lacteos'),
(16, 'Yogo Yogo', 'Comercializadora de yogures'),
(17, 'Cielo', 'Comercializadora de agua'),
(18, 'Coca cola', 'Comercializadora de gaseosas'),
(19, 'Paramo', 'Empresa distribuidora de agua'),
(20, 'Van Camp`s', 'Comercializadora de enlatados'),
(21, 'Calvo', 'Comercializadora de enlatados'),
(22, 'Toys', 'Comercializadora de productos de ferreteria'),
(23, 'Bic', 'Comercializadora de productos de papeleria'),
(24, 'Casio', 'Comercializadora de productos de papeleria'),
(25, 'Sharpie', 'Comercializadora de productos de papeleria'),
(26, 'Scribe', 'Comercializadora de productos de papeleria'),
(27, 'Pepsi', 'Comercializadora de Gaseosas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `destino_pedido` varchar(100) NOT NULL,
  `estado_pedido` varchar(50) NOT NULL,
  `id_producto_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_pedido`, `fecha_entrega`, `destino_pedido`, `estado_pedido`, `id_producto_FK`) VALUES
(1, '2022-08-02 09:52:00', '2022-08-02 00:00:00', 'Cl 82 #12-18', 'Entregado', 12),
(2, '2022-08-04 11:02:00', '2022-08-04 00:00:00', 'Cl 95 #16-14', 'Entregado', 4),
(3, '2022-08-08 11:07:00', '2022-08-08 00:00:00', 'Cr 105B #143-21', 'Entregado', 4),
(4, '2022-08-10 19:00:00', '0000-00-00 00:00:00', 'Cl 125 #19-89', 'Entregado', 6),
(5, '2022-08-11 20:57:00', '2022-08-11 00:00:00', 'Cr 37 #133A-46', 'Entregado', 7),
(6, '2022-08-13 12:18:00', '2022-08-13 00:00:00', 'Cr 60 #5C-60', 'Entregado', 8),
(7, '2022-08-18 11:22:00', '2022-08-18 00:00:00', 'Cr 3A #22-45', 'Entregado', 10),
(8, '2022-08-19 12:18:00', '2022-08-19 00:00:00', 'Cl 57A #40-67', 'Entregado', 24),
(9, '2022-08-22 09:46:00', '2022-08-22 00:00:00', 'Cr 21 #82-82', 'Entregado', 9),
(10, '2022-08-24 09:21:00', '2022-08-24 00:00:00', 'Cr 13 #63-39', 'Entregado', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(100) NOT NULL,
  `precio_unitario_producto` bigint(20) NOT NULL,
  `stock_producto` double NOT NULL,
  `unidad_minima_producto` double NOT NULL DEFAULT 5,
  `nombre_img_producto` varchar(150) NOT NULL,
  `estado_producto` varchar(50) NOT NULL,
  `id_marca_FK` int(11) NOT NULL,
  `id_categoria_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio_unitario_producto`, `stock_producto`, `unidad_minima_producto`, `nombre_img_producto`, `estado_producto`, `id_marca_FK`, `id_categoria_FK`) VALUES
(1, 'Manzana', 'Manzana verde', 1500, 50, 20, 'producto.png', 'Activo', 1, 1),
(2, 'Manzana', 'Manzana Roja', 1400, 60, 20, 'producto.png', 'Activo', 1, 1),
(3, 'Carne de cerdo', 'Kl de carne de cerdo', 22000, 30, 15, 'producto.png', 'Activo', 3, 2),
(4, 'Carne de res', 'Kl de carne de res', 22500, 32, 16, 'producto.png', 'Activo', 4, 2),
(5, 'Alas de pollo', 'Kl de alas con contillal', 4200, 32, 16, 'producto.png', 'Activo', 3, 2),
(6, 'Costilla', 'Kl de costilla de res', 7500, 27, 10, 'producto.png', 'Activo', 4, 2),
(7, 'Color rey', 'Papeleta color rey', 450, 100, 25, 'producto.png', 'Activo', 5, 3),
(8, 'Salsina rey', 'Papeleta salsina rey', 450, 98, 21, 'producto.png', 'Activo', 5, 3),
(9, 'Comino rey', 'Papeleta comino rey', 450, 98, 21, 'producto.png', 'Activo', 5, 3),
(10, 'Ricostilla', 'Papeleta de ricostilla', 400, 73, 29, 'producto.png', 'Activo', 5, 3),
(11, 'Jobón dove liquido', 'Tarro 100 ml', 12350, 54, 7, 'producto.png', 'Activo', 6, 4),
(12, 'Jobón protex barra', 'Barra de 90g', 2950, 82, 15, 'producto.png', 'Activo', 6, 4),
(13, 'Papel Scott', 'Papel por 27m', 1800, 190, 41, 'producto.png', 'Activo', 7, 4),
(14, 'Papel Familia', 'Papel por 32m', 2100, 150, 30, 'producto.png', 'Activo', 8, 4),
(15, 'Leche parmalat', 'leche por 500ml', 1800, 42, 17, 'producto.png', 'Activo', 13, 5),
(16, 'Leche parmalat', 'leche por 1000ml', 2200, 39, 15, 'producto.png', 'Activo', 13, 5),
(17, 'Leche klim', 'leche en polvo por 25g', 1200, 32, 12, 'producto.png', 'Activo', 12, 5),
(18, 'Leche klim', 'leche en polvo por 300g', 20500, 20, 3, 'producto.png', 'Activo', 12, 5),
(19, 'Leche alpina', 'leche por 1000ml', 2600, 54, 15, 'producto.png', 'Activo', 14, 5),
(20, 'Leche alqueria', 'leche por 1000ml', 2900, 23, 16, 'producto.png', 'Activo', 15, 5),
(21, 'Yogourt Yogo Yogo', 'Yogo Yogo 15ml', 2300, 25, 5, 'producto.png', 'Activo', 16, 5),
(22, 'Agua cielo', 'Agua por 1 litro', 1100, 50, 12, 'producto.png', 'Activo', 17, 6),
(23, 'Gaseosa Coca Cola', 'Coca cola por 2.5 litros', 5000, 60, 12, 'producto.png', 'Activo', 18, 6),
(24, 'Agua paramo', 'Agua por 1 litro', 1100, 60, 12, 'producto.png', 'Activo', 19, 6),
(25, 'Sardina', 'Sardina en salsa por 450g', 6200, 25, 3, 'producto.png', 'Activo', 20, 9),
(26, 'Atun', 'Atun en salsa por 250g', 4400, 25, 5, 'producto.png', 'Activo', 21, 9),
(27, 'Sardina', 'Sardina en salsa por 250g', 5200, 24, 3, 'producto.png', 'Activo', 21, 9),
(28, 'Esfero big', 'Esfero color negro', 800, 24, 5, 'producto.png', 'Activo', 23, 11),
(29, 'Codo', 'Codo de pulga y media', 500, 50, 20, 'producto.png', 'Activo', 22, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc`
--

CREATE TABLE `tipo_doc` (
  `id_tipo_doc` int(11) NOT NULL,
  `nombre_tipo_doc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_doc`
--

INSERT INTO `tipo_doc` (`id_tipo_doc`, `nombre_tipo_doc`) VALUES
(1, 'Cedula de ciudadania'),
(2, 'Cedula de extranjeria'),
(3, 'Tarjeta de identidad'),
(4, 'Pasaporte'),
(5, 'Nit');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` bigint(20) NOT NULL,
  `email_usuario` varchar(100) NOT NULL,
  `pass_usuario` varchar(260) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `num_documento_usuario` varchar(15) NOT NULL,
  `telefono_usuario` varchar(15) NOT NULL,
  `direccion_usuario` varchar(100) NOT NULL,
  `sexo_usuario` tinyint(4) NOT NULL,
  `estado_usuario` tinyint(1) NOT NULL DEFAULT 1,
  `id_rol_FK` int(11) NOT NULL,
  `id_tipo_doc_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email_usuario`, `pass_usuario`, `nombre_usuario`, `apellido_usuario`, `num_documento_usuario`, `telefono_usuario`, `direccion_usuario`, `sexo_usuario`, `estado_usuario`, `id_rol_FK`, `id_tipo_doc_fk`) VALUES
(1, 'juan@gmail.com', '1234567890', 'Juan Camilo', 'Rincon', '1010101101', '3100000000', 'Calle 82 #25-49m', 1, 1, 1, 1),
(2, 'camilagonza@gmail.com', '102030', 'Camila', 'Gonzales', '1032159620', '3112305610', 'Calle 72 #10a-57', 2, 1, 1, 1),
(3, 'brayancami@gmail.com', '456789', 'Brayan', 'Palomino', '1016944629', '3134377435', 'Carrera 100 #96-10', 1, 1, 1, 3),
(4, 'jhonalex@gmail.com', '213045', 'Jhon', 'Camargo', '1000350620', '3142000000', 'Calle 1 #10c-04', 1, 1, 1, 1),
(5, 'kevindiaz@gmail.com', '987123', 'Kevin', 'Alexis', '1020897410', '3502611023', 'Calle 200 #15a-20', 1, 1, 1, 2),
(6, 'josemier@gmail.com', '159874', 'Jose', 'Mier', '1011230158', '3214568974', 'Calle 74#65b-20', 1, 1, 1, 1),
(7, 'david@gmail.com', '11474', 'David', 'Figueroa', '1002314567', '3108125475', 'Transversal 115b #22-49', 1, 1, 3, 1),
(8, 'miller@gmail.com', '185649', 'Miller', 'Torres', '1015694410', '4444444444', 'Calle 40sur #13-50', 1, 1, 3, 1),
(9, 'andrea@gmail.com', '002314', 'Andrea', 'Paez', '1020365189', '3008001230', 'Carrera 105a #20-80', 2, 1, 3, 3),
(10, 'lorena@gmail.com', '524163', 'Lorena', 'Cetina', '1015620325', '3502222145', 'Calle 85a #112-15', 2, 1, 3, 3),
(11, 'jhonatan10@gmail.com', '356214', 'Jhonatan', 'Martinez', '1021459871', '3132589784', 'Carrera 40sur #18g-14', 1, 1, 3, 4),
(12, 'danivela@gmail.com', '153246', 'Daniela', 'Velasquez', '1016945897', '3156427894', 'Calle 77#10-23', 2, 0, 3, 2),
(13, 'saraji@gmail.com', '9876543210', 'Sara', 'Jimenes', '1020202020', '3500000000', 'Calle 79 #82l-03', 2, 1, 3, 4),
(14, 'paulo@gmail.com', '654123987', 'Paulo', 'Londra', '10172653218', '3124561029', 'Tranversal 190j #14-10', 1, 1, 3, 2),
(15, 'dariogo@gmail.com', '27895416', 'Dario', 'Gomez', '89652102', '3198542160', 'Carrera 91 #80a-15', 1, 1, 3, 1),
(16, 'hector@gmail.com', '4269875', 'Hector', 'Lavoe', '48235142', '3152000000', 'Calle 43 #116b-30', 1, 1, 3, 2),
(17, 'diomedes@gmail.com', '639512478', 'Diomedes', 'Diaz', '57894213', '3218412039', 'Calle 14sur #150-19', 1, 0, 3, 1),
(18, 'selena@gmail.com', '2569874', 'Selena', 'Gomez', '96320145', '3012015894', 'Calle 77#50-15', 2, 1, 3, 5),
(19, 'luzmary@gmail.com', '0126598', 'Luz Mary', 'Rivera', '1023695478', '3210505050', 'Transversal 32b #14-02', 2, 1, 2, 1),
(20, 'angelica@gmail.com', '984851', 'Anegelica', 'Suarez', '1080569120', '3206626541', 'Calle 50 #16-25', 2, 1, 2, 3),
(21, 'laura@gmail.com', '54165416', 'Laura', 'Oviedo', '1014568974', '32150505056', 'Carrera 85 #25j-15', 2, 1, 2, 4),
(22, 'sebastian@gmail.com', '564165', 'Sebastian', 'Perez', '1111023158', '6666666666', 'Avenida Suba #56-07', 1, 1, 2, 1),
(23, 'luisra@gmail.com', '564165', 'Luis', 'Paramo', '1030256987', '8888888888', 'Carrera 1sur #45-12', 1, 1, 2, 2),
(24, 'nicolca@gmail.com', '987481', 'Nikol', 'Sanchez', '1070459682', '3185625210', 'Calle 30#54-19', 2, 0, 2, 1),
(25, 'marianaga@gmail.com', '632915', 'Mariana', 'Garcia', '1120320695', '3102569874', 'Av Villavicencio #120b-32', 2, 1, 2, 3),
(26, 'segio@gmail.com', '415114', 'Sergio', 'Ramos', '1115236987', '2222222222', 'Tranversal 57f #19-12', 1, 1, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_pedido`
--

CREATE TABLE `usuario_pedido` (
  `id_usuario_pedido` int(11) NOT NULL,
  `id_pedido_fk` int(11) NOT NULL,
  `id_usuario_cliente_FK` bigint(20) NOT NULL,
  `id_usuario_vendedor_FK` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_pedido`
--

INSERT INTO `usuario_pedido` (`id_usuario_pedido`, `id_pedido_fk`, `id_usuario_cliente_FK`, `id_usuario_vendedor_FK`) VALUES
(1, 2, 15, 23),
(2, 5, 9, 19),
(3, 1, 10, 25),
(4, 10, 13, 20),
(5, 3, 18, 22),
(6, 5, 7, 26),
(7, 9, 16, 21),
(8, 6, 8, 24),
(9, 1, 11, 23),
(10, 8, 15, 20),
(11, 4, 9, 21),
(12, 3, 7, 26),
(13, 8, 18, 22),
(14, 10, 12, 22),
(15, 6, 18, 19),
(16, 9, 13, 25),
(17, 10, 15, 21),
(18, 7, 10, 24),
(19, 1, 9, 26),
(20, 1, 14, 26),
(21, 7, 14, 22),
(22, 6, 17, 19),
(23, 10, 11, 19),
(24, 3, 16, 21),
(25, 5, 16, 25),
(26, 10, 18, 24),
(27, 1, 7, 26),
(28, 1, 13, 22),
(29, 5, 9, 19),
(30, 5, 9, 19),
(31, 5, 7, 19),
(32, 4, 7, 25),
(33, 5, 18, 19),
(34, 10, 14, 23),
(35, 4, 10, 20),
(36, 4, 13, 23),
(37, 5, 11, 24),
(38, 8, 17, 26),
(39, 1, 17, 26),
(40, 10, 17, 22);

-- --------------------------------------------------------

--
-- Estructura para la vista `factura`
--
DROP TABLE IF EXISTS `factura`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `factura`  AS SELECT `dp`.`id_pedido` AS `pedido`, `pr`.`nombre_producto` AS `producto`, `dp`.`cantidad` AS `cantidad`, `dp`.`precio_unidad` AS `precio`, `dp`.`precio_unidad`* `dp`.`cantidad` AS `costeporproducto` FROM ((`detalles_pedido` `dp` join `pedido` `p` on(`dp`.`id_pedido` = `p`.`id_pedido`)) join `producto` `pr` on(`dp`.`id_producto` = `pr`.`id_producto`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_producto`),
  ADD KEY `detalles_pedido_producto` (`id_producto`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `marca_producto` (`id_marca_FK`),
  ADD KEY `categoria_producto` (`id_categoria_FK`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  ADD PRIMARY KEY (`id_tipo_doc`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email_usuario` (`email_usuario`),
  ADD KEY `usuario_rol` (`id_rol_FK`),
  ADD KEY `usuario_tipo_doc` (`id_tipo_doc_fk`);

--
-- Indices de la tabla `usuario_pedido`
--
ALTER TABLE `usuario_pedido`
  ADD PRIMARY KEY (`id_usuario_pedido`),
  ADD KEY `usuario_usuario_pedido` (`id_usuario_cliente_FK`),
  ADD KEY `usuario_usuario_pedido3` (`id_pedido_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  MODIFY `id_tipo_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuario_pedido`
--
ALTER TABLE `usuario_pedido`
  MODIFY `id_usuario_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalles_pedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `categoria_producto` FOREIGN KEY (`id_categoria_FK`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `marca_producto` FOREIGN KEY (`id_marca_FK`) REFERENCES `marca` (`id_marca`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol_FK`) REFERENCES `rol` (`id_rol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_tipo_doc` FOREIGN KEY (`id_tipo_doc_fk`) REFERENCES `tipo_doc` (`id_tipo_doc`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_pedido`
--
ALTER TABLE `usuario_pedido`
  ADD CONSTRAINT `usuario_usuario_pedido` FOREIGN KEY (`id_usuario_cliente_FK`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_usuario_pedido3` FOREIGN KEY (`id_pedido_fk`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

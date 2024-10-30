-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 15:53:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practicojoin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Electrónica', 'Productos electrónicos como teléfonos, computadoras y más.'),
(2, 'Ropa', 'Vestimenta para hombres, mujeres y niños.'),
(3, 'Hogar', 'Artículos para el hogar y decoración.'),
(4, 'Jardinería', 'Herramientas y productos para el jardín.'),
(5, 'Deportes', 'Equipamiento y ropa deportiva.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`, `direccion`, `telefono`) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', 'Calle 123, Ciudad', '1234567890'),
(2, 'María López', 'maria.lopez@example.com', 'Calle 456, Ciudad', '0987654321'),
(3, 'Carlos Martínez', 'carlos.martinez@example.com', 'Calle 789, Ciudad', '1122334455'),
(4, 'Laura García', 'laura.garcia@example.com', 'Calle 321, Ciudad', '2233445566'),
(5, 'Pedro Gómez', 'pedro.gomez@example.com', 'Calle 654, Ciudad', '3344556677');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ordenes`
--

CREATE TABLE `detalles_ordenes` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_ordenes`
--

INSERT INTO `detalles_ordenes` (`id`, `orden_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 1, 299.99),
(2, 1, 2, 1, 29.99),
(3, 2, 3, 1, 499.99),
(4, 3, 2, 1, 999.99),
(5, 4, 4, 1, 19.99);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `menos_stock`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `menos_stock` (
`id` int(11)
,`nombre` varchar(255)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`categoria_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id`, `cliente_id`, `fecha`, `total`) VALUES
(1, 1, '2024-10-10 13:47:35', 329.98),
(2, 2, '2024-10-10 13:47:35', 499.99),
(3, 1, '2024-10-10 13:47:35', 29.99),
(4, 3, '2024-10-10 13:47:35', 999.99),
(5, 4, '2024-10-10 13:47:35', 19.99);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ordenes_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ordenes_clientes` (
`orden_id` int(11)
,`fecha_orden` datetime
,`total_orden` decimal(10,2)
,`cliente_id` int(11)
,`nombre_cliente` varchar(100)
,`email_cliente` varchar(255)
,`direccion_cliente` text
,`telefono_cliente` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `categoria_id`) VALUES
(1, 'Teléfono Móvil', 'Teléfono inteligente con pantalla táctil.', 299.99, 50, 1),
(2, 'Laptop', 'Laptop potente para juegos y trabajo.', 999.99, 30, 1),
(3, 'Camisa', 'Camisa de algodón para uso diario.', 29.99, 100, 2),
(4, 'Sofá', 'Sofá cómodo para la sala de estar.', 499.99, 20, 3),
(5, 'Tijeras de Jardín', 'Tijeras de alta calidad para podar.', 19.99, 60, 4),
(6, 'Auriculares Gamer 423kl', 'Los mejores auriculares que vas a conseguir con audio 360 y bla bla bla aasfdaf', 1200.00, 5, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `productos_caros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `productos_caros` (
`id` int(11)
,`nombre` varchar(255)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`categoria_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `menos_stock`
--
DROP TABLE IF EXISTS `menos_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menos_stock`  AS SELECT `productos`.`id` AS `id`, `productos`.`nombre` AS `nombre`, `productos`.`descripcion` AS `descripcion`, `productos`.`precio` AS `precio`, `productos`.`stock` AS `stock`, `productos`.`categoria_id` AS `categoria_id` FROM `productos` WHERE `productos`.`stock` < 20 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ordenes_clientes`
--
DROP TABLE IF EXISTS `ordenes_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordenes_clientes`  AS SELECT `ordenes`.`id` AS `orden_id`, `ordenes`.`fecha` AS `fecha_orden`, `ordenes`.`total` AS `total_orden`, `clientes`.`id` AS `cliente_id`, `clientes`.`nombre` AS `nombre_cliente`, `clientes`.`email` AS `email_cliente`, `clientes`.`direccion` AS `direccion_cliente`, `clientes`.`telefono` AS `telefono_cliente` FROM (`ordenes` join `clientes` on(`ordenes`.`cliente_id` = `clientes`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `productos_caros`
--
DROP TABLE IF EXISTS `productos_caros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productos_caros`  AS SELECT `productos`.`id` AS `id`, `productos`.`nombre` AS `nombre`, `productos`.`descripcion` AS `descripcion`, `productos`.`precio` AS `precio`, `productos`.`stock` AS `stock`, `productos`.`categoria_id` AS `categoria_id` FROM `productos` WHERE `productos`.`precio` > 500 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `detalles_ordenes`
--
ALTER TABLE `detalles_ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalles_ordenes`
--
ALTER TABLE `detalles_ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_ordenes`
--
ALTER TABLE `detalles_ordenes`
  ADD CONSTRAINT `detalles_ordenes_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_ordenes_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

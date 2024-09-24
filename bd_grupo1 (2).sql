-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 19:46:32
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
-- Base de datos: `bd_grupo1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL DEFAULT nextval(`bd_grupo1`.`secuencia_clientes`),
  `primer_nombre` varchar(60) NOT NULL,
  `segundo_nombre` varchar(60) NOT NULL,
  `primer_apellido` varchar(60) NOT NULL,
  `segundo_apellido` varchar(60) NOT NULL,
  `nit` int(8) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `activacion` tinyint(4) DEFAULT NULL,
  `activation_token` varchar(100) DEFAULT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `telefono` int(8) DEFAULT NULL,
  `id_empresa` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `nit`, `email`, `activacion`, `activation_token`, `reset_token`, `reset_token_expires_at`, `telefono`, `id_empresa`) VALUES
(20200001, 'Peréz', 'Alvarado', 'Juan', 'José', 2854965, 'juan@gmail.com', 0, '', '', '0000-00-00 00:00:00', 12345678, 1),
(20210003, 'Díaz', 'González', 'Luis', 'Antonio', 2659856, 'luis@gmail.com', 0, '', '', '0000-00-00 00:00:00', 74185236, 1),
(20220030, 'Holanda', 'Martínez', 'Julio', 'Armando', 2478546, 'julio@gmail.com', 0, '', '', '0000-00-00 00:00:00', 98526236, 1),
(20240019, 'Francia', 'Morales', 'Mbappe', 'Christian', 5845698, 'mbp@gmail.com', 0, '', '', '0000-00-00 00:00:00', 78562265, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_servicio_reparacion`
--

CREATE TABLE `detalles_servicio_reparacion` (
  `id_detalle_srv_reparacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `reparacion_id` int(11) DEFAULT NULL,
  `id_repuesto` int(11) DEFAULT NULL,
  `precio` float(8,2) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_servicio_reparacion`
--

INSERT INTO `detalles_servicio_reparacion` (`id_detalle_srv_reparacion`, `fecha`, `reparacion_id`, `id_repuesto`, `precio`, `descripcion`) VALUES
(1, '2023-08-24', 1, 220, 250.00, 'Falta de pasta térmica'),
(2, '2023-09-29', 2, 218, 4200.00, 'Cambio de procesador (Intel® Core™ Ultra 9)'),
(3, '2024-09-02', 3, 219, 1256.00, 'Cambio de fuente de alimentación (PSU H360EGM-00 360W)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_equipos`
--

CREATE TABLE `detalle_equipos` (
  `id_detalle_equipo` int(11) NOT NULL,
  `no_orden` int(11) DEFAULT NULL,
  `id_tipo_equipo` smallint(6) DEFAULT NULL,
  `id_marca` smallint(6) DEFAULT NULL,
  `modelo` varchar(70) DEFAULT NULL,
  `descripcion_cliente` varchar(100) DEFAULT NULL,
  `id_agente` int(11) DEFAULT NULL,
  `evaluacion_agente` varchar(150) DEFAULT NULL,
  `observaciones` varchar(150) DEFAULT NULL,
  `espesificaciones_equipo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_equipos`
--

INSERT INTO `detalle_equipos` (`id_detalle_equipo`, `no_orden`, `id_tipo_equipo`, `id_marca`, `modelo`, `descripcion_cliente`, `id_agente`, `evaluacion_agente`, `observaciones`, `espesificaciones_equipo`) VALUES
(1, 1, 2, 1, 'MacBook Air', 'Se calienta demasiado', 10010, 'Revision de pasta térmica, limpiar povo y verificación de ventiladores.', 'Laptop llena de polvo.', 'Con cargador'),
(2, 2, 2, 3, 'Galaxy Book', 'Computadora lenta', 10010, 'Esto implica reemplazar componentes como el procesador, la memoria RAM o el disco duro por otros más potentes.', '', 'Con cargador'),
(3, 3, 2, 2, 'XPS', 'La pantalla ya no enciende', 10012, 'Posible fallo en la fuente de alimentación.', 'rayada en la parte de atras de la pantalla  y pantalla dañada.', 'Sin cargador'),
(4, 3, 1, 1, 'iPhone 14 Pro', 'Celular lento', 10012, 'Optimizar la memoria RAM.', '', 'Sin cargador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL DEFAULT nextval(`bd_grupo1`.`secuencia_empleados`),
  `dpi` bigint(13) DEFAULT NULL,
  `primer_nombre` varchar(60) NOT NULL,
  `segundo_nombre` varchar(60) NOT NULL,
  `primer_apellido` varchar(60) NOT NULL,
  `segundo_apellido` varchar(60) NOT NULL,
  `nit` int(8) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(8) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `id_rol` smallint(6) DEFAULT NULL,
  `id_empresa` smallint(6) DEFAULT NULL,
  `extension` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `dpi`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `nit`, `email`, `telefono`, `direccion`, `id_rol`, `id_empresa`, `extension`) VALUES
(10010, 5486223850101, 'Luis', 'ignacio', 'Pérez', 'Lopez', 23658564, 'agente1@gmail.com', 78565214, 'zona 6', 1, 1, 5025),
(10011, 5846255480101, 'Jose', 'Mario ', 'Álvarez ', 'Gonzales', 54578564, 'tec1@gmail.com', 14785236, 'zona 4', 2, 1, 5026),
(10012, 3548575850101, 'Lucia', 'Fernanda', 'Pérez ', 'Díaz', 52123545, 'agente2@gmail.com', 78945623, 'zona 9', 1, 1, 5027),
(10013, 2548665450101, 'Ian', 'Estuardo', 'poo', 'Sarga', 52548512, 'tec2@gmail.com', 20365984, 'zona 15', 2, 1, 5028),
(10014, 2548926842010, 'Lucas ', 'Estiven', 'Cruz', 'Salazar', 28512565, 'bodega1@gmail.com', 51226135, 'zona 4', 3, 1, 5029),
(10015, 2487890540101, 'Jacobo', 'Manolo', 'Lee', 'Cho', 25181251, 'bodega2@gmail.com', 47103256, 'zona 18', 3, 1, 5030),
(10016, 4586555420101, 'Marco', 'Luis', 'Luna', 'Fernandez', 15821254, 'bodega3@gmail.com', 54652512, 'zona 4', 3, 1, 5031),
(10017, 2945559650101, 'Monica', 'Lucia', 'Monson', 'Linarez', 23659584, 'admin@gmail.com', 59642515, 'zona 10', 4, 1, 5032);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` smallint(6) NOT NULL,
  `nombre_empresa` varchar(70) NOT NULL,
  `eslogan` varchar(200) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `mascotas` varchar(200) DEFAULT NULL,
  `vision` varchar(250) DEFAULT NULL,
  `mision` varchar(250) DEFAULT NULL,
  `valores` varchar(250) DEFAULT NULL,
  `historia` varchar(250) DEFAULT NULL,
  `img_historia` varchar(200) DEFAULT NULL,
  `telefono` int(8) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `eslogan`, `logo`, `mascotas`, `vision`, `mision`, `valores`, `historia`, `img_historia`, `telefono`, `direccion`) VALUES
(1, 'Bytes & Bits', 'Resalta el conocimiento técnico y la especialización.', '', '', '', '', '', '', '', 58575659, ' Mateo Flores 7-51, Calle del Estadio, Cdad. de Guatemala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_socio`
--

CREATE TABLE `empresa_socio` (
  `id_empresa_socio` int(11) NOT NULL,
  `id_empresa` smallint(6) DEFAULT NULL,
  `id_socio` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `estado_id` tinyint(4) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`estado_id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_repuesto`
--

CREATE TABLE `estado_repuesto` (
  `id_estado_repuesto` tinyint(4) NOT NULL,
  `estado` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_repuesto`
--

INSERT INTO `estado_repuesto` (`id_estado_repuesto`, `estado`) VALUES
(1, 'Activo'),
(2, 'Descontinuado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` smallint(6) NOT NULL,
  `nombre_marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Dell'),
(4, 'Sony'),
(5, 'Microsoft'),
(6, 'NVIDIA'),
(7, 'Amazon'),
(8, 'Fitbit'),
(9, 'Trupper'),
(10, 'Stanley'),
(11, 'Kester '),
(12, 'Milwauke'),
(13, 'Dewalt'),
(14, 'Weller'),
(15, 'Kigston'),
(16, 'Toshiba'),
(17, 'Corsair'),
(18, 'Western Digital'),
(19, 'Seagate'),
(20, 'Corsair'),
(21, 'Intel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio`
--

CREATE TABLE `orden_servicio` (
  `no_orden` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `fecha_entrega_estimada` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_servicio`
--

INSERT INTO `orden_servicio` (`no_orden`, `id_cliente`, `fecha_recepcion`, `fecha_entrega_estimada`, `fecha_entrega`) VALUES
(1, 20200001, '2023-08-22', '2023-09-01', '2023-08-31'),
(2, 20210003, '2023-09-28', '2023-10-11', '2023-10-09'),
(3, 20220030, '2024-08-31', '2024-09-14', '2024-09-14'),
(4, 20240019, '2024-09-03', '2024-09-12', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` smallint(6) NOT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  `telefono` int(8) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `nombre_contacto` varchar(50) DEFAULT NULL,
  `telefono_contacto` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `telefono`, `direccion`, `nombre_contacto`, `telefono_contacto`) VALUES
(1, 'unasa', 58543635, 'zona 2', 'Sofía  Ramírez ', 58325696),
(2, 'tecsa', 54525252, 'zona 5', 'Mateo  López ', 54856595),
(3, 'universal', 54212322, 'zona 7', 'Camila Martínez ', 54545758),
(4, 'nollgy', 56213325, 'zona10', 'Diego  Sánchez ', 54525551),
(5, 'paradise', 55598755, 'zona 15', 'Valentina  Castro ', 52565356),
(6, 'oklin', 52125668, 'zona 13', 'Lucas Morales ', 54859652);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_queja`
--

CREATE TABLE `reporte_queja` (
  `no_orden` int(11) NOT NULL,
  `descripcion_quejas` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reporte_queja`
--

INSERT INTO `reporte_queja` (`no_orden`, `descripcion_quejas`) VALUES
(1, 'Sigue calentándose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id_repuesto` int(11) NOT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `id_tipo_equipo` smallint(6) DEFAULT NULL,
  `id_marca` smallint(6) DEFAULT NULL,
  `modelo` varchar(70) DEFAULT NULL,
  `precio` float(10,2) DEFAULT NULL,
  `img_repuesto` varchar(200) DEFAULT NULL,
  `cantidad` varchar(200) DEFAULT NULL,
  `id_proveedor` smallint(6) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_estado_repuesto` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id_repuesto`, `nombre`, `id_tipo_equipo`, `id_marca`, `modelo`, `precio`, `img_repuesto`, `cantidad`, `id_proveedor`, `descripcion`, `id_estado_repuesto`) VALUES
(200, 'Juegos de destornilladores de precisión', 12, 11, '66-752', 100.00, '', NULL, 3, 'Herramientas indispensables para manipular componentes electrónicos pequeños y delicados en reparaciones.', 1),
(201, 'Pinzas de punta fina', 12, 15, 'T0053695299', 100.00, '', NULL, 2, 'Útiles para manejar pequeños cables, componentes y realizar ajustes de precisión en espacios reducidos.', 1),
(202, 'Estaciones de soldadura y desoldadura', 11, 15, 'WESD51', 3000.00, '', NULL, 1, 'Equipos necesarios para reparar y ensamblar componentes electrónicos mediante la aplicación o remoción de soldadura.', 1),
(203, 'Multímetro digital', 10, 10, 'MT-3', 500.00, '', NULL, 3, 'Instrumento versátil para medir voltaje, corriente y resistencia, ideal para diagnósticos electrónicos.', 2),
(204, 'discos duro toshiba 500 GB HDD', 9, 17, 'L200', 300.00, '', NULL, 6, 'Almacenamiento confiable para guardar grandes cantidades de datos y archivos.', 2),
(205, 'discos duro  kingston 1TB SSD ', 9, 16, 'KC2000', 800.00, '', NULL, 6, 'Unidades de almacenamiento de alta velocidad que mejoran el rendimiento del sistema.', 1),
(206, 'disco duro Western Digital (WD) 1 TB HDD', 9, 19, 'WD Blue', 500.00, '', NULL, 5, 'Soluciones económicas de gran capacidad para almacenamiento de datos.', 2),
(207, 'dico duro Seagate 500GB HDD', 9, 20, 'Barracuda', 600.00, '', NULL, 6, 'Almacenamiento confiable para guardar grandes cantidades de datos y archivos.', 1),
(208, 'RAM ddr3 4gb', 8, 18, 'Vengeance LPX', 400.00, '', NULL, 4, 'Módulos de memoria que mejoran el rendimiento en sistemas más antiguos.', 2),
(209, 'RAM ddr3 8gb', 8, 16, 'ValueRAM', 600.00, '', NULL, 5, 'Módulos de memoria que mejoran el rendimiento en sistemas más antiguos.', 2),
(210, 'RAM ddr3 16gb', 8, 18, 'Dominator Platinum', 800.00, '', NULL, 5, 'Módulos de memoria que mejoran el rendimiento en sistemas más antiguos.', 2),
(211, 'RAM ddr4 4gb', 8, 16, 'HyperX Predator', 500.00, '', NULL, 5, 'Módulos de alta velocidad que incrementan el rendimiento en tareas de computación modernas.', 2),
(212, 'RAM ddr4 8gb', 8, 18, 'Vengeance RGB Pro', 800.00, '', NULL, 4, 'Módulos de alta velocidad que incrementan el rendimiento en tareas de computación modernas.', 1),
(213, 'RAM ddr4 16gb', 8, 16, 'HyperX Fury', 1200.00, '', NULL, 4, 'Módulos de alta velocidad que incrementan el rendimiento en tareas de computación modernas.', 1),
(214, 'RAM ddr4 32gb', 8, 18, 'Vengeance LPX', 1500.00, '', NULL, 4, 'Módulos de alta velocidad que incrementan el rendimiento en tareas de computación modernas.', 1),
(215, 'Tarjetas gráficas nvidia rtx 3060', 7, 7, 'rtx 3060', 3500.00, '', NULL, 6, 'Potentes unidades de procesamiento gráfico ideales para juegos avanzados y aplicaciones de alto rendimiento visual.', 1),
(216, 'Tarjetas gráficas nvidia rtx 3080', 7, 7, 'rtx 3080', 4000.00, '', NULL, 6, 'Potentes unidades de procesamiento gráfico ideales para juegos avanzados y aplicaciones de alto rendimiento visual.', 1),
(217, 'Tarjetas gráficas nvidia rtx 3090', 7, 7, 'rtx 3090', 5000.00, '', NULL, 6, 'Potentes unidades de procesamiento gráfico ideales para juegos avanzados y aplicaciones de alto rendimiento visual.', 1),
(218, 'Procesador (Intel® Core™ Ultra 9)', 14, 21, 'Intel Core Ultra 9 14900H', 4200.00, '', NULL, 5, 'Procesador de alto rendimiento diseñado para laptops de gama alta y estaciones de trabajo portátiles. ', 1),
(219, 'Unidad de Fuente de Alimentación', 15, 3, 'H360EGM-00', 1256.00, '', NULL, 2, 'Ofrece una alimentación estable y confiable para asegurar el correcto funcionamiento de tu equipo.', 1),
(220, 'Pasta térmica', 16, 20, 'TM30', 250.00, '', NULL, 6, 'Es una opción asequible, pero con un rendimiento decente para aplicaciones en procesadores y tarjetas gráficas. ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` smallint(6) NOT NULL,
  `nombre_rol` varchar(40) DEFAULT NULL,
  `precio` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `precio`) VALUES
(1, 'Agente', 1850.00),
(2, 'Técnico', 2000.00),
(3, 'Bodega', 1500.00),
(4, 'Gerente', 3000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secuencia_clientes`
--

CREATE TABLE `secuencia_clientes` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `secuencia_clientes`
--

INSERT INTO `secuencia_clientes` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(20240020, 1, 9223372036854775806, 20240020, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secuencia_empleados`
--

CREATE TABLE `secuencia_empleados` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `secuencia_empleados`
--

INSERT INTO `secuencia_empleados` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(10018, 1, 9223372036854775806, 10018, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicio_id` tinyint(4) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `precio` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`servicio_id`, `nombre`, `precio`) VALUES
(1, 'Reparación de computadora', 320.00),
(2, 'Mantenimiento preventivo', 300.00),
(3, 'Recuperación de datos', 550.00),
(4, 'Instalación de software', 200.00),
(5, 'Asistencia en la Migración de Datos', 400.00),
(6, 'Seguridad Informática', 600.00),
(7, 'Upgrade total', 600.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_reparacion`
--

CREATE TABLE `servicios_reparacion` (
  `reparacion_id` int(11) NOT NULL,
  `id_detalle_equipo` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `tecnico_id` int(11) DEFAULT NULL,
  `servicio_id` tinyint(4) DEFAULT NULL,
  `precio` float(8,2) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios_reparacion`
--

INSERT INTO `servicios_reparacion` (`reparacion_id`, `id_detalle_equipo`, `fecha_ingreso`, `fecha_finalizacion`, `tecnico_id`, `servicio_id`, `precio`, `descripcion`) VALUES
(1, 1, '2023-08-23', '2023-08-29', 10011, 2, 300.00, 'Falta de pasta térmica'),
(2, 2, '2023-09-28', '2023-10-07', 10011, 7, 600.00, 'Cambio de procesador (Intel® Core™ Ultra 9)'),
(3, 3, '2024-09-01', '2024-09-13', 10013, 1, 320.00, 'Cambio de fuente de alimentación (PSU H360EGM-00 360W)'),
(4, 4, '2024-09-01', '2024-09-13', 10013, 2, 300.00, 'Optimizar la memoria RAM.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id_socio` tinyint(4) NOT NULL,
  `nombre_socio` varchar(40) DEFAULT NULL,
  `telefono` int(8) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `nombre_contacto` varchar(50) DEFAULT NULL,
  `telefono_contacto` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_empleo`
--

CREATE TABLE `solicitud_empleo` (
  `id_empleado` int(11) NOT NULL,
  `dpi` int(13) DEFAULT NULL,
  `primer_nombre` varchar(60) NOT NULL,
  `segundo_nombre` varchar(60) NOT NULL,
  `primer_apellido` varchar(60) NOT NULL,
  `segundo_apellido` varchar(60) NOT NULL,
  `nit` int(8) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(8) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `id_rol` smallint(6) DEFAULT NULL,
  `id_empresa` smallint(6) DEFAULT NULL,
  `curriculum` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE `tipo_equipo` (
  `id_tipo_equipo` smallint(6) NOT NULL,
  `nombre_tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_equipo`
--

INSERT INTO `tipo_equipo` (`id_tipo_equipo`, `nombre_tipo`) VALUES
(1, 'Telefono'),
(2, 'Laptop'),
(3, 'Teclado'),
(4, 'Mouse'),
(5, 'Auriculares'),
(6, 'Tablet'),
(7, 'Tarjeta de video o grafica '),
(8, 'Tarjeta RAM'),
(9, 'Disco Duro'),
(10, 'Multimetros'),
(11, 'Soldadura'),
(12, 'Herramientas Electronicas'),
(13, 'Desktop'),
(14, 'Procesador (Intel® Core™ Ultra 9)'),
(15, 'Unidad de Fuente de Alimentación'),
(16, 'Pasta térmica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_empleado` int(11) NOT NULL,
  `nombre_usuario` varchar(30) DEFAULT NULL,
  `contrasenia` varchar(8) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_empleado`, `nombre_usuario`, `contrasenia`, `fecha_creacion`, `fecha_modificacion`, `estado_id`) VALUES
(10010, 'agente1@gmail.com', 'agente1', '2023-06-15', '2023-06-15', 1),
(10011, 'tec1@gmail.com', 'tecnico1', '2022-07-20', '2022-07-20', 1),
(10012, 'agente1@gmail.com', 'agente2', '2022-04-07', '2022-04-07', 1),
(10013, 'tec2@gmail.com', 'tecnico2', '2023-05-31', '2023-05-31', 1),
(10014, 'bodega1@gmail.com', 'bodega1', '2021-03-25', '2023-11-15', 2),
(10015, 'bodega2@gmail.com', 'bodega2', '2021-03-26', '2023-07-13', 2),
(10016, 'bodega3@gmail.com', 'bodega3', '2021-03-27', '2021-03-27', 1),
(10017, 'admin@gmail.com', 'admin', '2024-09-01', '2024-09-01', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk3_id_empresa` (`id_empresa`);

--
-- Indices de la tabla `detalles_servicio_reparacion`
--
ALTER TABLE `detalles_servicio_reparacion`
  ADD PRIMARY KEY (`id_detalle_srv_reparacion`),
  ADD KEY `fk_reparacion_id` (`reparacion_id`),
  ADD KEY `fk_id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `detalle_equipos`
--
ALTER TABLE `detalle_equipos`
  ADD PRIMARY KEY (`id_detalle_equipo`),
  ADD KEY `fk_id_marca` (`id_marca`),
  ADD KEY `fk_id_tipo_equipo` (`id_tipo_equipo`),
  ADD KEY `fk_no_orden` (`no_orden`),
  ADD KEY `fk_id_agente` (`id_agente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_id_rol` (`id_rol`),
  ADD KEY `fk2_id_empresa` (`id_empresa`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `empresa_socio`
--
ALTER TABLE `empresa_socio`
  ADD PRIMARY KEY (`id_empresa_socio`),
  ADD KEY `fk_id_socio` (`id_socio`),
  ADD KEY `fk_id_empresa` (`id_empresa`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`estado_id`);

--
-- Indices de la tabla `estado_repuesto`
--
ALTER TABLE `estado_repuesto`
  ADD PRIMARY KEY (`id_estado_repuesto`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD PRIMARY KEY (`no_orden`),
  ADD KEY `fk_id_cliente` (`id_cliente`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `reporte_queja`
--
ALTER TABLE `reporte_queja`
  ADD PRIMARY KEY (`no_orden`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id_repuesto`),
  ADD KEY `fk2_id_marca` (`id_marca`),
  ADD KEY `fk2_id_tipo_equipo` (`id_tipo_equipo`),
  ADD KEY `fk_id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicio_id`);

--
-- Indices de la tabla `servicios_reparacion`
--
ALTER TABLE `servicios_reparacion`
  ADD PRIMARY KEY (`reparacion_id`),
  ADD KEY `fk_id_detalle_equipo` (`id_detalle_equipo`),
  ADD KEY `fk_servicio_id` (`servicio_id`),
  ADD KEY `fk_tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`);

--
-- Indices de la tabla `solicitud_empleo`
--
ALTER TABLE `solicitud_empleo`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  ADD PRIMARY KEY (`id_tipo_equipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_estado_id` (`estado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalles_servicio_reparacion`
--
ALTER TABLE `detalles_servicio_reparacion`
  MODIFY `id_detalle_srv_reparacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_equipos`
--
ALTER TABLE `detalle_equipos`
  MODIFY `id_detalle_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empresa_socio`
--
ALTER TABLE `empresa_socio`
  MODIFY `id_empresa_socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `estado_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_repuesto`
--
ALTER TABLE `estado_repuesto`
  MODIFY `id_estado_repuesto` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  MODIFY `no_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicio_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicios_reparacion`
--
ALTER TABLE `servicios_reparacion`
  MODIFY `reparacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id_socio` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  MODIFY `id_tipo_equipo` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk3_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_servicio_reparacion`
--
ALTER TABLE `detalles_servicio_reparacion`
  ADD CONSTRAINT `fk_id_repuesto` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reparacion_id` FOREIGN KEY (`reparacion_id`) REFERENCES `servicios_reparacion` (`reparacion_id`);

--
-- Filtros para la tabla `detalle_equipos`
--
ALTER TABLE `detalle_equipos`
  ADD CONSTRAINT `fk_id_agente` FOREIGN KEY (`id_agente`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  ADD CONSTRAINT `fk_id_tipo_equipo` FOREIGN KEY (`id_tipo_equipo`) REFERENCES `tipo_equipo` (`id_tipo_equipo`),
  ADD CONSTRAINT `fk_no_orden` FOREIGN KEY (`no_orden`) REFERENCES `orden_servicio` (`no_orden`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk2_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `empresa_socio`
--
ALTER TABLE `empresa_socio`
  ADD CONSTRAINT `fk_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_socio` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);

--
-- Filtros para la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte_queja`
--
ALTER TABLE `reporte_queja`
  ADD CONSTRAINT `fk2_no_orden` FOREIGN KEY (`no_orden`) REFERENCES `orden_servicio` (`no_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD CONSTRAINT `fk2_id_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  ADD CONSTRAINT `fk2_id_tipo_equipo` FOREIGN KEY (`id_tipo_equipo`) REFERENCES `tipo_equipo` (`id_tipo_equipo`),
  ADD CONSTRAINT `fk_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_reparacion`
--
ALTER TABLE `servicios_reparacion`
  ADD CONSTRAINT `fk_id_detalle_equipo` FOREIGN KEY (`id_detalle_equipo`) REFERENCES `detalle_equipos` (`id_detalle_equipo`),
  ADD CONSTRAINT `fk_servicio_id` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`servicio_id`),
  ADD CONSTRAINT `fk_tecnico_id` FOREIGN KEY (`tecnico_id`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`estado_id`),
  ADD CONSTRAINT `fk_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

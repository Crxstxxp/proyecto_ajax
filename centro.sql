-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2023 a las 21:26:16
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
-- Base de datos: `centro`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosDasboard` ()   BEGIN
DECLARE totalinternos int;
DECLARE totalfams int;
DECLARE totaldiag int;

SET totalinternos = (SELECT COUNT(*) FROM internos i);
SET totalfams = (SELECT COUNT(*) FROM usuarios us);
SET totaldiag = (SELECT COUNT(*) FROM diagnosticos diag);

SELECT IFNULL (totalinternos,0) AS totalinternos,
		IFNULL (ROUND(totalfams,2),0) AS totalfams,
        IFNULL (ROUND(totaldiag,2),0) AS totaldiag;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_diags` ()   BEGIN

SELECT date(dg.fecha_diag) as fecha,
	   SUM(round(dg.id_diag,2)) as ides
FROM diagnosticos dg
WHERE date(dg.fecha_diag) >= date(last_day(now() -
INTERVAL 1 month) + INTERVAL 1 day)
AND date(dg.fecha_diag) <= last_day(date(CURRENT_DATE))
GROUP BY date(dg.fecha_diag);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `responsable` int(11) NOT NULL,
  `interno` int(11) NOT NULL,
  `fecha_reg` varchar(11) NOT NULL,
  `dia_cita` int(11) NOT NULL,
  `mes_cita` varchar(11) NOT NULL,
  `anio_cita` int(11) NOT NULL,
  `stat` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `responsable`, `interno`, `fecha_reg`, `dia_cita`, `mes_cita`, `anio_cita`, `stat`) VALUES
(17, 3, 1, '2022-08-22 ', 22, 'Agosto', 2022, 'pendiente'),
(23, 7, 5, '-', 0, '-', 0, 'neutro'),
(24, 8, 6, '2022-08-17', 29, 'Agosto', 2022, 'pendiente'),
(25, 9, 7, '-', 0, '-', 0, 'neutro'),
(26, 10, 8, '2022-08-17 ', 24, 'Agosto', 2022, 'pendiente'),
(27, 11, 9, '2022-08-17 ', 24, 'Agosto', 2022, 'pendiente'),
(38, 22, 20, '', 0, '', 0, 'pendiente'),
(39, 23, 21, '', 0, '', 0, 'pendiente'),
(40, 24, 22, '', 0, '', 0, 'pendiente'),
(41, 25, 23, '', 0, '', 0, 'pendiente'),
(42, 26, 24, '', 0, '', 0, 'pendiente'),
(43, 27, 25, '', 0, '', 0, ''),
(44, 28, 26, '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id_diag` int(11) NOT NULL,
  `interno` int(11) NOT NULL,
  `fecha_diag` varchar(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `diagnosticos`
--

INSERT INTO `diagnosticos` (`id_diag`, `interno`, `fecha_diag`, `descripcion`) VALUES
(4, 1, '2022-11-17 ', 'El interno ha mejorado el ultimo mes'),
(5, 1, '2022-11-17 ', 'No ha habido progreso en el ultimo mes'),
(7, 1, '2022-11-18 ', 'Durante el primer mes no hay cambios notables dentro de su aspecto'),
(8, 1, '2022-11-22 ', 'ha mejorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_emp` int(11) NOT NULL,
  `nombre` tinytext NOT NULL,
  `ape_1` tinytext NOT NULL,
  `ape_2` tinytext NOT NULL,
  `num_tel` varchar(10) NOT NULL,
  `correo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_emp`, `nombre`, `ape_1`, `ape_2`, `num_tel`, `correo`) VALUES
(2, 'Cristopher', 'Aguirre', 'Vazquez', '6183726765', 'crxstxxp@icloud.com'),
(4, 'Martin', 'Moreno', 'Lopez', '6186992548', 'martin@gmail.com'),
(6, 'Puto', 'El Que', 'Lo Lea', '6180000000', 'tilin2345@utd.edu.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internos`
--

CREATE TABLE `internos` (
  `id_interno` int(11) NOT NULL,
  `responsable` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `ape1` text NOT NULL,
  `ape2` text NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` varchar(11) NOT NULL,
  `anio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `internos`
--

INSERT INTO `internos` (`id_interno`, `responsable`, `nombre`, `ape1`, `ape2`, `dia`, `mes`, `anio`) VALUES
(1, 3, 'Uriel', 'Banderas', 'Rodriguez', 17, 'Junio', 1998),
(5, 7, 'Martin', 'Moreno', 'Lopez', 15, 'octubre', 2003),
(6, 8, 'Jorge', 'Vazquez', 'Gallegos', 12, 'Noviembre', 2003),
(7, 9, 'Saul', 'Montes', 'Garcia', 10, 'agosto', 1999),
(8, 10, 'Francisco', 'Hernandez', 'Navar', 22, 'septiembre', 2004),
(9, 11, 'Raul', 'Lopez', 'Garcia', 25, 'diciembtre', 1970),
(20, 22, 'Mauricio', 'Guerrero', 'Ruiz', 20, 'Enero', 2003),
(21, 23, 'Leonardo', 'Arreguin', 'Valenzuela', 25, 'Junio', 2003),
(22, 24, 'Diego', 'Gonzales', 'Herrernandez', 18, 'Diciembre', 2002),
(23, 25, 'Ivan', 'Guaheru', 'Mateos', 8, 'Noviembre', 2002),
(24, 26, 'Jose', 'AcuÃ±a', 'Elzalde', 3, 'Junio', 2000),
(25, 27, 'Miguel', 'Moran', 'Vazquez', 29, 'Enero', 2002),
(26, 28, 'jonathan', 'gurrola', 'antuna', 19, 'Mayo', 1999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_res` int(11) NOT NULL,
  `usuario` varchar(35) NOT NULL,
  `pw` varchar(150) NOT NULL,
  `privilegio` varchar(30) NOT NULL,
  `nombreres` text NOT NULL,
  `apellidos` varchar(11) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `calle` varchar(25) NOT NULL,
  `colonia` varchar(25) NOT NULL,
  `no_ext` int(11) NOT NULL,
  `no_int` int(11) NOT NULL,
  `cp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_res`, `usuario`, `pw`, `privilegio`, `nombreres`, `apellidos`, `telefono`, `calle`, `colonia`, `no_ext`, `no_int`, `cp`) VALUES
(1, 'admin', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'admin', 'Cristopher', 'Aguirre', '', '', '', 0, 0, 0),
(2, 'padrino', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'padrino', 'Fernando', 'Hernandez', '', '', '', 0, 0, 0),
(3, 'Fidel@gmail.com', 'TkdUVVdFOG01TWRhamtEdnpNa3ROdz09', 'cliente', 'Fidel', 'Chavez', '6183758969', 'Las fuentes', 'Del rio', 118, 259, 34068),
(7, 'mm8108483@gmail.com', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'cliente', 'Jhonas', 'SaldÃ­var ', '6182579898', 'Paseo del h', 'Fracc. real', 226, 789, 3411),
(8, 'mariarosa21@gmail.com', 'aG9yVmhaRUg2eE9hU3hKWDVuK0JWUT09', 'cliente', 'Maria', 'Gallegos Su', '618 123 45', 'Sacramento', 'California', 404, 0, 34234),
(9, 'Kmm.1989@gmail.com', 'RDJCRWV4bGZOY2ZlQVRLK2tBQWdFZz09', 'cliente', 'Karla', 'Montes', '618456987', 'Bustamante', 'Garcia', 199, 799, 3481),
(10, 'jesher34@hotmail.com', 'd1dtK0RraURQRmJ5cDN6Wm5BQkg5QT09', 'cliente', 'Jesus', 'Hernandez E', '618 143 44', 'Sydney', 'Guadalupe V', 5, 0, 34220),
(11, 'AleLopz@gmail.com', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'cliente', 'Alejandro', 'Lopez', '618795132', 'otoÃ±o', 'Durazno', 741, 248, 7531),
(20, 'martin@gmail.com', 'RjVzRU8rRGJqTnJYcFpIT1BlZXJiQT09', 'cliente', 'Martin', 'Aguilar', '6183559631', 'Jiren', 'Juan Lira', 378, 0, 34199),
(21, 'ChrissMM@gmail.com', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'cliente', 'Christian', 'Martell', 'AcuÃ±a', 'Las fuentes', 'Avelardo', 669, 0, 34155),
(22, 'Pablo@gmail.com', 'VkROeUoxaStHL3V0VTJzVlQ1TXpXZz09', 'cliente', 'Pablo', 'Guerreo', '6186992547', 'Puebla', 'El granizo', 287, 0, 34268),
(23, 'Santos@gmail.com', 'OGRWdFNubVNoOGxhaWdRYjVScXFidz09', 'cliente', 'Romeo', 'Santos', '618852369', 'Samborns', 'Samborns', 366, 0, 34567),
(24, 'Aurelio@gmail.com', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'cliente', 'Aurelio', 'Gonzales', '6186554987', 'Aurelio', 'woshingo', 34521, 0, 34529),
(25, 'puvlo@hotmail.com', 'MFZnUmhYZ0svUzhuUFUxeG5DRWY4QT09', 'cliente', 'Pablo', 'Guaheru', '618741258', 'carabina', 'corceles', 287, 0, 341987),
(26, 'Eli@gmail.com', 'QytzSlNOVHBWZ0Mya1V5Q1hFNVNUUT09', 'cliente', 'Ivan', 'Elizalde', '618963254', 'pura sangre', 'Los colosios', 347, 0, 34599),
(27, 'aaaa@utds', 'bDE5dzhMUFpCR1I0TUxuR0NHamFnQT09', 'cliente', 'Juan', 'Aguirre', '6183726765', 'Las fuentes', 'Del rio', 1234, 567, 34160),
(28, 'asdkjghakdhf@utd.edu.mx', 'NDRCY0R6M0VWaUVIVXZZYW1aNmphZz09', 'cliente', 'diego', 'gonzalez he', '6778859763', 'encino', 'las arboledas', 306, 0, 34409);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `responsable` (`responsable`),
  ADD KEY `interno` (`interno`);

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`id_diag`),
  ADD KEY `interno` (`interno`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indices de la tabla `internos`
--
ALTER TABLE `internos`
  ADD PRIMARY KEY (`id_interno`),
  ADD KEY `responsable` (`responsable`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_res`,`usuario`,`pw`,`privilegio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id_diag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_emp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `internos`
--
ALTER TABLE `internos`
  MODIFY `id_interno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`responsable`) REFERENCES `usuarios` (`id_res`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`interno`) REFERENCES `internos` (`id_interno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`interno`) REFERENCES `internos` (`id_interno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `internos`
--
ALTER TABLE `internos`
  ADD CONSTRAINT `internos_ibfk_1` FOREIGN KEY (`responsable`) REFERENCES `usuarios` (`id_res`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

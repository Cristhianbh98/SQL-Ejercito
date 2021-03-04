-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2021 a las 21:29:09
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34
-- This is a backup before the trigger is created

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ascenso`
--

CREATE TABLE `ascenso` (
  `ASCENSO_ID` bigint(20) UNSIGNED NOT NULL,
  `ASCENSO_FECHA` date DEFAULT NULL,
  `PETICION_ASCENSO_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ascenso`
--

INSERT INTO `ascenso` (`ASCENSO_ID`, `ASCENSO_FECHA`, `PETICION_ASCENSO_ID`) VALUES
(1, '2016-01-01', 1),
(2, '2008-05-01', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `batallon`
--

CREATE TABLE `batallon` (
  `BATALLON_ID` bigint(20) UNSIGNED NOT NULL,
  `BATALLON_NUMERO` smallint(6) DEFAULT NULL,
  `BATALLON_ALIAS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `batallon`
--

INSERT INTO `batallon` (`BATALLON_ID`, `BATALLON_NUMERO`, `BATALLON_ALIAS`) VALUES
(1, 10, 'MEGATOS'),
(2, 8, 'BRIGADIER'),
(3, 20, 'PAQUISHA'),
(4, 30, 'SHELL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `CALIFICACION_ID` bigint(20) UNSIGNED NOT NULL,
  `CALIFICACION_NOMBRE` varchar(30) DEFAULT NULL,
  `CALIFICACION_DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`CALIFICACION_ID`, `CALIFICACION_NOMBRE`, `CALIFICACION_DESCRIPCION`) VALUES
(1, 'REGULAR', 'CALIFICACION MALA'),
(2, 'BUENA', 'CALIFICACION MEDIA'),
(3, 'EXCELENTE', 'CALIFICACION BUENA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `castigo`
--

CREATE TABLE `castigo` (
  `CASTIGO_ID` bigint(20) UNSIGNED NOT NULL,
  `CASTIGO_F_INCIDENTE` date DEFAULT NULL,
  `CASTIGO_F_INICIO` date DEFAULT NULL,
  `CASTIGO_F_TERMINO` date DEFAULT NULL,
  `CASTIGO_MOTIVO` varchar(60) DEFAULT NULL,
  `SANCIONADO_ID` bigint(20) UNSIGNED NOT NULL,
  `SANCIONADOR_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `castigo`
--

INSERT INTO `castigo` (`CASTIGO_ID`, `CASTIGO_F_INCIDENTE`, `CASTIGO_F_INICIO`, `CASTIGO_F_TERMINO`, `CASTIGO_MOTIVO`, `SANCIONADO_ID`, `SANCIONADOR_ID`) VALUES
(1, '2018-05-20', '2018-05-21', '2018-05-24', 'CASO OMISO AL COMANDO DE MANDOS', 4, 1),
(2, '2004-03-19', '2004-04-05', '2004-04-05', 'IZA DE LA BANDERA IRRESPETUOSA', 10, 1),
(4, '2012-05-20', '2012-06-05', '2012-06-10', 'FALTA DE RESPETO A SUPERIOR', 24, 13),
(5, '2006-12-01', '2007-01-28', '2007-01-30', 'LLEGAR TARDE A FORMACIÓN', 14, 1),
(6, '2008-07-05', '2008-07-10', '2008-07-15', 'CUIDADO INDEBIDO DEL FUSIL', 17, 1),
(7, '1990-03-19', '1990-04-05', '1990-04-06', 'CUIDADO INDEBIDO DEL UNIFORME', 21, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

CREATE TABLE `entrenamiento` (
  `ENTRENAMIENTO_ID` bigint(20) UNSIGNED NOT NULL,
  `ENTRENAMIENTO_F_INICIO` date DEFAULT NULL,
  `ENTRENAMIENTO_F_TERMINO` date DEFAULT NULL,
  `BATALLON_ID` bigint(20) UNSIGNED NOT NULL,
  `CALIFICACION_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entrenamiento`
--

INSERT INTO `entrenamiento` (`ENTRENAMIENTO_ID`, `ENTRENAMIENTO_F_INICIO`, `ENTRENAMIENTO_F_TERMINO`, `BATALLON_ID`, `CALIFICACION_ID`) VALUES
(1, '2020-02-05', '2020-02-10', 1, 2),
(2, '2020-03-07', '2020-03-15', 1, 1),
(3, '2020-03-20', '2020-03-25', 1, 2),
(4, '2020-04-10', '2020-04-20', 1, 3),
(5, '2018-01-10', '2018-01-20', 2, 3),
(6, '2018-06-07', '2018-06-23', 2, 3),
(7, '2019-12-01', '2019-12-20', 2, 3),
(8, '2020-04-10', '2020-04-22', 2, 3),
(9, '2017-03-09', '2017-03-15', 3, 1),
(10, '2017-08-07', '2017-08-30', 3, 1),
(11, '2019-12-31', '2020-01-15', 3, 2),
(12, '2020-03-07', '2020-03-26', 3, 2),
(13, '2015-02-15', '2015-03-01', 4, 2),
(14, '2016-05-10', '2016-06-02', 4, 1),
(15, '2016-07-03', '2016-07-20', 4, 2),
(16, '2018-01-07', '2018-01-30', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion_ascenso`
--

CREATE TABLE `peticion_ascenso` (
  `PETICION_ASCENSO_ID` bigint(20) UNSIGNED NOT NULL,
  `ASPIRANTE_ID` bigint(20) UNSIGNED NOT NULL,
  `PETICION_ASCENSO_FECHA` date DEFAULT NULL,
  `PETICION_ASCENSO_N_T_ENCONTRADOS` smallint(6) DEFAULT NULL,
  `RANGO_ACTUAL_ID` bigint(20) UNSIGNED NOT NULL,
  `RANGO_ASCENDER_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peticion_ascenso`
--

INSERT INTO `peticion_ascenso` (`PETICION_ASCENSO_ID`, `ASPIRANTE_ID`, `PETICION_ASCENSO_FECHA`, `PETICION_ASCENSO_N_T_ENCONTRADOS`, `RANGO_ACTUAL_ID`, `RANGO_ASCENDER_ID`) VALUES
(1, 1, '2015-07-08', 0, 5, 6),
(2, 10, '2004-07-08', 0, 1, 2),
(3, 14, '2006-12-01', 0, 1, 2),
(4, 17, '2009-03-08', 4, 1, 2),
(5, 21, '1991-01-01', 0, 1, 2),
(6, 9, '2007-01-01', 3, 1, 2),
(7, 9, '2008-01-01', 0, 1, 2),
(8, 23, '2012-01-01', 1, 1, 2),
(9, 16, '1999-07-23', 7, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rango`
--

CREATE TABLE `rango` (
  `RANGO_ID` bigint(20) UNSIGNED NOT NULL,
  `RANGO_NOMBRE` varchar(30) DEFAULT NULL,
  `RANGO_DESCRIPCION` varchar(60) DEFAULT NULL,
  `RANGO_ANTERIOR` varchar(30) DEFAULT NULL,
  `RANGO_A_NECESARIO` smallint(6) DEFAULT NULL,
  `RANGO_P_EVALUAR` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rango`
--

INSERT INTO `rango` (`RANGO_ID`, `RANGO_NOMBRE`, `RANGO_DESCRIPCION`, `RANGO_ANTERIOR`, `RANGO_A_NECESARIO`, `RANGO_P_EVALUAR`) VALUES
(1, 'SOLDADO', 'TROPA MENOR', NULL, 0, 'PRUEBAS FÍSICAS NECESARIAS'),
(2, 'SARGENTO', 'A CARGO DE LOS SOLDADOS', 'SOLDADO', 4, 'PRUEBA DE HISTORIA Y FÍSICAS'),
(3, 'SUBOFICIAL', 'A CARGO DE LOS SARGENTOS', 'SARGENTO', 6, 'PRUEBAS DE HISTORIA Y FÍSICAS'),
(4, 'OFICIAL SUBALTERNO', 'SU INSIGNIA ES UNA ESTRELLA PLATEADA', 'SUBOFICIAL', 8, 'PRUEBA DE LEYES, HISTORIA Y FÍSICAS'),
(5, 'OFICIAL SUPERIOR', 'SU INSIGNIA ES UNA ESTRELLA DORADA', 'OFICIAL SUBALTERNO', 10, 'PRUEBA DE LEYES, HISTORIA Y FÍSICAS'),
(6, 'OFICIAL GENERAL', 'SU INSIGNIA ES EL ESCUDO DE LA REPUBLICA DEL ECUADOR', 'OFICIAL SUPERIOR', 14, 'PRUEBBA DE DERECHO, LEYES, HISTORIA Y FÍSICAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `SOLDADO_ID` bigint(20) UNSIGNED NOT NULL,
  `SOLDADO_NOMBRE` varchar(30) DEFAULT NULL,
  `SOLDADO_APELLIDO` varchar(30) DEFAULT NULL,
  `SOLDADO_CI` varchar(30) DEFAULT NULL,
  `SOLDADO_GENERO` varchar(15) DEFAULT NULL,
  `SOLDADO_F_NACIMIENTO` date DEFAULT NULL,
  `SOLDADO_F_INGRESO` date DEFAULT NULL,
  `SOLDADO_N_TATUAJE` smallint(6) DEFAULT NULL,
  `RANGO_ID` bigint(20) UNSIGNED NOT NULL,
  `BATALLON_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `soldado`
--

INSERT INTO `soldado` (`SOLDADO_ID`, `SOLDADO_NOMBRE`, `SOLDADO_APELLIDO`, `SOLDADO_CI`, `SOLDADO_GENERO`, `SOLDADO_F_NACIMIENTO`, `SOLDADO_F_INGRESO`, `SOLDADO_N_TATUAJE`, `RANGO_ID`, `BATALLON_ID`) VALUES
(1, 'Cristhian Jossue', 'Bacusoy Holguin', '1317165270', 'Masculino', '1978-07-08', '2000-08-01', 0, 6, 2),
(2, 'Fabian', 'Holguin', '09874515', 'Masculino', '1984-05-06', '2000-03-05', 0, 1, 2),
(3, 'Jossue', 'Hernandez', '15154258', 'Masculino', '1978-06-08', '1998-08-01', 2, 1, 2),
(4, 'Leluuch', 'Britanian', '131716258', 'Masculino', '1985-12-25', '2005-01-30', 4, 1, 2),
(5, 'Jean Pierre', 'Polnareff', '131718510', 'Masculino', '1981-05-15', '2005-05-12', 3, 1, 2),
(6, 'Ana', 'Anchundia', '1317165231', 'Femenino', '1975-03-22', '2002-07-03', 1, 1, 2),
(7, 'Gean Carlos', 'Cassagne', '13171520', 'Masculino', '1979-07-08', '2001-08-01', 0, 6, 1),
(8, 'Aaron', 'Perdue', '0683367787', 'Masculino', '1982-07-24', '2000-01-05', 3, 5, 1),
(9, 'Neville', 'Mercer', '407532228', 'Femenino', '1981-04-09', '2005-07-01', 3, 3, 1),
(10, 'Yasir', 'Hammond', '235254662', 'Masculino', '1973-03-13', '2001-09-15', 0, 1, 1),
(11, 'Amal', 'Mays', '175560378', 'Femenino', '1973-04-23', '2002-03-11', 0, 1, 1),
(12, 'Devin', 'Sharpe', '443116184', 'Masculino', '1981-08-08', '2005-01-02', 3, 1, 1),
(13, 'Drew', 'Baird', '133068139', 'Masculino', '1972-06-09', '1995-09-21', 0, 6, 3),
(14, 'Abel', 'Cunningham', '475146921', 'Femenino', '1985-03-02', '2003-06-24', 5, 1, 3),
(15, 'Samson', 'Hunter', '184621487', 'Masculino', '1995-08-17', '2010-05-02', 0, 2, 3),
(16, 'Wade', 'Price', '384877109', 'Masculino', '1971-04-26', '1998-07-21', 2, 1, 3),
(17, 'Ignatius', 'Hardy', '296118710', 'Masculino', '1981-04-22', '2002-11-06', 3, 1, 3),
(18, 'Marsden', 'Gibson', '72532708', 'Femenino', '1982-08-31', '2000-03-03', 0, 3, 3),
(19, 'Ishmael', 'Berger', '442109257', 'Masculino', '1989-05-01', '2009-07-25', 0, 6, 4),
(20, 'Adrian', 'Christian', '304877243', 'Masculino', '1989-05-10', '2009-03-05', 3, 4, 4),
(21, 'Beau', 'Mcleod', '58366684', 'Femenino', '1971-03-03', '1989-08-01', 0, 1, 4),
(22, 'Nicholas', 'Obrien', '215179036', 'Masculino', '1986-03-09', '2009-05-14', 4, 1, 4),
(23, 'Daquan', 'Harvey', '444002913', 'Masculino', '1997-12-09', '2010-03-09', 0, 1, 4),
(24, 'Rashad', 'Cobb', '110875525', 'Masculino', '1989-02-09', '2011-08-10', 2, 1, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ascenso`
--
ALTER TABLE `ascenso`
  ADD PRIMARY KEY (`ASCENSO_ID`),
  ADD KEY `ASCENSO_PETICION_ASCENSO_FK` (`PETICION_ASCENSO_ID`);

--
-- Indices de la tabla `batallon`
--
ALTER TABLE `batallon`
  ADD PRIMARY KEY (`BATALLON_ID`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`CALIFICACION_ID`);

--
-- Indices de la tabla `castigo`
--
ALTER TABLE `castigo`
  ADD PRIMARY KEY (`CASTIGO_ID`),
  ADD KEY `CASTIGO_SANCIONADO_FK` (`SANCIONADO_ID`),
  ADD KEY `CASTIGO_SANCIONADOR_FK` (`SANCIONADOR_ID`);

--
-- Indices de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD PRIMARY KEY (`ENTRENAMIENTO_ID`),
  ADD KEY `ENTRENAMIENTO_BATALLON_FK` (`BATALLON_ID`),
  ADD KEY `ENTRENAMIENTO_CALIFICACION_FK` (`CALIFICACION_ID`);

--
-- Indices de la tabla `peticion_ascenso`
--
ALTER TABLE `peticion_ascenso`
  ADD PRIMARY KEY (`PETICION_ASCENSO_ID`),
  ADD KEY `ASCENSO_RANGO_ACTUAL_FK` (`RANGO_ACTUAL_ID`),
  ADD KEY `ASCENSO_RANGO_ASCENDER_FK` (`RANGO_ASCENDER_ID`),
  ADD KEY `ASCENSO_SOLDADO_FK` (`ASPIRANTE_ID`);

--
-- Indices de la tabla `rango`
--
ALTER TABLE `rango`
  ADD PRIMARY KEY (`RANGO_ID`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`SOLDADO_ID`),
  ADD KEY `SOLDADO_RANGO_FK` (`RANGO_ID`),
  ADD KEY `SOLDADO_BATALLON_FK` (`BATALLON_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ascenso`
--
ALTER TABLE `ascenso`
  MODIFY `ASCENSO_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `batallon`
--
ALTER TABLE `batallon`
  MODIFY `BATALLON_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `CALIFICACION_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `castigo`
--
ALTER TABLE `castigo`
  MODIFY `CASTIGO_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  MODIFY `ENTRENAMIENTO_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `peticion_ascenso`
--
ALTER TABLE `peticion_ascenso`
  MODIFY `PETICION_ASCENSO_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `rango`
--
ALTER TABLE `rango`
  MODIFY `RANGO_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `SOLDADO_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ascenso`
--
ALTER TABLE `ascenso`
  ADD CONSTRAINT `ASCENSO_PETICION_ASCENSO_FK` FOREIGN KEY (`PETICION_ASCENSO_ID`) REFERENCES `peticion_ascenso` (`PETICION_ASCENSO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `castigo`
--
ALTER TABLE `castigo`
  ADD CONSTRAINT `CASTIGO_SANCIONADOR_FK` FOREIGN KEY (`SANCIONADOR_ID`) REFERENCES `soldado` (`SOLDADO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CASTIGO_SANCIONADO_FK` FOREIGN KEY (`SANCIONADO_ID`) REFERENCES `soldado` (`SOLDADO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD CONSTRAINT `ENTRENAMIENTO_BATALLON_FK` FOREIGN KEY (`BATALLON_ID`) REFERENCES `batallon` (`BATALLON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ENTRENAMIENTO_CALIFICACION_FK` FOREIGN KEY (`CALIFICACION_ID`) REFERENCES `calificacion` (`CALIFICACION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `peticion_ascenso`
--
ALTER TABLE `peticion_ascenso`
  ADD CONSTRAINT `ASCENSO_RANGO_ACTUAL_FK` FOREIGN KEY (`RANGO_ACTUAL_ID`) REFERENCES `rango` (`RANGO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ASCENSO_RANGO_ASCENDER_FK` FOREIGN KEY (`RANGO_ASCENDER_ID`) REFERENCES `rango` (`RANGO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ASCENSO_SOLDADO_FK` FOREIGN KEY (`ASPIRANTE_ID`) REFERENCES `soldado` (`SOLDADO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `SOLDADO_BATALLON_FK` FOREIGN KEY (`BATALLON_ID`) REFERENCES `batallon` (`BATALLON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SOLDADO_RANGO_FK` FOREIGN KEY (`RANGO_ID`) REFERENCES `rango` (`RANGO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2018 a las 17:39:39
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `torosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efemeride`
--

CREATE TABLE `efemeride` (
  `idefemeride` int(11) NOT NULL,
  `idpersonaje` int(11) NOT NULL,
  `poblacion` varchar(255) NOT NULL,
  `ganaderia1` varchar(255) DEFAULT NULL,
  `ganaderia2` varchar(255) DEFAULT NULL,
  `ganaderia3` varchar(255) DEFAULT NULL,
  `ganaderia4` varchar(255) DEFAULT NULL,
  `ganaderia5` varchar(255) DEFAULT NULL,
  `ganaderia6` varchar(255) DEFAULT NULL,
  `toro1` varchar(255) DEFAULT NULL,
  `toro2` varchar(255) DEFAULT NULL,
  `toro3` varchar(255) DEFAULT NULL,
  `toro4` varchar(255) DEFAULT NULL,
  `toro5` varchar(255) DEFAULT NULL,
  `toro6` varchar(255) DEFAULT NULL,
  `notas` text,
  `reportaje` text NOT NULL,
  `evento` text NOT NULL,
  `fechaefemeride` date NOT NULL,
  `interviniente1` varchar(255) DEFAULT NULL,
  `interviniente2` varchar(255) DEFAULT NULL,
  `interviniente3` varchar(255) DEFAULT NULL,
  `interviniente4` varchar(255) DEFAULT NULL,
  `interviniente5` varchar(255) DEFAULT NULL,
  `interviniente6` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `efemeride`
--

INSERT INTO `efemeride` (`idefemeride`, `idpersonaje`, `poblacion`, `ganaderia1`, `ganaderia2`, `ganaderia3`, `ganaderia4`, `ganaderia5`, `ganaderia6`, `toro1`, `toro2`, `toro3`, `toro4`, `toro5`, `toro6`, `notas`, `reportaje`, `evento`, `fechaefemeride`, `interviniente1`, `interviniente2`, `interviniente3`, `interviniente4`, `interviniente5`, `interviniente6`) VALUES
(4, 51, 'Cuenca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Notas', 'https://www.google.es/search?q=reportaje&oq=reportaje&aqs=chrome..69i57j0l5.2421j0j7&sourceid=chrome&ie=UTF-8', 'Cruz de Mayo', '2018-05-29', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 65, 'Toledo', 'Ganaderia 1', 'Ganaderia 2', 'Ganaderia 3', 'Ganaderia 4', NULL, NULL, 'Toro 1', 'Toro 2', 'Toro 3', 'Toro 4', NULL, NULL, 'Notas', 'Reprotaje', 'Evento', '2001-03-23', 'Interviniente 1', 'Interviniente 2', 'Interviniente 3', 'Interviniente 4', NULL, NULL),
(10, 51, 'Consuegra', '1', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Fue de lo mejor \r\n', 'TELE 5', 'El de consuegra', '2018-06-21', '1', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `idpersonaje` int(11) NOT NULL,
  `nombrepersonaje` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) NOT NULL,
  `apodo1` varchar(255) NOT NULL,
  `apodo2` varchar(255) NOT NULL,
  `nombrecartel` varchar(255) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `biografia` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `cossio` tinyint(1) NOT NULL,
  `completo` tinyint(1) NOT NULL,
  `averiguar` text NOT NULL,
  `notas` text NOT NULL,
  `provincianacimiento` varchar(255) NOT NULL,
  `pueblonacimiento` varchar(255) NOT NULL,
  `provinciaactual` varchar(255) NOT NULL,
  `puebloactual` varchar(255) NOT NULL,
  `clm` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`idpersonaje`, `nombrepersonaje`, `apellido1`, `apellido2`, `apodo1`, `apodo2`, `nombrecartel`, `fechanacimiento`, `contacto`, `direccion`, `telefono`, `correo`, `biografia`, `foto`, `cossio`, `completo`, `averiguar`, `notas`, `provincianacimiento`, `pueblonacimiento`, `provinciaactual`, `puebloactual`, `clm`) VALUES
(51, 'Agustin', 'Sanchez', 'Martin', 'Sanchez', 'Sancges', 'Sanchez', '1998-09-05', '', 'Avda Puerta del Sol', '6519999999', 'correo@gmail.com', 'BiografÃ­a', 'https://josemanuellopez.blogia.com/upload/externo-2a74d2d16101acc07a036268a959c09c.jpg', 1, 1, 'Averiguar', 'Notas', 'Toledo', 'Mazarambroz', 'Toledo', '', NULL),
(57, 'Julián ', 'López ', 'Escobar', 'El Juli', 'El Juli', 'El Juli', '1982-10-03', '', '', '', 'eljuli@gmail.com', 'Biografia', 'https://www.servitoro.com/2336-thickbox_default/entradas-el-juli.jpg', 0, 0, 'Averiguar', 'Notas', 'Madrid', 'Madrid', 'Madrid', 'Madrid', NULL),
(65, 'Javier', 'Simon', 'Pérez', 'Javi', 'Javi', 'Javi', '1999-06-04', 'Contacto', 'Sonseca', '06646515', 'javi@gmail.com', 'Biografía', 'http://felixdamianfilms.com/wp-content/uploads/2018/03/fotografia-de-retrato-diego-1.jpg', 0, 0, 'Averiguar', 'Notas', 'Toledo', 'Sonseca', 'Toledo', 'Sonseca', NULL),
(66, 'Arturo', 'García', 'Pérez', 'Pasala', 'Pasala', 'Pasala', '2018-06-13', 'Éspaña', '', '606654654654165', 'pasala@gmail.com', '', 'Pasala', 0, 0, '', '', 'Toledo', 'Consuegra', 'Toledo', 'Consuegra', NULL),
(67, 'José', 'Tomás', 'Román', 'JOSE TOMAS', '', 'Benidorm', '1989-07-25', '', '', '', '', 'José Tomás Román Martín, born in Galapagar (Madrid) on August 20, 1975. His love of bullfighting is inculcated his grandfather Celestino Roman. Grandnephew of the livestock “Victorino Martin” presented the attorney Antonio Corbacho and initiated him in the early stages of the profession.', 'https://s1.eestatic.com/2016/01/28/deportes/Deportes_98001701_534935_1706x960.jpg', 0, 0, '', 'Era un fiera', 'Madrid', 'Madrid', 'Muerto', 'Bajo tierra', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `idprofesion` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`idprofesion`, `descripcion`) VALUES
(1, 'Torero'),
(2, 'Panadero'),
(3, 'Programador'),
(4, 'Profesor'),
(7, 'dfgh'),
(8, 'Camarero'),
(9, 'Periodista'),
(10, 'Albañil'),
(11, 'Pintor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `idpersonaje` int(11) NOT NULL,
  `idprofesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabajo`
--

INSERT INTO `trabajo` (`idpersonaje`, `idprofesion`) VALUES
(51, 2),
(51, 3),
(65, 4),
(66, 11),
(67, 1),
(67, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombreusuario` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreusuario`, `contraseña`) VALUES
(1, 'superadmin', 'b640a0ce465fa2a4150c36b305c1c11b'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `efemeride`
--
ALTER TABLE `efemeride`
  ADD PRIMARY KEY (`idefemeride`),
  ADD KEY `FK_EFEMERIDE_PERSONAJE` (`idpersonaje`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`idpersonaje`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`idprofesion`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`idpersonaje`,`idprofesion`),
  ADD KEY `FK_TRABAJO_PROFESION` (`idprofesion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `efemeride`
--
ALTER TABLE `efemeride`
  MODIFY `idefemeride` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `idpersonaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `idprofesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `efemeride`
--
ALTER TABLE `efemeride`
  ADD CONSTRAINT `FK_EFEMERIDE_PERSONAJE` FOREIGN KEY (`idpersonaje`) REFERENCES `personaje` (`idpersonaje`);

--
-- Filtros para la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD CONSTRAINT `FK_TRABAJO_PERSONAJE` FOREIGN KEY (`idpersonaje`) REFERENCES `personaje` (`idpersonaje`),
  ADD CONSTRAINT `FK_TRABAJO_PROFESION` FOREIGN KEY (`idprofesion`) REFERENCES `profesion` (`idprofesion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

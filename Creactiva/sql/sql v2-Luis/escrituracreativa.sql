-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2021 a las 17:09:50
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escrituracreativa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'fantástico maravilloso'),
(2, 'fantástico realismo mágico'),
(3, 'fantástico'),
(4, 'policíaco detectivesco'),
(5, ' policiaco negro'),
(6, ' policiaco thriller'),
(7, ' policiaco espionaje'),
(8, ' memoria autobiografía'),
(9, 'memoria'),
(10, 'memoria confesión'),
(11, 'memoria diario'),
(12, 'carnavelescos parodia '),
(13, 'carnavelescos humor'),
(14, 'carnavelescos sátira'),
(15, 'testimoniales crónica literaria'),
(16, 'testimoniales diario'),
(17, 'históricos'),
(18, 'bildungsroman'),
(19, 'literatura infantil'),
(20, 'ensayo creativo'),
(21, 'literaturas digitales literaturas expandidas'),
(22, 'literaturas digitales cibernarrativa'),
(23, 'literaturas digitales ciberpoesía'),
(24, 'literaturas transmediales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desafio`
--

CREATE TABLE `desafio` (
  `id` int(9) NOT NULL,
  `idGrupo` int(9) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `tipoCalificacion` int(11) NOT NULL,
  `idCategoria` int(9) NOT NULL,
  `colaborativo` tinyint(1) NOT NULL,
  `fechaIni` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaFin` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `desafio`
--

INSERT INTO `desafio` (`id`, `idGrupo`, `titulo`, `descripcion`, `tipoCalificacion`, `idCategoria`, `colaborativo`, `fechaIni`, `fechaFin`, `activo`) VALUES
(262, 3, 'Caballeros de la mesa redonda', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.City</p>\n', 1, 11, 1, '2021-03-27 13:56:02', '2021-04-30 13:55:00', 1),
(263, 3, 'Rey Arturo II', '<p>El rey Arturo era un caballero muy valiente</p>\n', 1, 3, 2, '2021-03-27 13:57:35', '2021-04-30 18:49:05', 1),
(264, 3, 'Señor de los anillos', '<p>hace mucho tiempo</p>\n', 1, 3, 1, '2021-03-27 16:01:20', '2021-04-22 18:46:27', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enlacedesafio`
--

CREATE TABLE `enlacedesafio` (
  `idDesafio` int(11) NOT NULL,
  `enlace` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(9) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `idCreador` int(9) NOT NULL,
  `idGrupo` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`, `activo`, `idCreador`, `idGrupo`) VALUES
(22, 'Los Escribanos', 1, 6, 3),
(23, 'Los brothers', 1, 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipoestudiante`
--

CREATE TABLE `equipoestudiante` (
  `id` int(9) NOT NULL,
  `idEquipo` int(9) NOT NULL,
  `idEstudiante` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipoestudiante`
--

INSERT INTO `equipoestudiante` (`id`, `idEquipo`, `idEstudiante`) VALUES
(40, 22, 6),
(43, 22, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escrito`
--

CREATE TABLE `escrito` (
  `id` int(11) NOT NULL,
  `idGrupo` int(9) NOT NULL,
  `idDesafio` int(9) NOT NULL,
  `idEscritor` int(9) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `texto` longtext NOT NULL,
  `puntuacion` float NOT NULL,
  `comentario` mediumtext NOT NULL,
  `colaborativo` tinyint(1) NOT NULL,
  `finalizado` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `escrito`
--

INSERT INTO `escrito` (`id`, `idGrupo`, `idDesafio`, `idEscritor`, `nombre`, `texto`, `puntuacion`, `comentario`, `colaborativo`, `finalizado`, `fecha`, `activo`) VALUES
(133, 3, 262, 9, 'periodico', '<h2>Where can I get some?</h2>\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. genial</p>\n', 7, 'Esta muy bien explicado', 1, 1, '2021-03-27 14:22:37', 1),
(135, 3, 264, 9, 'el libro de harry', '<p>es un libro muy chulo</p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n', 0, '', 1, 0, '2021-04-06 20:22:01', 1),
(137, 3, 263, 22, 'El grandísimo Arturo', '<p>Es el grandísimo Arturo hace tiempo....</p>\n', 0, '', 2, 0, '2021-04-07 14:32:51', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(9) NOT NULL,
  `idEquipo` int(9) NOT NULL,
  `creadorEquipo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(9) NOT NULL,
  `idprofesor` int(9) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `idprofesor`, `nombre`, `activo`) VALUES
(3, 4, 'Historia', 1),
(4, 4, 'Lengua', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupoestudiante`
--

CREATE TABLE `grupoestudiante` (
  `id` int(9) NOT NULL,
  `idGrupo` int(9) NOT NULL,
  `idEstudiante` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupoestudiante`
--

INSERT INTO `grupoestudiante` (`id`, `idGrupo`, `idEstudiante`) VALUES
(1, 3, 6),
(2, 3, 7),
(3, 4, 9),
(4, 3, 9),
(5, 3, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajeria`
--

CREATE TABLE `mensajeria` (
  `id` int(9) NOT NULL,
  `idEmisor` int(9) NOT NULL,
  `idReceptor` int(9) NOT NULL,
  `idCreador` int(9) NOT NULL,
  `mensaje` mediumtext CHARACTER SET utf8 NOT NULL,
  `tipo` int(1) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `activo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mensajeria`
--

INSERT INTO `mensajeria` (`id`, `idEmisor`, `idReceptor`, `idCreador`, `mensaje`, `tipo`, `fecha`, `activo`) VALUES
(29, 7, 6, 6, 'gonzalo gonzalo2 te envía una petición para unirse a tu equipo Los Escribanos del Grupo de Historia', 0, '2021-03-27 11:45:14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimediadesafio`
--

CREATE TABLE `multimediadesafio` (
  `id` int(11) NOT NULL,
  `idDesafio` int(9) NOT NULL,
  `ruta` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `multimediadesafio`
--

INSERT INTO `multimediadesafio` (`id`, `idDesafio`, `ruta`, `fecha`) VALUES
(227, 263, 'http://localhost:3001/multimedia/users/4/263/video/aves.mp4', '2021-03-27 13:57:36'),
(228, 263, 'http://localhost:3001/multimedia/users/4/263/audio/Bruno mars - The lazy song.mp3', '2021-03-27 13:57:36'),
(232, 262, 'http://localhost:3001/multimedia/users/4/262/audio/Daft Punk - Get Lucky.mp3', '2021-03-27 15:56:56'),
(233, 262, 'http://localhost:3001/multimedia/users/4/262/image/digital.jpg', '2021-03-27 15:56:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimediaescrito`
--

CREATE TABLE `multimediaescrito` (
  `id` int(9) NOT NULL,
  `idEscritor` int(11) NOT NULL,
  `idDesafio` int(11) NOT NULL,
  `ruta` text CHARACTER SET utf8 DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `multimediaescrito`
--

INSERT INTO `multimediaescrito` (`id`, `idEscritor`, `idDesafio`, `ruta`, `fecha`, `orden`) VALUES
(122, 9, 262, 'http://localhost:3001/multimedia/users/9/262/audio/Bruno mars - The lazy song.mp3', '2021-03-27 15:27:04', 0),
(127, 9, 264, 'http://localhost:3001/multimedia/users/9/264/image/atardecer.jpg', '2021-04-06 20:22:01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(9) NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `foto` blob NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `rol` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `correo`, `password`, `nombre`, `apellidos`, `foto`, `activo`, `rol`) VALUES
(4, 'cora@ucm.es', '$2a$08$yobEY52jl8G2FpN6Nhd7nOLVjNdn96A1GWGQwHuJFREpmMcsUye9G', 'cora', 'cora2', '', 1, 'T'),
(6, 'genesis@ucm.es', '$2a$08$yobEY52jl8G2FpN6Nhd7nOLVjNdn96A1GWGQwHuJFREpmMcsUye9G', 'genesis', 'genesis2', '', 1, 'S'),
(7, 'gonzalo@ucm.es', '$2a$08$yobEY52jl8G2FpN6Nhd7nOLVjNdn96A1GWGQwHuJFREpmMcsUye9G', 'gonzalo', 'gonzalo2', '', 1, 'S'),
(8, 'adrian@ucm.es', '$2a$08$yobEY52jl8G2FpN6Nhd7nOLVjNdn96A1GWGQwHuJFREpmMcsUye9G', 'adrian', 'riesco', '', 1, 'A'),
(9, 'luis@ucm.es', '$2a$08$yobEY52jl8G2FpN6Nhd7nOLVjNdn96A1GWGQwHuJFREpmMcsUye9G', 'luis', 'jaramillo', '', 1, 'S'),
(10, 'stefano@ucm.es', '$2a$08$yobEY52jl8G2FpN6Nhd7nOLVjNdn96A1GWGQwHuJFREpmMcsUye9G', 'stefano', 'stefano2', '', 1, 'S'),
(16, 'pedro@ucm.es', '$2a$08$/fYrEGbexRF6udkEeon5CuNNhyzfex0iX/8rMafYfbW5YrayYwp6e', 'pedro', 'mata', '', 1, 'S');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `desafio`
--
ALTER TABLE `desafio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indexGrupo` (`idGrupo`) USING BTREE,
  ADD KEY `indexCategoria` (`idCategoria`) USING BTREE;

--
-- Indices de la tabla `enlacedesafio`
--
ALTER TABLE `enlacedesafio`
  ADD KEY `idDesafio` (`idDesafio`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idCreador` (`idCreador`);

--
-- Indices de la tabla `equipoestudiante`
--
ALTER TABLE `equipoestudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEquipo` (`idEquipo`),
  ADD KEY `idEstudiante` (`idEstudiante`);

--
-- Indices de la tabla `escrito`
--
ALTER TABLE `escrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indexDesafio` (`idDesafio`) USING BTREE,
  ADD KEY `indexGrupo` (`idGrupo`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD KEY `idEquipo` (`idEquipo`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idprofesor` (`idprofesor`);

--
-- Indices de la tabla `grupoestudiante`
--
ALTER TABLE `grupoestudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEstudiante` (`idEstudiante`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indexEmisor` (`idEmisor`) USING BTREE,
  ADD KEY `indexReceptor` (`idReceptor`) USING BTREE;

--
-- Indices de la tabla `multimediadesafio`
--
ALTER TABLE `multimediadesafio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indexDesafio` (`idDesafio`);

--
-- Indices de la tabla `multimediaescrito`
--
ALTER TABLE `multimediaescrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indexDesafio` (`idDesafio`) USING BTREE;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `desafio`
--
ALTER TABLE `desafio`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `equipoestudiante`
--
ALTER TABLE `equipoestudiante`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `escrito`
--
ALTER TABLE `escrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grupoestudiante`
--
ALTER TABLE `grupoestudiante`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `multimediadesafio`
--
ALTER TABLE `multimediadesafio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT de la tabla `multimediaescrito`
--
ALTER TABLE `multimediaescrito`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `desafio`
--
ALTER TABLE `desafio`
  ADD CONSTRAINT `desafio_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `desafio_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `enlacedesafio`
--
ALTER TABLE `enlacedesafio`
  ADD CONSTRAINT `enlacedesafio_ibfk_1` FOREIGN KEY (`idDesafio`) REFERENCES `desafio` (`id`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idCreador`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipoestudiante`
--
ALTER TABLE `equipoestudiante`
  ADD CONSTRAINT `equipoestudiante_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipoestudiante_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `escrito`
--
ALTER TABLE `escrito`
  ADD CONSTRAINT `escrito_ibfk_1` FOREIGN KEY (`idDesafio`) REFERENCES `desafio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idprofesor`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupoestudiante`
--
ALTER TABLE `grupoestudiante`
  ADD CONSTRAINT `grupoestudiante_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupoestudiante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD CONSTRAINT `mensajeria_ibfk_1` FOREIGN KEY (`idEmisor`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajeria_ibfk_2` FOREIGN KEY (`idReceptor`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `multimediadesafio`
--
ALTER TABLE `multimediadesafio`
  ADD CONSTRAINT `multimediadesafio_ibfk_1` FOREIGN KEY (`idDesafio`) REFERENCES `desafio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `multimediaescrito`
--
ALTER TABLE `multimediaescrito`
  ADD CONSTRAINT `multimediaescrito_ibfk_1` FOREIGN KEY (`idDesafio`) REFERENCES `desafio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2020 a las 05:29:19
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asigna_materia_docente`
--

CREATE TABLE `asigna_materia_docente` (
  `id_asigna` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_docente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id_docente`, `nombre`, `edad`, `correo`) VALUES
(1, 'david forero', 25, 'david@gmail.com'),
(2, 'maira alejandra', 23, 'maria@gmail.com'),
(3, 'tales', 41, 'tales@');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_estudiante` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_estudiante`, `nombre`, `edad`, `correo`) VALUES
(1, 'carlos tales', 30, 'tales@gmail.com'),
(2, 'leonardo forero', 27, 'leo@gmail.com'),
(3, 'david', 25, NULL),
(4, 'david', 24, NULL),
(5, 'david', 45, 'aizen@gmaiul');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mariterias`
--

CREATE TABLE `mariterias` (
  `id_materia` int(11) NOT NULL,
  `materia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL,
  `nota` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_nota`, `id_estudiante`, `id_docente`, `id_materia`, `id_periodo`, `nota`) VALUES
(1, 1, 1, NULL, NULL, '4.50'),
(2, 2, 2, NULL, NULL, '4.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id_periodo` int(11) NOT NULL,
  `periodo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`id_periodo`, `periodo`) VALUES
(1, '5'),
(2, '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `rol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `rol`) VALUES
(1, 'admin'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contra` varchar(100) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `usuario`, `contra`, `rol_id`, `nombre`, `edad`) VALUES
(1, 'aizen', '123', 1, 'david', 25),
(2, 'tales', '987', 2, 'leo', 27);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asigna_materia_docente`
--
ALTER TABLE `asigna_materia_docente`
  ADD PRIMARY KEY (`id_asigna`),
  ADD KEY `fk_asigna_docente` (`id_docente`),
  ADD KEY `fk_asigna_materia` (`id_materia`),
  ADD KEY `fk_asigna_periodo` (`id_periodo`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `mariterias`
--
ALTER TABLE `mariterias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_nota_docente` (`id_docente`),
  ADD KEY `fk_nota_estudiante` (`id_estudiante`),
  ADD KEY `fk_nota_materia` (`id_materia`),
  ADD KEY `fk_nota_periodo` (`id_periodo`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asigna_materia_docente`
--
ALTER TABLE `asigna_materia_docente`
  MODIFY `id_asigna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mariterias`
--
ALTER TABLE `mariterias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asigna_materia_docente`
--
ALTER TABLE `asigna_materia_docente`
  ADD CONSTRAINT `fk_asigna_docente` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id_docente`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_asigna_materia` FOREIGN KEY (`id_materia`) REFERENCES `mariterias` (`id_materia`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_asigna_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_nota_docente` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id_docente`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nota_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nota_materia` FOREIGN KEY (`id_materia`) REFERENCES `mariterias` (`id_materia`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nota_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `rol_id` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

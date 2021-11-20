-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 09:54 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_airbnb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `nombre`) VALUES
(2, 'Azul'),
(24, 'Tandil'),
(25, 'Chascomus'),
(28, 'Buenos Aires'),
(29, 'Chapultepec');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `puntaje` tinyint(4) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL,
  `id_depto_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `texto`, `puntaje`, `id_usuario_fk`, `id_depto_fk`) VALUES
(53, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Obcaecati perspiciatis vitae tempore aperiam, numquam provident modi facere repudiandae blanditiis fugiat a optio quas minima laboriosam ipsam nisi, culpa aspernatur excepturi?', 2, 2, 9),
(83, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum possimus eum eos ducimus ipsam, quo harum maiores earum facere sunt vel rerum neque quaerat blanditiis odit illum explicabo voluptatem illo.', 2, 12, 8),
(87, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum possimus eum eos ducimus ipsam, quo harum maiores earum facere sunt vel rerum neque quaerat blanditiis odit illum explicabo voluptatem illo.', 2, 12, 9),
(94, 'Este es un muy buen comentario que no puede ser igualado por otros tan facilmente!', 5, 12, 10),
(95, 'Este es un muy buen comentario que no puede ser igualado por otros tan facilmente!', 5, 12, 12),
(96, 'Este es un pesimo comentario que no puede ser igualado por otros tan facilmente!', 1, 11, 8),
(97, 'Este es un pesimo comentario que no puede ser igualado por otros tan facilmente!', 1, 11, 9),
(98, 'Este es un pesimo comentario que no puede ser igualado por otros tan facilmente!', 1, 11, 10),
(100, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Porro esse vero quaerat! Provident alias accusamus doloremque sapiente incidunt debitis temporibus suscipit, voluptatibus unde omnis itaque illum nulla dignissimos iusto fugit.', 3, 2, 9),
(101, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Porro esse vero quaerat! Provident alias accusamus doloremque sapiente incidunt debitis temporibus suscipit, voluptatibus unde omnis itaque illum nulla dignissimos iusto fugit.', 3, 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `precio` int(11) NOT NULL,
  `id_ciudad_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre`, `direccion`, `precio`, `id_ciudad_fk`) VALUES
(8, 'Depto Serrano', 'Colon 1300', 18000, 24),
(9, 'Depto del calvario', 'España 800', 8000, 24),
(10, 'Depto Naranja', 'chacabuco 800', 16000, 2),
(12, 'Depto Centrico', 'Santa fe 2300', 24000, 28),
(13, 'Depto Belgrano', 'Juncal 1800', 22000, 28),
(15, 'Depto Ocre', 'Valvanera 300', 23000, 24),
(39, 'Depto Violeta', 'yucatan 400', 12000, 25);

-- --------------------------------------------------------

--
-- Table structure for table `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(11) NOT NULL,
  `ruta` varchar(200) CHARACTER SET latin1 NOT NULL,
  `id_departamento_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `imagen`
--

INSERT INTO `imagen` (`id_imagen`, `ruta`, `id_departamento_fk`) VALUES
(32, 'images/temp/5fc7fa687b1ba.jpg', 8),
(33, 'images/temp/5fc7fa687c27e.jpg', 8),
(34, 'images/temp/5fc7fa886d453.jpg', 9),
(35, 'images/temp/5fc7fa886db22.jpg', 9),
(36, 'images/temp/5fc7fa9f15172.jpg', 10),
(37, 'images/temp/5fc7fa9f15852.jpg', 10);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `clave`, `rol`) VALUES
(2, 'admin@admin', '$2y$12$Nhvr7CwY8fH.IF4AS9lWh.vKgPq2u8EbgYEgzSO4qpNRqNY7fFKHC', 0),
(11, 'lucho@usuario', '$2y$10$dkFbk1EXcfpRZRzr3R60tuB5bQN6Dc9GVdtYqOeHthhTK6J.ZXVra', 1),
(12, 'maga@usuario', '$2y$10$j.bwgD/MViQ51mhGkimZS.ZCvy579kOXlSHqM/99vuBPnn3I3Els2', 1),
(13, 'cualquiera@usuario', '$2y$10$sW6r71lHUv5wh43BOGwZle1StyHQVKqIb..J6ocN2xupFFeMXIVVi', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_depto_fk` (`id_depto_fk`),
  ADD KEY `id_usuario_fk` (`id_usuario_fk`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD KEY `id_ciudad` (`id_ciudad_fk`);

--
-- Indexes for table `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `id_departamento_fk` (`id_departamento_fk`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_depto_fk`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`id_ciudad_fk`) REFERENCES `ciudad` (`id_ciudad`) ON UPDATE CASCADE;

--
-- Constraints for table `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`id_departamento_fk`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

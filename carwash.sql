-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-11-2023 a las 00:56:01
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carwash`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codigoCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `fechaIngreso` datetime(6) DEFAULT NULL,
  `idTipoCliente` int DEFAULT NULL,
  PRIMARY KEY (`codigoCliente`),
  KEY `fk_cliente_tipo_cliente` (`idTipoCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigoCliente`, `nombre`, `apellido`, `fechaIngreso`, `idTipoCliente`) VALUES
(1, 'Jeyson', 'Espinal', '2023-11-20 18:11:39.000000', 1),
(2, 'Fernando', 'Guevara', '2023-11-14 18:12:01.000000', 1),
(3, 'Jose', 'Espinal', '2023-11-20 18:11:39.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `idCliente` int DEFAULT NULL,
  `idVehiculo` int DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `dias` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `fk_reserva_cliente` (`idCliente`),
  KEY `fk_reserva_vehiculo` (`idVehiculo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocliente`
--

DROP TABLE IF EXISTS `tipocliente`;
CREATE TABLE IF NOT EXISTS `tipocliente` (
  `idTipoCliente` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idTipoCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipocliente`
--

INSERT INTO `tipocliente` (`idTipoCliente`, `descripcion`) VALUES
(1, 'Basico'),
(2, 'Premium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipovehiculo`
--

DROP TABLE IF EXISTS `tipovehiculo`;
CREATE TABLE IF NOT EXISTS `tipovehiculo` (
  `idTipoVehículo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  `precioXhora` double DEFAULT NULL,
  PRIMARY KEY (`idTipoVehículo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipovehiculo`
--

INSERT INTO `tipovehiculo` (`idTipoVehículo`, `descripcion`, `precioXhora`) VALUES
(1, 'Camioneta', 25.5),
(2, 'Turismo', 20.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `idVehiculo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `idTipoVehiculo` int DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `fk_vehiculo_tipo` (`idTipoVehiculo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idVehiculo`, `marca`, `anio`, `disponible`, `idTipoVehiculo`) VALUES
(2, 'Toyota', 2020, 0, 1),
(3, 'Nissan', 2012, 1, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2017 a las 03:32:07
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aseguradora`
--
CREATE DATABASE IF NOT EXISTS `aseguradora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `aseguradora`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asegurado`
--

CREATE TABLE `asegurado` (
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `estado` int(11) DEFAULT '3',
  `corredor_cedula` varchar(45) NOT NULL,
  `cedula` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aseguradora`
--

CREATE TABLE `aseguradora` (
  `rif` varchar(45) NOT NULL,
  `cuentabancaria` varchar(45) DEFAULT NULL,
  `cedulacuentabancaria` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefonolocal` varchar(45) DEFAULT NULL,
  `telefonopersonal` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `estado` varchar(45) DEFAULT NULL,
  `fechafundacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficiario`
--

CREATE TABLE `beneficiario` (
  `cedula` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `asegurado_cedula` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `cedula` int(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `estatus` varchar(20) NOT NULL DEFAULT 'En Espera',
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corredor`
--

CREATE TABLE `corredor` (
  `cedula` varchar(45) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fechanacimiento` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecharegistro` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `aseguradora_rif` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `codigo` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `montototal` varchar(45) DEFAULT NULL,
  `montocancelado` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Pendiente',
  `observaciones` varchar(100) DEFAULT NULL,
  `servicio_codigo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `codigo` varchar(45) NOT NULL,
  `monto` varchar(45) DEFAULT NULL,
  `reembolso` varchar(45) DEFAULT 'Pendiente',
  `estatus` varchar(45) DEFAULT 'Pendiente',
  `asegurado_cedula` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_de_servicios`
--

CREATE TABLE `pagos_de_servicios` (
  `codigo` varchar(45) NOT NULL,
  `servicio_codigo` varchar(45) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polizas`
--

CREATE TABLE `polizas` (
  `tipopolizas_codigo` varchar(45) NOT NULL,
  `corredor_cedula` varchar(45) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `asegurado_cedula` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolsos`
--

CREATE TABLE `reembolsos` (
  `monto` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `gastos_codigo` varchar(45) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Pagado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `codigo` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fechaadquisicion` date DEFAULT NULL,
  `fechavigencia` date DEFAULT NULL,
  `fechaculminacion` date DEFAULT NULL,
  `beneficios` varchar(45) DEFAULT NULL,
  `monto` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `observaciones` varchar(100) DEFAULT NULL,
  `tipopolizas_codigo` varchar(45) NOT NULL,
  `aseguradora_rif` varchar(45) NOT NULL,
  `tiposeguro_codigo` varchar(10) NOT NULL,
  `asegurado_cedula` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopolizas`
--

CREATE TABLE `tipopolizas` (
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `cobertura` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipopolizas`
--

INSERT INTO `tipopolizas` (`codigo`, `nombre`, `costo`, `cobertura`, `estatus`) VALUES
('TP-1', 'Póliza de cobertura limitada', '10000', 'Limitada', 'Activa'),
('TP-2', 'Póliza básica', '50000', 'Nacional', 'Activa'),
('TP-3', 'La póliza más popular', '100000', 'Internacional', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeguro`
--

CREATE TABLE `tiposeguro` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposeguro`
--

INSERT INTO `tiposeguro` (`codigo`, `nombre`, `observacion`, `estatus`) VALUES
('TS-1', 'Seguro de Vida', 'Cubre el riesgo de muerte natural o supervivencia y la incapacidad.', 'Activa'),
('TS-10', 'Seguro de pérdida de beneficios', 'cubre al empresario de los perjuicios o pérdidas económicas derivadas de un siniestro.', 'Activa'),
('TS-11', 'seguros empresariales', 'cubren los riesgos que tanto los empleados como la propia empresa puedan ser objeto.', 'Activa'),
('TS-12', 'Seguro de Accidentes', 'Cubre el riesgo de incapacidad o muerte como consecuencia de un accidente.', 'Activa'),
('TS-13', 'seguro terrestre', 'cubren objetos situados en la tierra.', 'Activa'),
('TS-14', 'seguro marítimo', 'cubren objetos situados en el mar.', 'Activa'),
('TS-15', 'seguro aéreo', 'cubren objetos situados en el aire.', 'Activa'),
('TS-16', 'Seguro de prima temporal', 'indican que la prima se abonará durante un período determinado.', 'Activa'),
('TS-17', 'Seguro de prima vitalicia', 'indican que el pago de la prima se efectuará siempre que viva el asegurado.', 'Activa'),
('TS-18', 'Seguro de prima única', 'indican que la prima se paga de una sola vez', 'Activa'),
('TS-19', 'Seguro de prima periódica', 'indican que la prima se pagará durante toda la duración de la póliza.', 'Activa'),
('TS-2', 'Seguro de responsabilidad civil', 'Cubre los riesgos que involuntariamente pueden causar daños a terceras personas.', 'Activa'),
('TS-20', 'Seguro de Enfermedad', 'Cubre los gastos de asistencia médica para caso de enfermedad.', 'Activa'),
('TS-21', 'Seguro de Enterramiento o decesos', 'Cubre los gastos ocasionados a los herederos por los servicios funerarios.', 'Activa'),
('TS-22', 'Seguro de incendio', 'Ccubre los daños ocasionados por el fuego o como consecuencia del intento de salvarlos del incendio.', 'Activa'),
('TS-23', 'Seguro de robo', 'Cubre los objetos robados y los deterioros ocasionados a consecuencia del mismo.', 'Activa'),
('TS-24', 'Seguro de transporte', 'Cubre los daños ocurridos durante el transporte de mercancías tanto a los medios de transporte como ', 'Activa'),
('TS-25', 'Seguro de automóvil', 'Cubre variados riesgos en función del tipo de póliza suscrita.', 'Activa'),
('TS-26', 'Seguro agrícola', 'Cubre los riesgos que afectan a explotaciones agrícolas, ganaderas y forestales.', 'Activa'),
('TS-3', 'Seguro familiar', 'Cubre el riesgo de daños que pueden ocasionar el tomador, su cónyuge, sus hijos menores de edad y/o ', 'Activa'),
('TS-4', 'Seguro profesional', 'Cubre el riesgo de daños que puedan derivarse del ejercicio de la profesión.', 'Activa'),
('TS-5', 'Seguro de productos', 'Cubre los riesgos que pueden derivarse de los productos fabricados, distribuidos, vendidos, etc.', 'Activa'),
('TS-6', 'Seguro empresarial', 'Cubre el riesgo de los daños que pueda ocasionar involuntariamente una empresa en su actividad norma', 'Activa'),
('TS-7', 'Seguro patronal', ' garantiza las indemnizaciones económicas que pueden derivarse de lesiones corporales ocasionadas a ', 'Activa'),
('TS-8', 'Seguro de crédito', 'cubre al asegurado de la insolvencia de sus deudores.', 'Activa'),
('TS-9', 'Seguro de Caución', 'tiene por objeto el garantizar el pago de una obligación', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(5) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `password` char(128) NOT NULL,
  `salt` char(28) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nivel` int(1) NOT NULL,
  `cookie` int(10) NOT NULL,
  `logueado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asegurado`
--
ALTER TABLE `asegurado`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `fk_asegurado_corredor1_idx` (`corredor_cedula`),
  ADD KEY `fk_asegurado_cita1_idx` (`cedula`);

--
-- Indices de la tabla `aseguradora`
--
ALTER TABLE `aseguradora`
  ADD PRIMARY KEY (`rif`),
  ADD UNIQUE KEY `rif_UNIQUE` (`rif`);

--
-- Indices de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  ADD KEY `fk_beneficiario_asegurado1_idx` (`asegurado_cedula`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `corredor`
--
ALTER TABLE `corredor`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  ADD KEY `fk_corredor_aseguradora1_idx` (`aseguradora_rif`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD KEY `fk_factura_servicio1_idx` (`servicio_codigo`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD KEY `fk_gastos_asegurado1_idx` (`asegurado_cedula`);

--
-- Indices de la tabla `pagos_de_servicios`
--
ALTER TABLE `pagos_de_servicios`
  ADD KEY `fk_pagos_de_servicios_factura1_idx` (`codigo`),
  ADD KEY `fk_pagos_de_servicios_servicio1_idx` (`servicio_codigo`);

--
-- Indices de la tabla `polizas`
--
ALTER TABLE `polizas`
  ADD KEY `fk_polizas_tipopolizas1_idx` (`tipopolizas_codigo`),
  ADD KEY `fk_polizas_corredor1_idx` (`corredor_cedula`),
  ADD KEY `fk_polizas_asegurado1_idx` (`asegurado_cedula`);

--
-- Indices de la tabla `reembolsos`
--
ALTER TABLE `reembolsos`
  ADD PRIMARY KEY (`gastos_codigo`),
  ADD KEY `fk_reembolsos_gastos1_idx` (`gastos_codigo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD KEY `fk_servicio_tipopolizas1_idx` (`tipopolizas_codigo`),
  ADD KEY `fk_servicio_aseguradora1_idx` (`aseguradora_rif`),
  ADD KEY `fk_servicio_tiposeguro1_idx` (`tiposeguro_codigo`),
  ADD KEY `fk_servicio_asegurado1_idx` (`asegurado_cedula`);

--
-- Indices de la tabla `tipopolizas`
--
ALTER TABLE `tipopolizas`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`);

--
-- Indices de la tabla `tiposeguro`
--
ALTER TABLE `tiposeguro`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asegurado`
--
ALTER TABLE `asegurado`
  ADD CONSTRAINT `fk_asegurado_cita1` FOREIGN KEY (`cedula`) REFERENCES `cita` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asegurado_corredor1` FOREIGN KEY (`corredor_cedula`) REFERENCES `corredor` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD CONSTRAINT `fk_beneficiario_asegurado1` FOREIGN KEY (`asegurado_cedula`) REFERENCES `asegurado` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `corredor`
--
ALTER TABLE `corredor`
  ADD CONSTRAINT `fk_corredor_aseguradora1` FOREIGN KEY (`aseguradora_rif`) REFERENCES `aseguradora` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_servicio1` FOREIGN KEY (`servicio_codigo`) REFERENCES `servicio` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `fk_gastos_asegurado1` FOREIGN KEY (`asegurado_cedula`) REFERENCES `asegurado` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos_de_servicios`
--
ALTER TABLE `pagos_de_servicios`
  ADD CONSTRAINT `fk_pagos_de_servicios_factura1` FOREIGN KEY (`codigo`) REFERENCES `factura` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_de_servicios_servicio1` FOREIGN KEY (`servicio_codigo`) REFERENCES `servicio` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `polizas`
--
ALTER TABLE `polizas`
  ADD CONSTRAINT `fk_polizas_asegurado1` FOREIGN KEY (`asegurado_cedula`) REFERENCES `asegurado` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_polizas_corredor1` FOREIGN KEY (`corredor_cedula`) REFERENCES `corredor` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_polizas_tipopolizas1` FOREIGN KEY (`tipopolizas_codigo`) REFERENCES `tipopolizas` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reembolsos`
--
ALTER TABLE `reembolsos`
  ADD CONSTRAINT `fk_reembolsos_gastos1` FOREIGN KEY (`gastos_codigo`) REFERENCES `gastos` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_asegurado1` FOREIGN KEY (`asegurado_cedula`) REFERENCES `asegurado` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_aseguradora1` FOREIGN KEY (`aseguradora_rif`) REFERENCES `aseguradora` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_tipopolizas1` FOREIGN KEY (`tipopolizas_codigo`) REFERENCES `tipopolizas` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_tiposeguro1` FOREIGN KEY (`tiposeguro_codigo`) REFERENCES `tiposeguro` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2017 a las 15:35:47
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
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `estado` int(11) DEFAULT '1',
  `corredor_cedula` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asegurado`
--

INSERT INTO `asegurado` (`cedula`, `nombres`, `apellidos`, `fechanacimiento`, `telefono`, `direccion`, `correo`, `estatus`, `estado`, `corredor_cedula`) VALUES
('11696062', 'CELINA', 'CASTILLO', '2017-02-01', '+58 ', 'X', 'C', 'En espera', NULL, '21726528'),
('12342323', 'MANUEL', 'JOSE', '2017-01-30', '+58 ', '', '', 'Activo', NULL, '21726528');

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

--
-- Volcado de datos para la tabla `aseguradora`
--

INSERT INTO `aseguradora` (`rif`, `cuentabancaria`, `cedulacuentabancaria`, `nombre`, `direccion`, `telefonolocal`, `telefonopersonal`, `correo`, `estatus`, `estado`, `fechafundacion`) VALUES
('J-11696062', '2222-2222-22-2222222222 ', 'J-11696062', 'PROVINCIAL CA', 'CARACAS', '+58 (0426) 000-0000', '+58 (0251) 000-0000', 'C@G.COM', 'Inactivo', 'LA', '2017-02-04'),
('J-21726528', '1111-1111-11-1111111111 ', 'J-21726528', 'MERCANTIL CA', 'ESTADO LARA BARQUISIMETO', '+58 (0426) 000-0000', '+58 (0251) 000-0000', 'MERCANTIL@CORREO.COM', 'Activa', 'LA', '2017-01-30'),
('J-22222222', '3333-3333-33-3333', 'J-33333333', 'CONATEL', 'X', '+58 ', '+58 ', 'X', 'Inactivo', 'LA', '2017-02-04');

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
  `asegurado_cedula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `beneficiario`
--

INSERT INTO `beneficiario` (`cedula`, `nombres`, `apellidos`, `fechanacimiento`, `direccion`, `telefono`, `correo`, `estatus`, `asegurado_cedula`) VALUES
(123456789, 'CELIMAR ', 'ACOSTA', '2017-02-02', '', '+58 ', '', 'Inactivo', '11696062');

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

--
-- Volcado de datos para la tabla `corredor`
--

INSERT INTO `corredor` (`cedula`, `nombres`, `apellidos`, `fechanacimiento`, `telefono`, `correo`, `direccion`, `fecharegistro`, `estatus`, `aseguradora_rif`) VALUES
('21726528', 'ERICK ANTONIO', 'SUAREZ', '1991-05-29', '+58 (0426) 355-3619', 'ERICK@GMAIL.COM', 'BARQUISIMETO SAN JUAN CALLE 36', '2017-02-04', 'Inactivo', 'J-21726528');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `codigo` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `montototal` varchar(45) DEFAULT NULL,
  `montocancelado` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
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
  `asegurado_cedula` varchar(10) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`codigo`, `monto`, `reembolso`, `asegurado_cedula`, `estatus`) VALUES
('1', '1,00', 'Pendiente', '11696062', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_de_servicios`
--

CREATE TABLE `pagos_de_servicios` (
  `factura_codigo` varchar(45) NOT NULL,
  `servicio_codigo` varchar(45) NOT NULL,
  `asegurado_cedula` varchar(10) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polizas`
--

CREATE TABLE `polizas` (
  `tipopolizas_codigo` varchar(45) NOT NULL,
  `corredor_cedula` varchar(45) NOT NULL,
  `asegurado_cedula` varchar(10) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolsos`
--

CREATE TABLE `reembolsos` (
  `monto` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `gastos_codigo` varchar(45) NOT NULL,
  `asegurado_cedula` varchar(10) NOT NULL,
  `estatus` varchar(45) DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reembolsos`
--

INSERT INTO `reembolsos` (`monto`, `fecha`, `gastos_codigo`, `asegurado_cedula`, `estatus`) VALUES
('1', '2017-02-27', '1', '11696062', 'Activa');

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
  `cobertura` varchar(45) DEFAULT 'NACIONAL',
  `observaciones` varchar(100) DEFAULT NULL,
  `tipopolizas_codigo` varchar(45) NOT NULL,
  `aseguradora_rif` varchar(45) NOT NULL,
  `tiposeguro_codigo` varchar(10) NOT NULL
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
('TP-1', 'Póliza de cobertura limitada', '53254', 'Limitada', 'Inactivo'),
('TP-2', 'Póliza básica', '5000', 'Nacional', 'Inactivo'),
('TP-3', 'La póliza más popular', '15000', 'Internacional', 'Activa');

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
('TS-10', 'Seguro de pérdida de beneficios', 'cubre al empresario de los perjuicios o pérdidas económicas derivadas de un siniestro.', 'Inactivo'),
('TS-11', 'seguros empresariales', 'cubren los riesgos que tanto los empleados como la propia empresa puedan ser objeto.', 'Inactivo'),
('TS-12', 'Seguro de Accidentes', 'Cubre el riesgo de incapacidad o muerte como consecuencia de un accidente.', 'Activa'),
('TS-13', 'seguro terrestre', 'cubren objetos situados en la tierra.', ''),
('TS-14', 'seguro marítimo', 'cubren objetos situados en el mar.', ''),
('TS-15', 'seguro aéreo', 'cubren objetos situados en el aire.', ''),
('TS-16', 'Seguro de prima temporal', 'indican que la prima se abonará durante un período determinado.', ''),
('TS-17', 'Seguro de prima vitalicia', 'indican que el pago de la prima se efectuará siempre que viva el asegurado.', ''),
('TS-18', 'Seguro de prima única', 'indican que la prima se paga de una sola vez', ''),
('TS-19', 'Seguro de prima periódica', 'indican que la prima se pagará durante toda la duración de la póliza.', ''),
('TS-2', 'Seguro de responsabilidad civil', 'Cubre los riesgos que involuntariamente pueden causar daños a terceras personas.', 'Activa'),
('TS-20', 'Seguro de Enfermedad', 'Cubre los gastos de asistencia médica para caso de enfermedad.', ''),
('TS-21', 'Seguro de Enterramiento o decesos', 'Cubre los gastos ocasionados a los herederos por los servicios funerarios.', ''),
('TS-22', 'Seguro de incendio', 'Ccubre los daños ocasionados por el fuego o como consecuencia del intento de salvarlos del incendio.', ''),
('TS-23', 'Seguro de robo', 'Cubre los objetos robados y los deterioros ocasionados a consecuencia del mismo.', ''),
('TS-24', 'Seguro de transporte', 'Cubre los daños ocurridos durante el transporte de mercancías tanto a los medios de transporte como ', ''),
('TS-25', 'Seguro de automóvil', 'Cubre variados riesgos en función del tipo de póliza suscrita.', ''),
('TS-26', 'Seguro agrícola', 'Cubre los riesgos que afectan a explotaciones agrícolas, ganaderas y forestales.', ''),
('TS-3', 'Seguro familiar', 'Cubre el riesgo de daños que pueden ocasionar el tomador, su cónyuge, sus hijos menores de edad y/o ', 'Activa'),
('TS-4', 'Seguro profesional', 'Cubre el riesgo de daños que puedan derivarse del ejercicio de la profesión.', ''),
('TS-5', 'Seguro de productos', 'Cubre los riesgos que pueden derivarse de los productos fabricados, distribuidos, vendidos, etc.', ''),
('TS-6', 'Seguro empresarial', 'Cubre el riesgo de los daños que pueda ocasionar involuntariamente una empresa en su actividad norma', ''),
('TS-7', 'Seguro patronal', ' garantiza las indemnizaciones económicas que pueden derivarse de lesiones corporales ocasionadas a ', ''),
('TS-8', 'Seguro de crédito', 'cubre al asegurado de la insolvencia de sus deudores.', ''),
('TS-9', 'Seguro de Caución', 'tiene por objeto el garantizar el pago de una obligación', '');

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
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `password`, `salt`, `cedula`, `nivel`, `cookie`, `logueado`) VALUES
(1, 'ERICK', 'SUAREZ', 'ERICK@GMAIL.COM', '21726528', 'BARQUISIMETO', '916bf7c51ee8ccf1a6d54d6fabc7e4f3d077428584d1112b637652f02072911527409348078334300814bf9647e9f7f2beb0fa50a76edca586a8c26e6c3b3335', 'q18JV8rURDwxXiFQ1xShQeU1MiU.', 21726528, 1, 45843781, 'NO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asegurado`
--
ALTER TABLE `asegurado`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  ADD KEY `fk_asegurado_corredor1_idx` (`corredor_cedula`);

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
  ADD KEY `fk_pagos_de_servicios_factura1_idx` (`factura_codigo`),
  ADD KEY `fk_pagos_de_servicios_servicio1_idx` (`servicio_codigo`),
  ADD KEY `fk_pagos_de_servicios_asegurado1_idx` (`asegurado_cedula`);

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
  ADD KEY `fk_reembolsos_gastos1_idx` (`gastos_codigo`),
  ADD KEY `fk_reembolsos_asegurado1_idx` (`asegurado_cedula`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`codigo`,`tiposeguro_codigo`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD KEY `fk_servicio_tipopolizas1_idx` (`tipopolizas_codigo`),
  ADD KEY `fk_servicio_aseguradora1_idx` (`aseguradora_rif`),
  ADD KEY `fk_servicio_tiposeguro1_idx` (`tiposeguro_codigo`);

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
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asegurado`
--
ALTER TABLE `asegurado`
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
  ADD CONSTRAINT `fk_pagos_de_servicios_asegurado1` FOREIGN KEY (`asegurado_cedula`) REFERENCES `asegurado` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_de_servicios_factura1` FOREIGN KEY (`factura_codigo`) REFERENCES `factura` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_reembolsos_asegurado1` FOREIGN KEY (`asegurado_cedula`) REFERENCES `asegurado` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reembolsos_gastos1` FOREIGN KEY (`gastos_codigo`) REFERENCES `gastos` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_aseguradora1` FOREIGN KEY (`aseguradora_rif`) REFERENCES `aseguradora` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_tipopolizas1` FOREIGN KEY (`tipopolizas_codigo`) REFERENCES `tipopolizas` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_tiposeguro1` FOREIGN KEY (`tiposeguro_codigo`) REFERENCES `tiposeguro` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

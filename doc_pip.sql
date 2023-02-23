-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-02-2023 a las 00:16:37
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `doc_pip`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `algoritmo`
--

CREATE TABLE `algoritmo` (
  `id` int NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `algoritmo_img`
--

CREATE TABLE `algoritmo_img` (
  `id` int NOT NULL,
  `id_img` int NOT NULL,
  `id_algoritmo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alg_pat`
--

CREATE TABLE `alg_pat` (
  `id` int NOT NULL,
  `id_patologia` int NOT NULL,
  `id_algoritmo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diag_dx`
--

CREATE TABLE `diag_dx` (
  `id` int NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diag_dx_img`
--

CREATE TABLE `diag_dx_img` (
  `id` int NOT NULL,
  `id_diag_dx` int NOT NULL,
  `id_img` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dx_pat`
--

CREATE TABLE `dx_pat` (
  `id` int NOT NULL,
  `id_patologia` int NOT NULL,
  `id_diag_dx` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img`
--

CREATE TABLE `img` (
  `id` int NOT NULL,
  `link` varchar(159) COLLATE utf8mb4_general_ci NOT NULL,
  `img_type` enum('Resonancia','Radiografia','Tomografia','Otros') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologias`
--

CREATE TABLE `patologias` (
  `id` int NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `genetica` tinyint(1) NOT NULL,
  `infeccion` tinyint(1) NOT NULL,
  `autoinmune` tinyint(1) NOT NULL,
  `transmisible` tinyint(1) NOT NULL,
  `genero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'hombre / mujer',
  `pronostico` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `libro` text COLLATE utf8mb4_general_ci,
  `clase` text COLLATE utf8mb4_general_ci,
  `experiencia` text COLLATE utf8mb4_general_ci,
  `tratamiento` text COLLATE utf8mb4_general_ci,
  `complicaciones` text COLLATE utf8mb4_general_ci,
  `fisiopatogenia` text COLLATE utf8mb4_general_ci,
  `diag_dif` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patologias`
--

INSERT INTO `patologias` (`id`, `nombre`, `edad`, `genetica`, `infeccion`, `autoinmune`, `transmisible`, `genero`, `pronostico`, `libro`, `clase`, `experiencia`, `tratamiento`, `complicaciones`, `fisiopatogenia`, `diag_dif`) VALUES
(1, 'Pat test', 15, 0, 1, 1, 1, 'Hombre', 'Sarasaasasasa', 'Sarasaasasasa', 'Sarasaasasasa', 'Sarasaasasasa', 'Sarasaasasasa', 'Me llamo jeronimo. Soy el mas capo del mundo', 'Sarasaasasasa', 'Sarasaasasasa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologia_sintoma`
--

CREATE TABLE `patologia_sintoma` (
  `id` int NOT NULL,
  `id_patologia` int NOT NULL,
  `id_sintoma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patologia_sintoma`
--

INSERT INTO `patologia_sintoma` (`id`, `id_patologia`, `id_sintoma`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sintomas`
--

CREATE TABLE `sintomas` (
  `id` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sintomas`
--

INSERT INTO `sintomas` (`id`, `nombre`) VALUES
(1, 'Cabeza'),
(2, 'Panza');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `algoritmo`
--
ALTER TABLE `algoritmo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `algoritmo_img`
--
ALTER TABLE `algoritmo_img`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alg_pat`
--
ALTER TABLE `alg_pat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diag_dx`
--
ALTER TABLE `diag_dx`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diag_dx_img`
--
ALTER TABLE `diag_dx_img`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dx_pat`
--
ALTER TABLE `dx_pat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patologias`
--
ALTER TABLE `patologias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patologia_sintoma`
--
ALTER TABLE `patologia_sintoma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sintomas`
--
ALTER TABLE `sintomas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `algoritmo`
--
ALTER TABLE `algoritmo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `algoritmo_img`
--
ALTER TABLE `algoritmo_img`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alg_pat`
--
ALTER TABLE `alg_pat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diag_dx`
--
ALTER TABLE `diag_dx`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diag_dx_img`
--
ALTER TABLE `diag_dx_img`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dx_pat`
--
ALTER TABLE `dx_pat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `img`
--
ALTER TABLE `img`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `patologias`
--
ALTER TABLE `patologias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `patologia_sintoma`
--
ALTER TABLE `patologia_sintoma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sintomas`
--
ALTER TABLE `sintomas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

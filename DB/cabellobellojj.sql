-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2023 a las 05:14:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cabellobellojj`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `i_cita` (IN `date` DATETIME, IN `usr` INT, IN `emp_srv` INT)   BEGIN
	INSERT INTO `cita`(`cita_date`, `user_id`, `emp_srv_id`, `sta_id`) VALUES (`date`,usr,emp_srv,3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_rol` (IN `name` VARCHAR(30), IN `dsc` TEXT)   BEGIN
	INSERT INTO `rol`(`rol_name`, `rol_dsc`) VALUES (name,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_sex` (IN `name` VARCHAR(20), IN `dsc` TEXT)   BEGIN
	INSERT INTO `sex`(`sex_name`, `sex_dsc`) VALUES (`name`,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_srv` (IN `name` VARCHAR(60), IN `cod` VARCHAR(40), IN `dsc` TEXT, IN `img` TEXT, IN `prc` DOUBLE)   BEGIN
	INSERT INTO `srv`(`srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) VALUES (name,cod,dsc,img,prc,3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_sta` (IN `name` VARCHAR(20), IN `dsc` TEXT)   BEGIN
	INSERT INTO sta VALUES (NULL,`name`,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_tyDoc` (IN `name` VARCHAR(30), IN `dsc` TEXT)   BEGIN
	INSERT INTO `tydoc`(`tyDoc_name`, `tyDoc_dsc`) VALUES (`name`,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_cita` (IN `id` INT, IN `changeId` INT, IN `date` DATETIME, IN `usr` INT, IN `emp_srv` INT, IN `sta` INT)   BEGIN
	UPDATE `cita` SET `cita_id`= changeId, `cita_date`= `date`, `user_id`= usr,`emp_srv_id`=emp_srv,`sta_id`= sta WHERE `cita_id` = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_rol` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(30), IN `dsc` TEXT)   BEGIN
	UPDATE rol SET rol_id = changeId WHERE rol_id = id;
    UPDATE rol SET `rol_name` = name, `rol_dsc` = dsc WHERE rol_id = changeId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_sex` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(20), IN `dsc` TEXT)   BEGIN
	UPDATE `sex` SET `sex_id` = changeId WHERE `sex_id` = `id`;
    UPDATE `sex` SET `sex_name` = `name`, `sex_dsc` = dsc WHERE `sex_id` = changeId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_srv` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(60), IN `cod` VARCHAR(40), IN `dsc` TEXT, IN `img` TEXT, IN `prc` DOUBLE, IN `sta` INT)   BEGIN
	UPDATE srv SET srv_id = changeId WHERE srv_id = id;
    UPDATE srv SET srv_name = name, srv_cod = cod, srv_dsc = dsc, srv_img = img, srv_prc = prc, sta_id = sta WHERE srv_id = changeId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_sta` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(20), IN `dsc` TEXT)   BEGIN

	UPDATE `sta` SET `sta_id` = changeId WHERE `sta_id` = `id`;
	UPDATE `sta` SET `sta_name` = `name`, `sta_dsc` = dsc WHERE `sta_id` = changeId;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_tyDoc` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(30), IN `dsc` TEXT)   BEGIN
	UPDATE `tydoc` SET `tyDoc_id` = changeId WHERE `tyDoc_id` = `id`; 
	UPDATE `tydoc` SET `tyDoc_name`= `name`,`tyDoc_dsc`=dsc WHERE `tyDoc_id` = changeId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_cita` ()   BEGIN
	SELECT * FROM cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_citaA` ()   BEGIN
	SELECT * FROM cita WHERE `sta_id` = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_cita_IN_id` (IN `id` INT)   BEGIN
	SELECT * FROM cita WHERE `cita_id` = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_rol` ()   BEGIN
	SELECT * FROM rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_rol_IN_id` (IN `id` INT)   BEGIN
	SELECT * FROM rol WHERE rol_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_sex` ()   BEGIN
	SELECT * FROM `sex`;	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srv` ()   BEGIN
	SELECT `srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id` FROM `srv`;	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srvA` ()   BEGIN
	SELECT `srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id` FROM `srv` WHERE sta_id = 1;	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srv_IN_id` (IN `id` INT)   BEGIN
	SELECT `srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id` FROM `srv` WHERE `srv_id` = id;	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_sta` ()   BEGIN
	SELECT * FROM sta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_tyDoc` ()   BEGIN
	SELECT * FROM `tydoc`;	
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `cita_id` int(11) NOT NULL,
  `cita_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `emp_srv_id` int(11) DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dts`
--

CREATE TABLE `dts` (
  `dts_id` int(11) NOT NULL,
  `dts_name` varchar(80) DEFAULT NULL,
  `dts_lastname` varchar(80) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `tyDoc_id` int(11) DEFAULT NULL,
  `dts_doc` double DEFAULT NULL,
  `dts_bith` date DEFAULT NULL,
  `dts_addr` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp_srv`
--

CREATE TABLE `emp_srv` (
  `emp_srv_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `srv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per`
--

CREATE TABLE `per` (
  `per_id` int(11) NOT NULL,
  `per_name` varchar(80) DEFAULT NULL,
  `per_email` varchar(80) DEFAULT NULL,
  `per_tel` double DEFAULT NULL,
  `per_pass` text DEFAULT NULL,
  `dts_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol_name` varchar(30) DEFAULT NULL,
  `rol_dsc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_name`, `rol_dsc`) VALUES
(1, 'Administrador', '...'),
(2, 'Empleado', '...'),
(3, 'Cliente', '...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sex`
--

CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL,
  `sex_name` varchar(20) DEFAULT NULL,
  `sex_dsc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sex`
--

INSERT INTO `sex` (`sex_id`, `sex_name`, `sex_dsc`) VALUES
(1, 'Hombre', ''),
(2, 'Mujer', ''),
(3, 'Otro', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `srv`
--

CREATE TABLE `srv` (
  `srv_id` int(11) NOT NULL,
  `srv_name` varchar(60) DEFAULT NULL,
  `srv_cod` varchar(40) DEFAULT NULL,
  `srv_dsc` text DEFAULT NULL,
  `srv_img` text DEFAULT NULL,
  `srv_prc` double DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `srv`
--

INSERT INTO `srv` (`srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) VALUES
(1, 'Manicure y pedicure', '001-a', 'Este servicio consiste en un tratamiento para las uñas (de las manos y pies). Ofrecemos el arte y la moda para las uñas, por ejemplo, pintándolas en diferentes estilos, también se aplica, repara y quita uñas postizas o extensiones.', 'https://bonitta.com.mx/wp-content/uploads/2021/03/bonitta_Tipos-de-manicura-profesional.jpg.webp', 40000, 1),
(2, 'Masajes', '002-a', 'Es un tipo de medicina integral en la que un masajista frota y presiona firmemente la piel, los músculos, los tendones y los ligamentos. En la masoterapia, un especialista frota y presiona los tejidos blandos del cuerpo. Los tejidos blandos incluyen músculo, tejido conectivo, tendones, ligamentos y piel.', 'https://velkaspa.com/wp-content/uploads/2022/09/blog_3.jpg', 100000, 1),
(3, 'Maquillaje', '003-a', 'Aplicar cosméticos a alguien o a una parte de su cuerpo, especialmente su rostro, para embellecerlo o modificar su aspecto.', 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/04/04/16490814041338.jpg', 35990, 1),
(4, 'Depilación', '004-a', 'La depilación es una práctica muy común entre las mujeres, que se realiza comúnmente en las cejas, el rostro, las axilas, las piernas y la Zona V. Existen diferentes tipos de depilación íntima, como la cera, cremas, cuchillas y el láser, siendo esta última realizada por un experto.', 'https://www.diariamenteali.com/medias/depilacion-con.cera-crema-o-laser-1900Wx500H?context=bWFzdGVyfGltYWdlc3w5NDcwOXxpbWFnZS9qcGVnfGhhOS9oNzkvOTA3NDM5ODU2MDI4Ni9kZXBpbGFjaW9uLWNvbi5jZXJhLWNyZW1hLW8tbGFzZXIgXzE5MDBXeDUwMEh8ZTJkNTJkYjc0NjZhZWVlZGNkMjU4OTM4OGI4ZTRlZTE5MmMxMDBlZDQzNjhkMmRmMGU2ZDJkMTk3Y2ZhOTc2Ng', 20000, 1),
(5, 'Tratamientos faciales', '005-a', 'Este tratamiento basado en ultrasonidos sirve para mejorar las arrugas y líneas del escote, elevan la piel del cuello, cejar y bajo del mentón. Consiste en estimular con ultrasonidos la producción de nuevo colágeno y elastina en las capas profundas de la piel.', 'https://blog.farmaelglobo.com/wp-content/uploads/2021/06/positive-dark-skinned-woman-with-afro-combed-hair-wears-headband-cares-about-facial-skin-wipes-cheek-with-cosmetic-sponge-keeps-eyes-shut-with-pleasure.jpg', 18000, 1),
(6, 'Cortes De Cabello', '006-a', 'Corte de pelo desfilado, la primera idea que te surge. Es el más común y el primero que te van a ofrecer los peluqueros, porque sigue funcionando como el primer día.', 'https://media.vozpopuli.com/2022/07/cortes-de-pelo-corto.jpeg', 23000, 1),
(7, 'Tratamiento Capilar', '007-a', 'El tratamiento capilar son cuidados que se aplican al cabello y cuya finalidad es mantener la salud y buena apariencia del mismo. Actualmente existen múltiples tratamientos capilares para cada problema, como por ejemplo para tratar la caída del cabello, el pelo graso, hidratar o dar volumen.', 'https://www.todoimplantecapilar.com/wp-content/uploads/2019/09/Tratamientos-para-la-alopecia-7-alternativas-para-tener-en-cuenta.jpg', 80000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sta`
--

CREATE TABLE `sta` (
  `sta_id` int(11) NOT NULL,
  `sta_name` varchar(20) DEFAULT NULL,
  `sta_dsc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sta`
--

INSERT INTO `sta` (`sta_id`, `sta_name`, `sta_dsc`) VALUES
(1, 'Activo', 'Este estado respecta a un usuario o servicio activo en la plataforma'),
(2, 'Inactivo', 'Este estado respecta a un usuario o servicio inactivo en la plataforma'),
(3, 'Por confirmar', 'Este estado respecta a un usuario o servicio en proceso de ser activado en la plataforma ya que requiere de un proceso para este mismo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tydoc`
--

CREATE TABLE `tydoc` (
  `tyDoc_id` int(11) NOT NULL,
  `tyDoc_name` varchar(30) DEFAULT NULL,
  `tyDoc_dsc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tydoc`
--

INSERT INTO `tydoc` (`tyDoc_id`, `tyDoc_name`, `tyDoc_dsc`) VALUES
(1, 'RC', 'Registro Civil'),
(2, 'TI', 'Targeta De Identidad'),
(3, 'CC', 'Cedula Ciudadana'),
(4, 'CE', 'Cedula Extrangera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `sta_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`cita_id`),
  ADD KEY `user_id` (`user_id`,`emp_srv_id`,`sta_id`),
  ADD KEY `cita_emp_srv_idFK_emp_srv_emp_srv_idPK` (`emp_srv_id`),
  ADD KEY `cita_sta_idFK_sta_sta_idPK` (`sta_id`);

--
-- Indices de la tabla `dts`
--
ALTER TABLE `dts`
  ADD PRIMARY KEY (`dts_id`),
  ADD KEY `sex_id` (`sex_id`,`tyDoc_id`),
  ADD KEY `tyDoc_tyDocidPK-dts_tyDoc_idFK` (`tyDoc_id`);

--
-- Indices de la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  ADD PRIMARY KEY (`emp_srv_id`),
  ADD UNIQUE KEY `emp_srv_id` (`emp_srv_id`,`user_id`,`srv_id`),
  ADD KEY `user_id` (`user_id`,`srv_id`),
  ADD KEY `emp_srv_SRV_idFK_srv_srv_idPK` (`srv_id`);

--
-- Indices de la tabla `per`
--
ALTER TABLE `per`
  ADD PRIMARY KEY (`per_id`),
  ADD UNIQUE KEY `per_name` (`per_name`,`per_email`,`per_tel`),
  ADD KEY `dts_id` (`dts_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`),
  ADD UNIQUE KEY `sex_name` (`sex_name`,`sex_dsc`) USING HASH;

--
-- Indices de la tabla `srv`
--
ALTER TABLE `srv`
  ADD PRIMARY KEY (`srv_id`),
  ADD UNIQUE KEY `srv_name` (`srv_name`,`srv_cod`,`srv_dsc`) USING HASH,
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `sta`
--
ALTER TABLE `sta`
  ADD PRIMARY KEY (`sta_id`),
  ADD UNIQUE KEY `sta_name` (`sta_name`,`sta_id`);

--
-- Indices de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  ADD PRIMARY KEY (`tyDoc_id`),
  ADD UNIQUE KEY `tyDoc_name` (`tyDoc_name`,`tyDoc_dsc`) USING HASH;

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `sta_id` (`sta_id`,`rol_id`),
  ADD KEY `rol_rol_idPK-per_rol_idFK` (`rol_id`),
  ADD KEY `dts_id` (`per_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `cita_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dts`
--
ALTER TABLE `dts`
  MODIFY `dts_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  MODIFY `emp_srv_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `per`
--
ALTER TABLE `per`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sex`
--
ALTER TABLE `sex`
  MODIFY `sex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `srv`
--
ALTER TABLE `srv`
  MODIFY `srv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sta`
--
ALTER TABLE `sta`
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  MODIFY `tyDoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_emp_srv_idFK_emp_srv_emp_srv_idPK` FOREIGN KEY (`emp_srv_id`) REFERENCES `emp_srv` (`emp_srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_sta_idFK_sta_sta_idPK` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_user_idFK_user_user_idPK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dts`
--
ALTER TABLE `dts`
  ADD CONSTRAINT `sex_sex_idPK-dts_sex_idFK` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`sex_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tyDoc_tyDocidPK-dts_tyDoc_idFK` FOREIGN KEY (`tyDoc_id`) REFERENCES `tydoc` (`tyDoc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  ADD CONSTRAINT `emp_srv_SRV_idFK_srv_srv_idPK` FOREIGN KEY (`srv_id`) REFERENCES `srv` (`srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_srv_user_idFK_user_user_idPK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `per`
--
ALTER TABLE `per`
  ADD CONSTRAINT `dts_dts_idPK-per_dts_idFK` FOREIGN KEY (`dts_id`) REFERENCES `dts` (`dts_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `srv`
--
ALTER TABLE `srv`
  ADD CONSTRAINT `sta_sta_idPK-srv_sta_idFk` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `rol_rol_idPK-per_rol_idFK` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sta_sta_idPK-user_sta` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `per` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2023 a las 18:37:20
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

CREATE OR REPLACE DATABASE cabellobellojj;
USE cabellobellojj;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `d_user` (IN `id` INT, IN `ema` VARCHAR(80), IN `pass` VARCHAR(80))   BEGIN
	UPDATE `user` SET `sta_id`= 4 WHERE user_id = id AND user_name = ema AND user_pass = pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_agend` (IN `datea` DATETIME)   BEGIN
    	INSERT INTO `agend`(`agend_date`) VALUES (datea);	
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_cita` (IN `date` INT, IN `usr` INT, IN `emp_srv` INT)   BEGIN
	INSERT INTO `cita`(`agend_id`, `user_id`, `emp_srv_id`, `sta_id`) VALUES (`date`,usr,emp_srv,3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_client` (IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `date` DATE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(80), IN `addr` VARCHAR(80))   BEGIN
        DECLARE idPer INT;

        INSERT INTO `per`(`per_name`, `per_lastname`, `sex_id`, `tyDoc_id`, `per_doc`, `per_bith`, `per_addr`) VALUES
        (`name`, lastName, sex, tyDoc, doc, `date`, addr);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `user`(`user_name`, `user_email`, `user_tel`, `user_pass`, `rol_id`, `per_id`, `sta_id`) 
        VALUES (usrName, ema, tel, `pass`, 3, idPer, 3);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_emp` (IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `date` DATE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(80), IN `addr` VARCHAR(80))   BEGIN
        DECLARE idPer INT;
        INSERT INTO `per`(`per_name`, `per_lastname`, `sex_id`, `tyDoc_id`, `per_doc`, `per_bith`, `per_addr`) VALUES
        (`name`, lastName, sex, tyDoc, doc, `date`,addr);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `user`(`user_name`, `user_email`, `user_tel`, `user_pass`, `rol_id`, `per_id`, `sta_id`) 
        VALUES (usrName, ema, tel, `pass`, 2, idPer, 3);
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_agend` (IN `id` INT, IN `changeId` INT, IN `datea` DATETIME)   BEGIN
		UPDATE `agend` SET `agend_id`= changeId WHERE agend_id = id;
        UPDATE `agend` SET agend_date = datea WHERE agend_id = changeId;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_cita` (IN `id` INT, IN `changeId` INT, IN `date` INT, IN `usr` INT, IN `emp_srv` INT, IN `sta` INT)   BEGIN
	UPDATE `cita` SET `cita_id`= changeId, `agend_id`= `date`, `user_id`= usr,`emp_srv_id`=emp_srv,`sta_id`= sta WHERE `cita_id` = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_cita_sta` (IN `id` INT, IN `sta` INT)   BEGIN
		UPDATE cita SET sta_id = sta WHERE cita_id = id;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_user` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `date` DATE, IN `addr` VARCHAR(80), IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(80), IN `rol` INT, IN `sta` INT)   BEGIN

	UPDATE `per` SET `per_id` = changeId WHERE per_id = id;
    
	UPDATE `per` SET `per_name`= name ,`per_lastname`= lastName ,`sex_id`= sex ,`tyDoc_id`= tyDoc ,`per_doc`= doc ,`per_bith`= `date` ,`per_addr`= addr  WHERE per_id = changeId;
    
    UPDATE `user` SET user_name = usrName, user_email = ema, user_tel = tel, user_pass = pass, rol_id = rol , sta_id = sta WHERE user.per_id = changeId;
    
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_user_sta` (IN `id` INT, IN `sta` INT)   BEGIN
	UPDATE `user` SET `sta_id`= sta WHERE user_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_agend` ()   BEGIN
    	SELECT * FROM agend;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_cita` ()   BEGIN
	SELECT `cita_id`, C.agend_id, A.agend_date, C.`user_id`, Pe.per_name, C.`emp_srv_id`, P.per_name, ES.srv_id, S.srv_name, C.`sta_id`, st.sta_name
FROM `cita` C INNER JOIN emp_srv ES on C.emp_srv_id = ES.emp_srv_id
INNER JOIN srv S on ES.srv_id = S.srv_id
INNER JOIN agend A on A.agend_id = C.agend_id
INNER JOIN sta st ON st.sta_id = C.sta_id
INNER JOIN `user` U ON ES.user_id = U.user_id
INNER JOIN per P ON U.per_id = P.per_id
INNER JOIN `user` US ON US.user_id = C.user_id
INNER JOIN `per` Pe ON Pe.per_id = US.per_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_citaA` ()   BEGIN
	SELECT * FROM cita WHERE `sta_id` = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_cita_emp` (IN `id` INT)   BEGIN
        SELECT `cita_id`, C.agend_id, A.agend_date, C.`user_id`, Pe.per_name, C.`emp_srv_id`, ES.user_id, P.per_name, ES.srv_id, S.srv_name, C.`sta_id`, st.sta_name
        FROM `cita` C INNER JOIN emp_srv ES on C.emp_srv_id = ES.emp_srv_id
        INNER JOIN srv S on ES.srv_id = S.srv_id
        INNER JOIN agend A on A.agend_id = C.agend_id
        INNER JOIN sta st ON st.sta_id = C.sta_id
        INNER JOIN `user` U ON ES.user_id = U.user_id
        INNER JOIN per P ON U.per_id = P.per_id
        INNER JOIN `user` US ON US.user_id = C.user_id
        INNER JOIN `per` Pe ON Pe.per_id = US.per_id WHERE U.user_id = id;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_users` ()   BEGIN
		SELECT `user_id`, `user_name`, `user_email`, `user_tel`, `user_pass`, `rol_id`, `sta_id`, P.`per_id`, `per_name`, `per_lastname`, `sex_id`, `tyDoc_id`, `per_doc`, `per_bith`, `per_addr` 
        FROM `user` U INNER JOIN per P ON U.per_id = P.per_id;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usersReg` (IN `usr` VARCHAR(80), IN `pass` VARCHAR(80))   BEGIN
	SELECT U.`user_id`, `user_name`, `user_email`, `user_tel`, 
    `user_pass`, U.`rol_id`, `per_id`, U.`sta_id`, S.sta_name, S.sta_dsc
FROM `user` U INNER JOIN
sta S ON U.sta_id = S.sta_id
WHERE `user_name` = usr OR `user_email` = usr OR `user_tel` = usr AND U.sta_id = 1 AND user_pass = pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_user_id` (IN `ID` INT)   BEGIN 
	SELECT `user_id`, `user_name`, `user_email`, `user_tel`, `user_pass`, `rol_id`, U.`per_id`, `sta_id`, P.per_name, P.per_lastname, P.sex_id, P.tyDoc_id, P.per_doc, P.per_bith, P.per_addr FROM `user` U INNER JOIN `per` P ON U.per_id = P.per_id 
    WHERE U.user_id = ID;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_user_pass` (IN `correo` VARCHAR(80))   BEGIN
    	SELECT * FROM `user` where user_email = correo;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_user_repeat` (IN `usrname` VARCHAR(80), IN `email` VARCHAR(80), IN `tel` DOUBLE, IN `doc` DOUBLE)   BEGIN
SELECT `user_id`, `user_name`, `user_email`, `user_tel`, `user_pass`, U.`per_id`,P.per_doc from `user` U INNER JOIN per P ON U.per_id = P.per_id 
WHERE `user_name` = usrname or `user_email` = email or `user_tel` = tel or P.per_doc = doc;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agend`
--

CREATE TABLE `agend` (
  `agend_id` int(11) NOT NULL,
  `agend_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agend`
--

INSERT INTO `agend` (`agend_id`, `agend_date`) VALUES
(1, '2023-09-01 10:25:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `caja_id` int(11) NOT NULL,
  `caja_numModulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numModulo`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_user`
--

CREATE TABLE `caja_user` (
  `caja_user_id` int(11) NOT NULL,
  `caja_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `cita_id` int(11) NOT NULL,
  `agend_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `emp_srv_id` int(11) DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`cita_id`, `agend_id`, `user_id`, `emp_srv_id`, `sta_id`) VALUES
(2, 1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp_srv`
--

CREATE TABLE `emp_srv` (
  `emp_srv_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `srv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emp_srv`
--

INSERT INTO `emp_srv` (`emp_srv_id`, `user_id`, `srv_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fin`
--

CREATE TABLE `fin` (
  `fin_id` int(11) NOT NULL,
  `fin_total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `his_fin`
--

CREATE TABLE `his_fin` (
  `his_fin_id` int(11) NOT NULL,
  `his_type_id` int(11) DEFAULT NULL,
  `fin_id` int(11) DEFAULT NULL,
  `his_fin_monto` double DEFAULT NULL,
  `recivo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `his_type`
--

CREATE TABLE `his_type` (
  `his_type_id` int(11) NOT NULL,
  `his_type_name` varchar(20) DEFAULT NULL,
  `his_type_dsc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per`
--

CREATE TABLE `per` (
  `per_id` int(11) NOT NULL,
  `per_name` varchar(80) DEFAULT NULL,
  `per_lastname` varchar(80) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `tyDoc_id` int(11) DEFAULT NULL,
  `per_doc` double DEFAULT NULL,
  `per_bith` date DEFAULT NULL,
  `per_addr` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `per`
--

INSERT INTO `per` (`per_id`, `per_name`, `per_lastname`, `sex_id`, `tyDoc_id`, `per_doc`, `per_bith`, `per_addr`) VALUES
(1, 'Juali', 'ape', 1, 3, 123123123, '1200-12-12', 'kr'),
(2, 'juli1', 'Poster', 1, 3, 1232121211, '0012-12-03', 'kr1a'),
(3, 'juli', 'Pastrana', 1, 3, 1012000, '0012-12-10', 'kr'),
(4, 'Sebastian David', 'Jara', 3, 2, 1321231231, '2023-08-15', 'kr'),
(7, 'Esteban', 'juan', 2, 3, 1012121212, '1111-01-01', 'adsdasdfasdfa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `recivo_id` int(11) NOT NULL,
  `cita_id` int(11) DEFAULT NULL,
  `recivo_time` datetime DEFAULT NULL,
  `caja_user_id` int(11) DEFAULT NULL
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
(3, 'Por confirmar', 'Este estado respecta a un usuario o servicio en proceso de ser activado en la plataforma ya que requiere de un proceso para este mismo'),
(4, 'inhabilitado', 'El usuario borro la cuenta');

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
  `user_name` varchar(80) DEFAULT NULL,
  `user_email` varchar(80) DEFAULT NULL,
  `user_tel` double DEFAULT NULL,
  `user_pass` text DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `per_id` int(11) DEFAULT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_tel`, `user_pass`, `rol_id`, `per_id`, `sta_id`) VALUES
(1, 'ruben:d', 's@a.a', 3211231212, 'pas', 3, 1, 1),
(2, 'juli1231', 'juli1233211@gmail.com', 12312312123, '1233213', 2, 2, 1),
(3, 'gamil', 'juli123321@gmail.com', 1231231212, '123321', 2, 3, 1),
(4, 'feoasdafsadf', 'a@a.a', 3211231212, '123123', 3, 4, 3),
(5, 'Esteban123', 'sisoyyosebastian@gmail.com', 3211231212123, '123123', 3, 7, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agend`
--
ALTER TABLE `agend`
  ADD PRIMARY KEY (`agend_id`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`),
  ADD UNIQUE KEY `caja_numModulo` (`caja_numModulo`);

--
-- Indices de la tabla `caja_user`
--
ALTER TABLE `caja_user`
  ADD PRIMARY KEY (`caja_user_id`),
  ADD KEY `caja_id` (`caja_id`,`user_id`),
  ADD KEY `user_user_idPK-caja_user_user_idFK` (`user_id`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`cita_id`),
  ADD KEY `user_id` (`user_id`,`emp_srv_id`,`sta_id`),
  ADD KEY `cita_emp_srv_idFK_emp_srv_emp_srv_idPK` (`emp_srv_id`),
  ADD KEY `cita_sta_idFK_sta_sta_idPK` (`sta_id`),
  ADD KEY `change_id` (`agend_id`);

--
-- Indices de la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  ADD PRIMARY KEY (`emp_srv_id`),
  ADD UNIQUE KEY `emp_srv_id` (`emp_srv_id`,`user_id`,`srv_id`),
  ADD KEY `user_id` (`user_id`,`srv_id`),
  ADD KEY `emp_srv_SRV_idFK_srv_srv_idPK` (`srv_id`);

--
-- Indices de la tabla `fin`
--
ALTER TABLE `fin`
  ADD PRIMARY KEY (`fin_id`);

--
-- Indices de la tabla `his_fin`
--
ALTER TABLE `his_fin`
  ADD PRIMARY KEY (`his_fin_id`),
  ADD KEY `fin_id` (`fin_id`,`his_type_id`),
  ADD KEY `his_type_his_type_idPK-his_fin_his_type_idFK` (`his_type_id`),
  ADD KEY `recivo_id` (`recivo_id`);

--
-- Indices de la tabla `his_type`
--
ALTER TABLE `his_type`
  ADD PRIMARY KEY (`his_type_id`);

--
-- Indices de la tabla `per`
--
ALTER TABLE `per`
  ADD PRIMARY KEY (`per_id`),
  ADD UNIQUE KEY `per_doc` (`per_doc`),
  ADD KEY `sex_id` (`sex_id`,`tyDoc_id`),
  ADD KEY `tyDoc_tyDocidPK-per_tyDoc_idFK` (`tyDoc_id`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`recivo_id`),
  ADD KEY `cita_id` (`cita_id`,`caja_user_id`),
  ADD KEY `caja_user_caja_user_idPK-recibo_caja_user_idFK` (`caja_user_id`);

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
  ADD UNIQUE KEY `user_name` (`user_name`,`user_email`,`user_tel`,`per_id`),
  ADD UNIQUE KEY `user_name_2` (`user_name`,`user_email`,`user_tel`),
  ADD KEY `per_id` (`per_id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agend`
--
ALTER TABLE `agend`
  MODIFY `agend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `caja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `caja_user`
--
ALTER TABLE `caja_user`
  MODIFY `caja_user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `cita_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  MODIFY `emp_srv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fin`
--
ALTER TABLE `fin`
  MODIFY `fin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `his_fin`
--
ALTER TABLE `his_fin`
  MODIFY `his_fin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `his_type`
--
ALTER TABLE `his_type`
  MODIFY `his_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `per`
--
ALTER TABLE `per`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `recibo`
--
ALTER TABLE `recibo`
  MODIFY `recivo_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  MODIFY `tyDoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja_user`
--
ALTER TABLE `caja_user`
  ADD CONSTRAINT `caja_caja_idPK-caja_user_caja_idFK` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_user_idPK-caja_user_user_idFK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_agend_idFK_agend_gend_idPK` FOREIGN KEY (`agend_id`) REFERENCES `agend` (`agend_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_emp_srv_idFK_emp_srv_emp_srv_idPK` FOREIGN KEY (`emp_srv_id`) REFERENCES `emp_srv` (`emp_srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_sta_idFK_sta_sta_idPK` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_user_idFK_user_user_idPK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  ADD CONSTRAINT `emp_srv_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_srv_ibfk_2` FOREIGN KEY (`srv_id`) REFERENCES `srv` (`srv_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `his_fin`
--
ALTER TABLE `his_fin`
  ADD CONSTRAINT `fin_fin_idPK-his_fin_fin_idFK` FOREIGN KEY (`fin_id`) REFERENCES `fin` (`fin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `his_fin_ibfk_1` FOREIGN KEY (`recivo_id`) REFERENCES `recibo` (`recivo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `his_type_his_type_idPK-his_fin_his_type_idFK` FOREIGN KEY (`his_type_id`) REFERENCES `his_type` (`his_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `per`
--
ALTER TABLE `per`
  ADD CONSTRAINT `sex_sex_idPK-per_sex_idFK` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`sex_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tyDoc_tyDocidPK-per_tyDoc_idFK` FOREIGN KEY (`tyDoc_id`) REFERENCES `tydoc` (`tyDoc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `caja_user_caja_user_idPK-recibo_caja_user_idFK` FOREIGN KEY (`caja_user_id`) REFERENCES `caja_user` (`caja_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_cita_idPK-recibo_cita_idFK` FOREIGN KEY (`cita_id`) REFERENCES `cita` (`cita_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
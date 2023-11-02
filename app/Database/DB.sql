-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2023 a las 17:47:14
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

drop database if not exists cabellobellojj;
CREATE database cabellobellojj;
use cabellobellojj;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `d_agn` (IN `id` INT)   BEGIN 
	DELETE FROM ang WHERE agn.agn_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `d_cita` (IN `id` INT)   BEGIN DELETE FROM cita WHERE cita.cita_id = id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `d_rol` (IN `id` INT)   BEGIN 
	DELETE FROM rol WHERE rol_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `d_sex` (IN `id` INT)   BEGIN 
DELETE FROM sex where sex_id = id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `d_sta` (IN `id` INT)   BEGIN 
	DELETE FROM sta WHERE sta_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `d_tyDoc` (IN `id` INT)   BEGIN 
DELETE FROM tydoc where tydoc_id = id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `d_usr` (IN `id` INT)   BEGIN 
	DELETE FROM per WHERE per_id = (SELECT per_id FROM usr WHERE usr_id = id);
    DELETE from usr where usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_agn` (IN `dt` DATETIME)   BEGIN 
    INSERT INTO `agn` (agn_dt) VALUES (dt);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_cita` (IN `agn` INT, IN `emp` INT, IN `usr` INT, IN `sta` INT)   BEGIN
	INSERT INTO cita (`agn_id`, `emp_id`, `usr_id`, `sta_id`) VALUES ( agn, emp, usr, sta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_client` (IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `date` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(60), IN `addr` VARCHAR(80))   BEGIN
        DECLARE idPer INT;

        INSERT INTO `per`(`per_nm`, `per_ltnm`, `per_bithDt`, `sex_id`, `tyDoc_id`, `per_doc`, `per_addr`) VALUES
        (`name`, lastName, `date`, sex, tyDoc, doc, addr);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `usr` 
        (`usr_nm`, `usr_ema`, `usr_tel`, `usr_pass`, `rol_id`, `per_id`, `sta_id`)  
        VALUES (usrName, ema, tel, `pass`, 3, idPer, 3);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_emp` (IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `date` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(80), IN `addr` VARCHAR(80), IN `srvID` INT)   BEGIN
        DECLARE idPer INT;
        DECLARE idUsr INT;

        INSERT INTO `per`(`per_nm`, `per_ltnm`, `per_bithDt`, `sex_id`, `tyDoc_id`, `per_doc`, `per_addr`) VALUES
        (`name`, lastName, `date`, sex, tyDoc, doc, addr);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `usr` 
        (`usr_nm`, `usr_ema`, `usr_tel`, `usr_pass`, `rol_id`, `per_id`, `sta_id`)  
        VALUES (usrName, ema, tel, `pass`, 2, idPer, 3);
        SET idUsr = LAST_INSERT_ID();
        
        INSERT INTO emp 
        (`usr_id`,`srv_id`) 
        VALUES (idUsr,`srvID`);
        
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_mdl` (IN `name` VARCHAR(40), IN `url` VARCHAR(100), IN `dsc` TEXT)   BEGIN
	INSERT INTO mdl ( mdl_nm,mdl_url,mdl_dsc ) VALUES (name, url, dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_rol` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO `rol`(`rol_nm`, `rol_dsc`) VALUES (name,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_rol_mdl` (IN `rol` INT, IN `mdl` INT)   BEGIN
	INSERT INTO rol_mdl ( rol_id, mdl_id ) VALUES (rol, mdl);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_sex` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO `sex`(`sex_nm`, `sex_dsc`) VALUES (`name`,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_srv` (IN `name` VARCHAR(80), IN `dsc` TEXT, IN `tm` INT, IN `img` TEXT, IN `prc` DOUBLE)   BEGIN
	INSERT INTO `srv`(`srv_nm`, `srv_dsc`, `srv_tm`, `srv_img`, `srv_cost`, `sta_id`) VALUES (name,dsc,tm,img,prc,3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_sta` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO sta VALUES (NULL,`name`,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_tyDoc` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO `tydoc`(`tyDoc_nm`, `tyDoc_dsc`) VALUES (`name`,dsc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `typeData` VARCHAR(8), IN `data` VARCHAR(80))   BEGIN
    SELECT U.usr_id, U.usr_pass, U.rol_id, S.sta_id, S.sta_nm FROM usr U INNER JOIN sta S ON U.sta_id = S.sta_id
WHERE
    CASE typeData 
        WHEN 'usr_nm' THEN U.usr_nm
        WHEN 'usr_ema' THEN U.usr_ema
        WHEN 'usr_tel' THEN U.usr_tel
    END = `data`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_agn` (IN `id` INT, IN `dt` DATETIME)   BEGIN
    UPDATE agn SET agn_dt = dt WHERE agn_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_cita` (IN `id` INT, IN `agn` INT, IN `emp` INT, IN `usr` INT, IN `sta` INT)   BEGIN
    UPDATE `cita` SET `agn_id`= agn,`emp_id`= emp ,`usr_id`=usr ,`sta_id`= sta WHERE cita.cita_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_emp_srv` (IN `id` INT, IN `srv` INT)   BEGIN
	UPDATE emp E SET E.srv_id = srv WHERE E.srv_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_mdl` (IN `id` INT, IN `name` VARCHAR(40), IN `url` VARCHAR(100), IN `dsc` TEXT)   BEGIN
	UPDATE mdl SET mdl_nm = name, mdl_url = url, mdl_dsc = dsc WHERE mdl.mdl_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_rol` (IN `id` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
    UPDATE rol SET `rol_nm` = name, `rol_dsc` = dsc WHERE rol_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_rol_mdl` (IN `id` INT, IN `rol` INT, IN `mdl` INT)   BEGIN 
	UPDATE rol_mdl SET rol_id = rol, mdl_id = mdl WHERE rol_mdl_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_sex` (IN `id` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
    UPDATE `sex` SET `sex_nm` = `name`, `sex_dsc` = dsc WHERE `sex_id` = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_srv` (IN `id` INT, IN `name` VARCHAR(80), IN `dsc` TEXT, IN `ti` INT, IN `img` TEXT, IN `prc` DOUBLE, IN `sta` INT)   BEGIN
    UPDATE srv SET srv_name = name, srv_dsc = dsc, srv_tm = ti ,srv_img = img, srv_cost = prc, sta_id = sta WHERE srv_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_srv_sta` (IN `id` INT, IN `sta` INT)   BEGIN
	UPDATE srv SR SET SR.sta_id = sta WHERE SR.srv_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_sta` (IN `id` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	UPDATE `sta` SET `sta_nm` = `name`, `sta_dsc` = dsc WHERE `sta_id` = id;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_tyDoc` (IN `id` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN 
	UPDATE `tydoc` SET `tyDoc_nm`= `name`,`tyDoc_dsc`=dsc WHERE `tyDoc_id` = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_usr` (IN `id` INT, IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `date` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `addr` VARCHAR(80))   BEGIN
    UPDATE `usr`
    INNER JOIN `per` ON `usr`.`per_id` = `per`.`per_id`
    SET 
    `usr`.`usr_nm` = `usrName`, 
    `usr`.`usr_ema` = `ema`, 
    `usr`.`usr_tel` = `tel`, 
    `per`.`per_nm` = `name`, 
    `per`.`per_ltnm` = `lastName`,
    `per`.`sex_id` = `sex`,
    `per`.`tyDoc_id` = `tyDoc`,
    `per`.`per_doc` = `doc`,
    `per`.`per_bithDt` = `date`,
    `per`.`per_addr` = `addr`
    WHERE `usr`.`usr_id` = `id` AND `per`.`per_id` = `id`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_usr_pass` (IN `id` INT, IN `pass` VARCHAR(60))   BEGIN
	UPDATE usr U SET U.usr_pass = pass WHERE U.usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_usr_rol` (IN `id` INT, IN `rol` INT)   BEGIN
    -- Obtener el rol anterior del usuario
    DECLARE old_role INT;
    SELECT rol_id INTO old_role FROM usr WHERE usr_id = id;
    
    -- Actualizar el rol en la tabla usr
    UPDATE usr SET rol_id = rol WHERE usr_id = id;

    -- Si el rol anterior era 2, eliminar el registro en la tabla emp
    IF old_role = 2 THEN
        DELETE FROM emp WHERE usr_id = id;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_usr_rol_emp` (IN `id` INT, IN `srv` INT)   BEGIN
	UPDATE usr U SET U.rol_id = 2 WHERE U.usr_id = id;
    
    INSERT INTO emp 
    (usr_id, srv_id) VALUES (id,srv);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_usr_sta` (IN `id` INT, IN `sta` INT)   BEGIN
	UPDATE `usr` SET `sta_id`= sta WHERE usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_agns` ()   BEGIN
	SELECT * FROM agn;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_cita` (IN `id` INT)   BEGIN SELECT *FROM cita WHERE cita.cita_id = id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_citas` ()   BEGIN 
	SELECT * FROM cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_citas_sta` (IN `sta` INT)   BEGIN
	SELECT *FROM cita WHERE cita.sta_id = sta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_cita_sta` (IN `id` INT, IN `sta` INT)   BEGIN
	SELECT *FROM cita WHERE cita.sta_id = sta AND cita_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_emp` (IN `id` INT)   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, Pe.srv_id, Sr.srv_nm, Sr.srv_dsc, Sr.srv_tm, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    INNER JOIN emp Pe ON U.usr_id = Pe.usr_id
    INNER JOIN srv Sr ON Pe.srv_id = Sr.srv_id
    WHERE U.usr_id = id AND U.rol_id = 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_emps` ()   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, Pe.srv_id, Sr.srv_nm, Sr.srv_dsc, Sr.srv_tm, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    INNER JOIN emp Pe ON U.usr_id = Pe.usr_id
    INNER JOIN srv Sr ON Pe.srv_id = Sr.srv_id
    WHERE U.rol_id = 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_mdl` (IN `id` INT)   BEGIN 
	SELECT * FROM mdl WHERE mdl_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_mdls` ()   BEGIN 
	SELECT * FROM mdl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_per` (IN `id` INT)   BEGIN
	SELECT U.usr_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr FROM usr U 
    INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_reg` (IN `id` INT)   BEGIN
	SELECT * FROM usr U WHERE U.usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_regs` ()   BEGIN
	SELECT * FROM usr U;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_rol` (IN `id` INT)   BEGIN 
	SELECT * FROM rol WHERE rol_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_rols` ()   BEGIN 
	SELECT * FROM rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_rol_mdl` (IN `id` INT)   BEGIN 	
	SELECT * FROM rol_mdl WHERE rol_mdl_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_rol_mdls` ()   BEGIN 	
	SELECT * FROM rol_mdl;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_sex` (IN `id` INT)   BEGIN 
SELECT * FROM sex where sex_id = id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_sexs` ()   BEGIN
	SELECT * FROM sex;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srv` (IN `id` INT)   BEGIN
	SELECT * FROM srv WHERE srv.srv_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srvs` ()   BEGIN
	SELECT * FROM srv;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srvs_sta` (IN `rol` INT)   BEGIN
	SELECT *FROM srv WHERE srv.sta_id = rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srv_sta` (IN `id` INT, IN `rol` INT)   BEGIN
	SELECT *FROM srv WHERE srv.sta_id = rol AND srv.srv_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_sta` (IN `id` INT)   BEGIN
	SELECT * FROM sta where sta_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_stas` ()   BEGIN 
	SELECT*from sta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_tyDoc` (IN `id` INT)   BEGIN 
SELECT * FROM tydoc where tydoc_id = id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_tyDocs` ()   BEGIN
	SELECT * FROM tyDoc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usr` (IN `id` INT)   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usrs` ()   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usrs_sta` (IN `sta` INT)   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.sta_id = sta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usr_mdl` (IN `id` INT)   BEGIN
SELECT MO.mdl_nm,MO.mdl_url FROM rol_mdl RM
INNER JOIN mdl MO ON RM.mdl_id=MO.mdl_id
WHERE RM.rol_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usr_sta` (IN `id` INT, IN `sta` INT)   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.usr_id = id AND U.sta_id = sta;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agn`
--

CREATE TABLE `agn` (
  `agn_id` int(11) NOT NULL,
  `agn_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agn`
--

INSERT INTO `agn` (`agn_id`, `agn_dt`) VALUES
(1, '2023-10-24 07:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `cita_id` int(11) NOT NULL,
  `agn_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp`
--

CREATE TABLE `emp` (
  `emp_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `srv_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl`
--

CREATE TABLE `mdl` (
  `mdl_id` int(11) NOT NULL,
  `mdl_nm` varchar(40) DEFAULT NULL,
  `mdl_url` varchar(100) DEFAULT NULL,
  `mdl_dsc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mdl`
--

INSERT INTO `mdl` (`mdl_id`, `mdl_nm`, `mdl_url`, `mdl_dsc`) VALUES
(1, 'Home', 'home\\show', 'Esta es la vista central a la cuál el usuario entrará de primeras sino a iniciado sesión.'),
(2, 'Servicios', 'usr\\showSrv', 'Esta es la vista donde los usuarios pueden observar los servicios activos en la página'),
(3, 'Citas', 'person\\showCitas', NULL),
(4, 'Perfil', 'usr\\showPerfil', NULL),
(5, 'Agendamiento', 'person\\showAgn', NULL),
(7, 'Login', 'guest\\showLogin', NULL),
(8, 'Register', 'guest\\showRegister', NULL),
(11, 'Reporte', 'person/repShow', NULL),
(12, 'Delete Usr', 'usr/showDelete', NULL),
(13, 'LogOut', 'usr/logOut', NULL),
(14, 'Servicios', 'admin/srv', 'Vista de admin sobre los servicios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per`
--

CREATE TABLE `per` (
  `per_id` int(11) NOT NULL,
  `per_nm` varchar(80) NOT NULL,
  `per_ltnm` varchar(80) NOT NULL,
  `per_bithdt` date DEFAULT NULL,
  `sex_id` int(11) NOT NULL,
  `tyDoc_id` int(11) NOT NULL,
  `per_doc` double NOT NULL,
  `per_addr` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `per`
--

INSERT INTO `per` (`per_id`, `per_nm`, `per_ltnm`, `per_bithdt`, `sex_id`, `tyDoc_id`, `per_doc`, `per_addr`) VALUES
(2, 'julian', 'Barbosa', '0021-12-21', 3, 2, 1233121212, 'kr'),
(3, 'Sebastian', 'Jaramillo', '2023-10-03', 1, 2, 1232121212, 'kr11 No 67 A 66 '),
(4, 'juan', 'lopps', '6554-05-12', 5, 4, 1234567890, 'call#sapoxd'),
(5, 'Geoff', 'Carlo', '1984-11-13', 1, 3, 9323710, 'Cl 15 15-15'),
(6, 'julai', 'asdfe', '0002-12-12', 2, 4, 234123123, 'krasadf'),
(9, 'Sebastian', 'JAramillo', '2006-12-30', 4, 5, 1, 'kr11 '),
(12, 'Sebastian', 'JAramillo', '2023-10-31', 1, 1, 12312, 'kr11 '),
(17, 'Sebastian', 'JAramillo', '2023-10-04', 2, 3, 3523461624641, 'kr11 ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol_nm` varchar(40) NOT NULL,
  `rol_dsc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_nm`, `rol_dsc`) VALUES
(1, 'Administrador', 'Es la persona que está a cargo de la tienda y se encarga de tomar las decisiones importantes, como el inventario, el marketing y el personal.'),
(2, 'Empleado', 'Es la persona que trabaja en la tienda y se encarga de atender a los clientes, realizar las ventas y mantener la tienda en orden.'),
(3, 'Cliente', 'Es la persona que visita la tienda para comprar productos o servicios.'),
(4, 'Guest', 'Este es un invitado (usuario no registrado)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_mdl`
--

CREATE TABLE `rol_mdl` (
  `rol_mdl_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `mdl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_mdl`
--

INSERT INTO `rol_mdl` (`rol_mdl_id`, `rol_id`, `mdl_id`) VALUES
(16, 1, 13),
(15, 1, 14),
(14, 2, 14),
(2, 3, 1),
(3, 3, 2),
(4, 3, 4),
(5, 3, 5),
(6, 3, 11),
(7, 3, 13),
(8, 4, 1),
(9, 4, 7),
(10, 4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sex`
--

CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL,
  `sex_nm` varchar(40) NOT NULL,
  `sex_dsc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sex`
--

INSERT INTO `sex` (`sex_id`, `sex_nm`, `sex_dsc`) VALUES
(1, 'Masculino', 'Se identifica con las características sociales, culturales y psicológicas asociadas a los hombres.'),
(2, 'Femenino', 'Se identifica con las características sociales, culturales y psicológicas asociadas a las mujeres.'),
(3, 'No binario', 'No se identifica con ninguno de los géneros binarios, masculino o femenino.'),
(4, 'Intergénero', 'Se identifica con una combinación de características de ambos géneros binarios, masculino o femenino.'),
(5, 'Género fluido', 'Su identidad de género cambia con el tiempo.'),
(6, 'Agénero', 'No se identifica con ningún género.'),
(7, 'Bigénero', 'Se identifica con dos géneros, masculino y femenino.'),
(8, 'Poligénero', 'Se identifica con tres o más géneros.'),
(9, 'Demigénero', 'Se identifica parcialmente con un género, pero no completamente.'),
(10, 'Genderqueer', 'Se identifica con un género que no se ajusta a las normas sociales tradicionales.'),
(11, 'Ninguno de los anteriores', 'Escribe con que género te identificas que no corresponda a los que están en el formulario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `srv`
--

CREATE TABLE `srv` (
  `srv_id` int(11) NOT NULL,
  `srv_nm` varchar(80) NOT NULL,
  `srv_dsc` text NOT NULL,
  `srv_tm` int(11) NOT NULL,
  `srv_img` text NOT NULL,
  `srv_cost` double NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `srv`
--

INSERT INTO `srv` (`srv_id`, `srv_nm`, `srv_dsc`, `srv_tm`, `srv_img`, `srv_cost`, `sta_id`) VALUES
(1, 'Manicure y pedicure', 'Este servicio consiste en un tratamiento para las uñas (de las manos y pies). Ofrecemos el arte y la moda para las uñas, por ejemplo, pintándolas en diferentes estilos, también se aplica, repara y quita uñas postizas o extensiones.', 30, 'https://bonitta.com.mx/wp-content/uploads/2021/03/bonitta_Tipos-de-manicura-profesional.jpg.webp', 40000, 1),
(2, 'Masajes', 'Es un tipo de medicina integral en la que un masajista frota y presiona firmemente la piel, los músculos, los tendones y los ligamentos. En la masoterapia, un especialista frota y presiona los tejidos blandos del cuerpo. Los tejidos blandos incluyen músculo, tejido conectivo, tendones, ligamentos y piel.', 40, 'https://velkaspa.com/wp-content/uploads/2022/09/blog_3.jpg', 100000, 1),
(3, 'Maquillaje', 'Aplicar cosméticos a alguien o a una parte de su cuerpo, especialmente su rostro, para embellecerlo o modificar su aspecto.', 30, 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/04/04/16490814041338.jpg', 35990, 1),
(4, 'Depilación', 'La depilación es una práctica muy común entre las mujeres, que se realiza comúnmente en las cejas, el rostro, las axilas, las piernas y la Zona V. Existen diferentes tipos de depilación íntima, como la cera, cremas, cuchillas y el láser, siendo esta última realizada por un experto.', 35, 'https://www.diariamenteali.com/medias/depilacion-con.cera-crema-o-laser-1900Wx500H?context=bWFzdGVyfGltYWdlc3w5NDcwOXxpbWFnZS9qcGVnfGhhOS9oNzkvOTA3NDM5ODU2MDI4Ni9kZXBpbGFjaW9uLWNvbi5jZXJhLWNyZW1hLW8tbGFzZXIgXzE5MDBXeDUwMEh8ZTJkNTJkYjc0NjZhZWVlZGNkMjU4OTM4OGI4ZTRlZTE5MmMxMDBlZDQzNjhkMmRmMGU2ZDJkMTk3Y2ZhOTc2Ng', 20000, 1),
(5, 'Tratamientos faciales', 'Este tratamiento basado en ultrasonidos sirve para mejorar las arrugas y líneas del escote, elevan la piel del cuello, cejar y bajo del mentón. Consiste en estimular con ultrasonidos la producción de nuevo colágeno y elastina en las capas profundas de la piel.', 25, 'https://blog.farmaelglobo.com/wp-content/uploads/2021/06/positive-dark-skinned-woman-with-afro-combed-hair-wears-headband-cares-about-facial-skin-wipes-cheek-with-cosmetic-sponge-keeps-eyes-shut-with-pleasure.jpg', 18000, 1),
(6, 'Cortes De Cabello', 'Corte de pelo desfilado, la primera idea que te surge. Es el más común y el primero que te van a ofrecer los peluqueros, porque sigue funcionando como el primer día.', 15, 'https://v2.cdnpk.net/videvo_files/video/premium/partners0659/thumbnails/BB_f81872fc-e7d0-4cec-a626-a106df0b756f_small.jpg', 23000, 1),
(7, 'Tratamiento Capilar', 'El tratamiento capilar son cuidados que se aplican al cabello y cuya finalidad es mantener la salud y buena apariencia del mismo. Actualmente existen múltiples tratamientos capilares para cada problema, como por ejemplo para tratar la caída del cabello, el pelo graso, hidratar o dar volumen.', 30, 'https://www.todoimplantecapilar.com/wp-content/uploads/2019/09/Tratamientos-para-la-alopecia-7-alternativas-para-tener-en-cuenta.jpg', 80000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sta`
--

CREATE TABLE `sta` (
  `sta_id` int(11) NOT NULL,
  `sta_nm` varchar(40) NOT NULL,
  `sta_dsc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sta`
--

INSERT INTO `sta` (`sta_id`, `sta_nm`, `sta_dsc`) VALUES
(1, 'Activo', 'Este estado respecta a un usuario o servicio activo en la plataforma'),
(2, 'Inactivo', 'Este estado respecta a un usuario o servicio inactivo en la plataforma'),
(3, 'Por confirmar', 'Este estado respecta a un usuario o servicio en proceso de ser activado en la plataforma ya que requiere de un proceso para este mismo'),
(4, 'inhabilitado', 'Se \"Elimino\" el registro.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turn`
--

CREATE TABLE `turn` (
  `turn_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `turn_dt` date NOT NULL,
  `turn_ini` time NOT NULL,
  `turn_end` time NOT NULL,
  `tyTurn_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tydoc`
--

CREATE TABLE `tydoc` (
  `tyDoc_id` int(11) NOT NULL,
  `tyDoc_nm` varchar(40) NOT NULL,
  `tyDoc_dsc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tydoc`
--

INSERT INTO `tydoc` (`tyDoc_id`, `tyDoc_nm`, `tyDoc_dsc`) VALUES
(1, 'Registro civil de nacimiento', 'Es un documento público que acredita la filiación de una persona. Es expedido por la Registraduría Nacional del Estado Civil, y contiene la información personal de la persona, como su nombre completo, fecha y lugar de nacimiento, sexo, filiación y nacionalidad.'),
(2, 'Tarjeta de identidad', 'Es un documento público que identifica a las personas menores de edad de 7 a 17 años. Es expedido por la Registraduría Nacional del Estado Civil, y contiene la información personal de la persona, como su nombre completo, fecha y lugar de nacimiento, sexo, filiación, huella dactilar y grupo sanguíneo.'),
(3, 'Cédula de ciudadanía', 'Es un documento público que identifica a las personas mayores de edad. Es expedido por la Registraduría Nacional del Estado Civil, y contiene la información personal de la persona, como su nombre completo, fecha y lugar de nacimiento, sexo, filiación, huella dactilar, grupo sanguíneo y número de identificación personal (NIP).'),
(4, 'Tarjeta de extranjería', 'Es un documento público que identifica a los extranjeros residentes en Colombia. Es expedido por la Unidad Administrativa Especial Migración Colombia, y contiene la información personal del extranjero, como su nombre completo, fecha y lugar de nacimiento, nacionalidad, documento de identidad extranjero y número de identificación de extranjería (NIE).'),
(5, 'Pasaporte', 'Es un documento público que permite a los ciudadanos colombianos viajar al exterior. Es expedido por la Unidad Administrativa Especial Migración Colombia, y contiene la información personal del titular, como su nombre completo, fecha y lugar de nacimiento, nacionalidad, foto, firma y número de pasaporte.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tytrun`
--

CREATE TABLE `tytrun` (
  `tyTurn_id` int(11) NOT NULL,
  `tyTurn_nm` varchar(40) NOT NULL,
  `tyTurn_dsc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tytrun`
--

INSERT INTO `tytrun` (`tyTurn_id`, `tyTurn_nm`, `tyTurn_dsc`) VALUES
(1, 'Trabaja', 'Esta opción corresponde a un turno de trabajo denotado dentro de un horario establecido o a establecer según el calendario'),
(2, 'Descansa', 'Esta opción corresponde a un \"turno\" de descanso que tiene el empleado dentro del sistema denotado dentro de un horario establecido o a establecer según el calendario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE `usr` (
  `usr_id` int(11) NOT NULL,
  `usr_nm` varchar(80) NOT NULL,
  `usr_ema` varchar(80) NOT NULL,
  `usr_tel` double NOT NULL,
  `usr_pass` varchar(60) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usr`
--

INSERT INTO `usr` (`usr_id`, `usr_nm`, `usr_ema`, `usr_tel`, `usr_pass`, `rol_id`, `per_id`, `sta_id`) VALUES
(2, 'juan123', 'Juanito@mail.co', 305, '$2y$10$yTv.sEgs2oJzfdFY/brSu.6v179sRN8uDK2VAzvnxcHMyd9nSGyui', 3, 2, 1),
(3, 'superArmadillo', 'sisoyyosebastian@gmail.com', 3042312132, '$2y$10$JKlHPy6Abf4VVyrpm8z9duZ.i1/g90g4gytXUsBk7fcoiA7X6X2iG', 3, 3, 1),
(4, 'xd', 'hola@gmail.com', 1313544258, '$2y$10$sED7ovNeRw7GbHHSl5wL5evh5mgtcPlTHkTZMeZ9rsXkvCkhv4DtS', 3, 4, 3),
(5, 'Geoffcarlo', 'Ggg@hotmail.com', 3112892166, '$2y$10$QkHdOhvtqFP1XyoNddmOGeA2TnAo5OMXMjoAd8pTp7MU.8q5icZeO', 3, 5, 3),
(6, 'admin', 'a@.aaa', 1231231212, '$2y$10$qRSxhKWhIC9RcurkDqnaX.oPuxDJT5mY9FSz3ArdFnFf4iWx0GVFi', 1, 6, 1),
(9, 'armadillo2', 'armadillo2@gmail.com', 1321321313, '$2y$10$QeiX1FNLmz2XS6qNw/G/ouR2v3aDfY6jJ6yqbOSygiPGjdLL6Cn2O', 3, 9, 3),
(10, 'armadillo3', 'armadillo3@gmail.com', 1232, '$2y$10$//tGatTnl7W4/KcT2dL0O.e42h4eOiAI2BqKi4lGmxqfu1RVYA6hy', 3, 12, 3),
(11, 'armadillo4', 'a@a.a', 3051231212, '$2y$10$TZNInGmUY/9rKx0WZ3rk4eR7OQVuijUk2WbUFdj2d.SYcN3YpIyVS', 3, 17, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agn`
--
ALTER TABLE `agn`
  ADD PRIMARY KEY (`agn_id`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`cita_id`),
  ADD UNIQUE KEY `agn_id_2` (`agn_id`),
  ADD UNIQUE KEY `agn_id_3` (`agn_id`),
  ADD KEY `agn_id` (`agn_id`,`usr_id`,`emp_id`),
  ADD KEY `usr_idPK_cita` (`usr_id`),
  ADD KEY `emp_idPK_cita` (`emp_id`),
  ADD KEY `sta_id` (`sta_id`),
  ADD KEY `agn_id_4` (`agn_id`);

--
-- Indices de la tabla `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `usr_id` (`usr_id`,`srv_id`),
  ADD KEY `srv_idPK_emp` (`srv_id`);

--
-- Indices de la tabla `mdl`
--
ALTER TABLE `mdl`
  ADD PRIMARY KEY (`mdl_id`);

--
-- Indices de la tabla `per`
--
ALTER TABLE `per`
  ADD PRIMARY KEY (`per_id`),
  ADD UNIQUE KEY `per_doc` (`per_doc`),
  ADD KEY `tyDoc_id` (`tyDoc_id`,`sex_id`),
  ADD KEY `sex_idPK_per` (`sex_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `rol_mdl`
--
ALTER TABLE `rol_mdl`
  ADD PRIMARY KEY (`rol_mdl_id`),
  ADD KEY `rol_id` (`rol_id`,`mdl_id`),
  ADD KEY `mdl_idPK_rol_mdl` (`mdl_id`);

--
-- Indices de la tabla `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`);

--
-- Indices de la tabla `srv`
--
ALTER TABLE `srv`
  ADD PRIMARY KEY (`srv_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `sta`
--
ALTER TABLE `sta`
  ADD PRIMARY KEY (`sta_id`);

--
-- Indices de la tabla `turn`
--
ALTER TABLE `turn`
  ADD PRIMARY KEY (`turn_id`),
  ADD KEY `emp_id` (`emp_id`,`tyTurn_id`),
  ADD KEY `tyTurn_idPK_tunr` (`tyTurn_id`);

--
-- Indices de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  ADD PRIMARY KEY (`tyDoc_id`);

--
-- Indices de la tabla `tytrun`
--
ALTER TABLE `tytrun`
  ADD PRIMARY KEY (`tyTurn_id`);

--
-- Indices de la tabla `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `usr_nm` (`usr_nm`,`usr_ema`,`usr_tel`,`per_id`),
  ADD UNIQUE KEY `usr_nm_2` (`usr_nm`,`usr_ema`,`usr_tel`),
  ADD KEY `per_id` (`per_id`,`rol_id`,`sta_id`),
  ADD KEY `rol_idPK_usr` (`rol_id`),
  ADD KEY `sta_idPK_usr` (`sta_id`),
  ADD KEY `per_idPk_usr` (`per_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agn`
--
ALTER TABLE `agn`
  MODIFY `agn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `cita_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `emp`
--
ALTER TABLE `emp`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mdl`
--
ALTER TABLE `mdl`
  MODIFY `mdl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `per`
--
ALTER TABLE `per`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol_mdl`
--
ALTER TABLE `rol_mdl`
  MODIFY `rol_mdl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sex`
--
ALTER TABLE `sex`
  MODIFY `sex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT de la tabla `turn`
--
ALTER TABLE `turn`
  MODIFY `turn_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  MODIFY `tyDoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tytrun`
--
ALTER TABLE `tytrun`
  MODIFY `tyTurn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usr`
--
ALTER TABLE `usr`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `agn_idPK_cita` FOREIGN KEY (`agn_id`) REFERENCES `agn` (`agn_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_idPK_cita` FOREIGN KEY (`emp_id`) REFERENCES `emp` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sta_idPk_cita` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usr_idPK_cita` FOREIGN KEY (`usr_id`) REFERENCES `usr` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `srv_idPK_emp` FOREIGN KEY (`srv_id`) REFERENCES `srv` (`srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usr_idPK_emp` FOREIGN KEY (`usr_id`) REFERENCES `usr` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `per`
--
ALTER TABLE `per`
  ADD CONSTRAINT `sex_idPK_per` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`sex_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tyDoc_idPK_per` FOREIGN KEY (`tyDoc_id`) REFERENCES `tydoc` (`tyDoc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol_mdl`
--
ALTER TABLE `rol_mdl`
  ADD CONSTRAINT `mdl_idPK_rol_mdl` FOREIGN KEY (`mdl_id`) REFERENCES `mdl` (`mdl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rol_idPK_rol_mdl` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `srv`
--
ALTER TABLE `srv`
  ADD CONSTRAINT `sta_idPK_srv_FK` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `turn`
--
ALTER TABLE `turn`
  ADD CONSTRAINT `emp_idPK_tunr` FOREIGN KEY (`emp_id`) REFERENCES `emp` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tyTurn_idPK_tunr` FOREIGN KEY (`tyTurn_id`) REFERENCES `tytrun` (`tyTurn_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usr`
--
ALTER TABLE `usr`
  ADD CONSTRAINT `per_idPK_usr` FOREIGN KEY (`per_id`) REFERENCES `per` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rol_idPK_usr` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sta_idPK_usr` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
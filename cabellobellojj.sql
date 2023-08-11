-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2023 a las 00:08:16
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `i_infoPag` (IN `nam` VARCHAR(60), IN `inf` TEXT, IN `typ` VARCHAR(10), IN `cod` INT, IN `img` TEXT)   BEGIN
	
	INSERT INTO `pag` (`pag_nam`,`pag_typ`,`pag_code`, `pag_text`, `pag_img`) VALUES 
	(nam, typ, cod, inf, img);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_srv` (IN `nam` VARCHAR(60), `cod` VARCHAR(40), `dsc` TEXT, `img` TEXT, `prc` DOUBLE, `sta` INT)   INSERT INTO `srv`(`srv_id`, `srv_nam`, `srv_code`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) 
VALUES (NULL,nam,cod,dsc,img,prc,sta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `i_user` (IN `nam` VARCHAR(80), IN `ltName` VARCHAR(80), IN `birth` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `addr` VARCHAR(80), IN `city` INT, IN `serie` INT, IN `tel` DOUBLE, IN `em` VARCHAR(80), IN `usrNam` VARCHAR(80), IN `pas` VARCHAR(80), IN `term` VARCHAR(10))   BEGIN
    DECLARE dtsId INT;
    DECLARE usrId INT;
    DECLARE regId INT;
    
    -- Insertar en la tabla dts y obtener el último ID insertado
    INSERT INTO `dts`(`dts_name`, `dts_lastName`, `dts_bithDate`, `sex_id`, `tyDoc_id`, `dts_doc`, `city_id`, `dts_addr`, `serialTel_id`, `dts_tel`) VALUES
(nam, ltName, birth, sex, tyDoc, doc, city, addr, serie, tel);
        SET dtsId = LAST_INSERT_ID();
    
    -- Insertar en la tabla reg y obtener el último ID insertado
    INSERT INTO reg VALUES (NULL, em, usrNam, pas, term);
    SET regId = LAST_INSERT_ID();
    
    -- Insertar en la tabla usr con los IDs obtenidos
    INSERT INTO usr VALUES (NULL, dtsId, regId, 3);
    SET usrId = LAST_INSERT_ID();

    CALL v_usrId(usrId);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_dtsUser` (IN `id` INT, IN `nam` VARCHAR(80), IN `ltName` VARCHAR(80), IN `birth` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `addr` VARCHAR(80), IN `city` INT, IN `serie` INT, IN `tel` DOUBLE, IN `em` VARCHAR(80), IN `usrNam` VARCHAR(80), IN `pass` VARCHAR(80))   BEGIN
    
    UPDATE `dts` SET `dts_name`= nam,`dts_lastName`=ltName,`dts_bithDate`=birth,`sex_id`=sex,`tyDoc_id`=tyDoc,`dts_doc`=doc,`dts_addr`=addr,`serialTel_id`=serie,`dts_tel`=tel WHERE dts.dts_id;

	UPDATE `reg` SET `reg_ema`=em,`reg_usrName`=usrNam,`reg_pass`=pass WHERE reg.reg_id = id;

    CALL v_usrId(id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_srv` (IN `id` INT, `nam` VARCHAR(60), `cod` VARCHAR(40), `dsc` TEXT, `img` TEXT, `prc` DOUBLE, `sta` INT)   UPDATE `srv` SET `srv_nam`= nam,`srv_code`= cod,`srv_dsc`= dsc,`srv_img`= img,`srv_prc`=prc,`sta_id`=sta 
WHERE `srv_id` = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_srvS` (IN `id` INT, `sta` INT)   UPDATE `srv` SET `sta_id` = sta WHERE srv_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `u_usrStaId` (IN `id` INT, IN `estado` INT)   BEGIN
UPDATE `usr` SET `sta_id` = estado WHERE `usr_id` = id;

call v_usrStaId(id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vT_srv` ()   SELECT `srv_id`,`srv_nam`,`srv_code`,`srv_dsc`,`srv_img`,`srv_prc`,a.`sta_id`,a.`sta_nam` FROM srv s INNER JOIN 
sta a ON s.sta_id = a.sta_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vT_srvA` ()   SELECT `srv_id`,`srv_nam`,`srv_code`,`srv_dsc`,`srv_img`,`srv_prc`,a.`sta_id`,a.`sta_nam` FROM srv s INNER JOIN 
sta a ON s.sta_id = a.sta_id WHERE a.sta_id = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_city` ()   BEGIN
    SELECT * FROM city;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_infoPagId` (IN `id` INT)   BEGIN
	SELECT * FROM pag WHERE pag.pag_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_regEma` (IN `ema` VARCHAR(80))   BEGIN
	SELECT U.usr_id FROM `reg` R
    INNER JOIN `usr` U ON
    R.reg_id = U.reg_id
    WHERE R.reg_ema = ema;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_regPass` (IN `id_usr` INT, IN `pas` VARCHAR(80))   BEGIN
	SELECT U.usr_id, D.dts_name FROM `reg` R
    INNER JOIN `usr` U ON
    R.reg_id = U.reg_id INNER JOIN
    `dts` D ON U.dts_id = D.dts_id
    WHERE R.reg_pass = pas AND U.usr_id = id_usr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_serialtel` ()   BEGIN
    SELECT * FROM `serialtel`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_sex` ()   BEGIN
    SELECT * FROM sex;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_srv` (IN `id` INT)   SELECT `srv_id`,`srv_nam`,`srv_code`,`srv_dsc`,`srv_img`,`srv_prc`,a.`sta_id`,a.`sta_nam` FROM srv s INNER JOIN 
sta a ON s.sta_id = a.sta_id WHERE s.srv_id = id AND a.sta_id = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_tD` ()   BEGIN
    SELECT * FROM tydoc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_TinfoPag` ()   BEGIN
	SELECT * FROM pag;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_TypeInfoPag` (IN `pag_typ` VARCHAR(10))   BEGIN
	SELECT * FROM pag WHERE pag.pag_code = pag_typ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usrId` (IN `id` INT)   BEGIN 

SELECT `usr_id` 'ID De Usuario', s.`sta_id` 'Estado ID', `sta_nam` 'Estado', `dts_name` 'Nombre', `dts_lastName` 'Apellido', `dts_bithDate` 'Fecha De Nacimiento', se.`sex_id` 'Género ID', `sex_nam` 'Género', td.`tyDoc_id` 'Tipo De Documento ID', `tyDoc_nam` 'Tipo De Documento', `dts_doc` 'Número De Documento', `dts_addr` 'Dirección', dts.city_id 'Id De La Cuidad',`serialTel_id` 'Serial Telefónico', `dts_tel` 'Número De Teléfono', `reg_ema` 'Email', `reg_usrName` 'Nombre De Usuario', `reg_pass` 'Contraseña', `reg_term` 'Terminos Y Condiciones'
    FROM usr u INNER JOIN
    dts d on u.dts_id = d.dts_id INNER JOIN
    reg r on u.reg_id = r.reg_id INNER JOIN
    sta s on u.sta_id = s.sta_id INNER JOIN
    sex se on d.sex_id = se.sex_id INNER JOIN
    tyDoc td on d.tyDoc_id = td.tyDoc_id
    WHERE u.usr_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usrRegId` (IN `id` INT)   BEGIN

SELECT `usr_id` 'ID De Usuario', d.dts_name 'Nombre', d.dts_lastName 'Apellido', r.reg_ema 'Email', r.reg_usrName 'Nombre De Usuario', s.`sta_id` 'Estado ID', `sta_nam` 'Estado' FROM 
`usr` u INNER JOIN
`sta` s ON u.sta_id = s.sta_id INNER JOIN
`dts` d ON u.dts_id = d.dts_id INNER JOIN
`reg` r ON u.reg_id = r.reg_id
WHERE u.usr_id = id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `v_usrStaId` (IN `id` INT)   BEGIN

SELECT `usr_id` 'ID De Usuario', d.dts_name 'Nombre', d.dts_lastName 'Apellido',s.`sta_id` 'Estado ID', `sta_nam` 'Estado' FROM 
`usr` u INNER JOIN
`sta` s ON u.sta_id = s.sta_id INNER JOIN 
dts d on u.dts_id = d.dts_id
WHERE u.usr_id = id;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `cita_id` int(11) NOT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `cita_date` datetime DEFAULT NULL,
  `srv_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_nam` varchar(80) NOT NULL,
  `id_department` int(11) NOT NULL,
  `is_capital` tinyint(1) NOT NULL DEFAULT 0,
  `city_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`city_id`, `city_nam`, `id_department`, `is_capital`, `city_code`) VALUES
(1, 'Leticia', 1, 1, 91001),
(2, 'El Encanto', 1, 0, 91263),
(3, 'La Chorrera', 1, 0, 91405),
(4, 'La Pedrera', 1, 0, 91407),
(5, 'Puerto Arica', 1, 0, 91536),
(6, 'Puerto Santander', 1, 0, 91669),
(7, 'Tarapacá', 1, 0, 91798),
(8, 'La Victoria', 1, 0, 15401),
(9, 'Miriti Paraná', 1, 0, 9146),
(10, 'Puerto Alegría', 1, 0, 9153),
(11, 'Puerto Nariño', 1, 0, 9154),
(12, 'Medellín', 2, 1, 5001),
(13, 'Abejorral', 2, 0, 5002),
(14, 'Abriaquí', 2, 0, 5004),
(15, 'Alejandría', 2, 0, 5021),
(16, 'Amalfi', 2, 0, 5031),
(17, 'Andes', 2, 0, 5034),
(18, 'Angelópolis', 2, 0, 5036),
(19, 'Angostura', 2, 0, 5038),
(20, 'Santafé de Antioquia', 2, 0, 5042),
(21, 'Anza', 2, 0, 5044),
(22, 'Apartadó', 2, 0, 5045),
(23, 'Arboletes', 2, 0, 5051),
(24, 'Argelia', 2, 0, 5055),
(25, 'Armenia', 2, 0, 5059),
(26, 'Barbosa', 2, 0, 5079),
(27, 'Belmira', 2, 0, 5086),
(28, 'Bello', 2, 0, 5088),
(29, 'Betania', 2, 0, 5091),
(30, 'Betulia', 2, 0, 5093),
(31, 'Ciudad Bolívar', 2, 0, 5101),
(32, 'Briceño', 2, 0, 5107),
(33, 'Buriticá', 2, 0, 5113),
(34, 'Caicedo', 2, 0, 5125),
(35, 'Caldas', 2, 0, 5129),
(36, 'Campamento', 2, 0, 5134),
(37, 'Cañasgordas', 2, 0, 5138),
(38, 'Caracolí', 2, 0, 5142),
(39, 'Caramanta', 2, 0, 5145),
(40, 'Carepa', 2, 0, 5147),
(41, 'El Carmen de Viboral', 2, 0, 5148),
(42, 'Caucasia', 2, 0, 5154),
(43, 'Chigorodó', 2, 0, 5172),
(44, 'Cocorná', 2, 0, 5197),
(45, 'Concepción', 2, 0, 5206),
(46, 'Concordia', 2, 0, 5209),
(47, 'Copacabana', 2, 0, 5212),
(48, 'Dabeiba', 2, 0, 5234),
(49, 'Don Matías', 2, 0, 5237),
(50, 'Entrerrios', 2, 0, 5264),
(51, 'Envigado', 2, 0, 5266),
(52, 'Fredonia', 2, 0, 5282),
(53, 'Frontino', 2, 0, 5284),
(54, 'Giraldo', 2, 0, 5306),
(55, 'Girardota', 2, 0, 5308),
(56, 'Granada', 2, 0, 25312),
(57, 'Guadalupe', 2, 0, 5315),
(58, 'Guarne', 2, 0, 5318),
(59, 'Guatapé', 2, 0, 5321),
(60, 'Heliconia', 2, 0, 5347),
(61, 'Hispania', 2, 0, 5353),
(62, 'Ituango', 2, 0, 5361),
(63, 'Jardín', 2, 0, 5364),
(64, 'Jericó', 2, 0, 5368),
(65, 'La Ceja', 2, 0, 5376),
(66, 'Liborina', 2, 0, 5411),
(67, 'Maceo', 2, 0, 5425),
(68, 'Montebello', 2, 0, 5467),
(69, 'Murindó', 2, 0, 5475),
(70, 'Nariño', 2, 0, 5483),
(71, 'Nechí', 2, 0, 5495),
(72, 'Olaya', 2, 0, 5501),
(73, 'Peñol', 2, 0, 5541),
(74, 'Peque', 2, 0, 5543),
(75, 'Pueblorrico', 2, 0, 5576),
(76, 'Puerto Berrío', 2, 0, 5579),
(77, 'Puerto Nare', 2, 0, 5585),
(78, 'Puerto Triunfo', 2, 0, 5591),
(79, 'Remedios', 2, 0, 5604),
(80, 'Retiro', 2, 0, 5607),
(81, 'Rionegro', 2, 0, 5615),
(82, 'Sabanalarga', 2, 0, 5628),
(83, 'Sabaneta', 2, 0, 5631),
(84, 'Salgar', 2, 0, 5642),
(85, 'San Andrés de Cuerquía', 2, 0, 5647),
(86, 'San Carlos', 2, 0, 23678),
(87, 'San Francisco', 2, 0, 5652),
(88, 'San Jerónimo', 2, 0, 5656),
(89, 'San José de La Montaña', 2, 0, 5658),
(90, 'San Juan de Urabá', 2, 0, 5659),
(91, 'San Pedro', 2, 0, 5664),
(92, 'San Pedro de Uraba', 2, 0, 5665),
(93, 'San Rafael', 2, 0, 5667),
(94, 'San Vicente', 2, 0, 5674),
(95, 'Santa Bárbara', 2, 0, 5679),
(96, 'Santa Rosa de Osos', 2, 0, 5686),
(97, 'El Santuario', 2, 0, 5697),
(98, 'Segovia', 2, 0, 5736),
(99, 'Sonsón', 2, 0, 5756),
(100, 'Sopetrán', 2, 0, 5761),
(101, 'Támesis', 2, 0, 5789),
(102, 'Tarso', 2, 0, 5792),
(103, 'Titiribí', 2, 0, 5809),
(104, 'Toledo', 2, 0, 5819),
(105, 'Turbo', 2, 0, 5837),
(106, 'Uramita', 2, 0, 5842),
(107, 'Urrao', 2, 0, 5847),
(108, 'Valdivia', 2, 0, 5854),
(109, 'Valparaíso', 2, 0, 5856),
(110, 'Vegachí', 2, 0, 5858),
(111, 'Venecia', 2, 0, 5861),
(112, 'Vigía del Fuerte', 2, 0, 5873),
(113, 'Yalí', 2, 0, 5885),
(114, 'Yarumal', 2, 0, 5887),
(115, 'Yondó', 2, 0, 5893),
(116, 'Zaragoza', 2, 0, 5895),
(117, 'Amagá', 2, 0, 503),
(118, 'Anorí', 2, 0, 504),
(119, 'La Unión', 2, 0, 54),
(120, 'Cáceres', 2, 0, 512),
(121, 'Carolina', 2, 0, 515),
(122, 'Cisneros', 2, 0, 519),
(123, 'Ebéjico', 2, 0, 524),
(124, 'El Bagre', 2, 0, 525),
(125, 'Gómez Plata', 2, 0, 531),
(126, 'Itagui', 2, 0, 536),
(127, 'La Estrella', 2, 0, 538),
(128, 'La Pintada', 2, 0, 539),
(129, 'Marinilla', 2, 0, 544),
(130, 'Mutatá', 2, 0, 548),
(131, 'Necoclí', 2, 0, 549),
(132, 'San Luis', 2, 0, 566),
(133, 'San Roque', 2, 0, 567),
(134, 'Santo Domingo', 2, 0, 569),
(135, 'Tarazá', 2, 0, 579),
(136, 'Yolombó', 2, 0, 589),
(137, 'San Andrés', 4, 1, 68669),
(138, 'Providencia', 4, 0, 52565),
(139, 'Barranquilla', 5, 1, 8001),
(140, 'Baranoa', 5, 0, 8078),
(141, 'Campo de La Cruz', 5, 0, 8137),
(142, 'Candelaria', 5, 0, 8141),
(143, 'Galapa', 5, 0, 8296),
(144, 'Juan de Acosta', 5, 0, 8372),
(145, 'Luruaco', 5, 0, 8421),
(146, 'Malambo', 5, 0, 8433),
(147, 'Manatí', 5, 0, 8436),
(148, 'Piojó', 5, 0, 8549),
(149, 'Polonuevo', 5, 0, 8558),
(150, 'Puerto Colombia', 5, 0, 94884),
(151, 'Repelón', 5, 0, 8606),
(152, 'Sabanagrande', 5, 0, 8634),
(153, 'Sabanalarga', 5, 0, 5628),
(154, 'Santa Lucía', 5, 0, 8675),
(155, 'Santo Tomás', 5, 0, 8685),
(156, 'Soledad', 5, 0, 8758),
(157, 'Tubará', 5, 0, 8832),
(158, 'Usiacurí', 5, 0, 8849),
(159, 'Palmar de Varela', 5, 0, 852),
(160, 'Ponedera', 5, 0, 856),
(161, 'Suan', 5, 0, 877),
(162, 'Bogotá D.C.', 6, 1, 11001),
(163, 'Cartagena', 7, 1, 13001),
(164, 'Achí', 7, 0, 13006),
(165, 'Arenal', 7, 0, 13042),
(166, 'Arjona', 7, 0, 13052),
(167, 'Arroyohondo', 7, 0, 13062),
(168, 'Barranco de Loba', 7, 0, 13074),
(169, 'Cicuco', 7, 0, 13188),
(170, 'Córdoba', 7, 0, 13212),
(171, 'Clemencia', 7, 0, 13222),
(172, 'El Carmen de Bolívar', 7, 0, 13244),
(173, 'El Guamo', 7, 0, 13248),
(174, 'El Peñón', 7, 0, 13268),
(175, 'Mahates', 7, 0, 13433),
(176, 'María la Baja', 7, 0, 13442),
(177, 'Montecristo', 7, 0, 13458),
(178, 'Mompós', 7, 0, 13468),
(179, 'Morales', 7, 0, 13473),
(180, 'Pinillos', 7, 0, 13549),
(181, 'San Estanislao', 7, 0, 13647),
(182, 'San Jacinto', 7, 0, 13654),
(183, 'San Jacinto del Cauca', 7, 0, 13655),
(184, 'San Juan Nepomuceno', 7, 0, 13657),
(185, 'San Martín de Loba', 7, 0, 13667),
(186, 'Santa Catalina', 7, 0, 13673),
(187, 'Santa Rosa', 7, 0, 13683),
(188, 'Santa Rosa del Sur', 7, 0, 13688),
(189, 'Simití', 7, 0, 13744),
(190, 'Turbaco', 7, 0, 13836),
(191, 'Turbaná', 7, 0, 13838),
(192, 'Villanueva', 7, 0, 13873),
(193, 'Zambrano', 7, 0, 13894),
(194, 'Hatillo de Loba', 7, 0, 133),
(195, 'Altos del Rosario', 7, 0, 1303),
(196, 'Río Viejo', 7, 0, 136),
(197, 'Calamar', 7, 0, 1314),
(198, 'Cantagallo', 7, 0, 1316),
(199, 'Magangué', 7, 0, 1343),
(200, 'Margarita', 7, 0, 1344),
(201, 'Norosí', 7, 0, 1349),
(202, 'Regidor', 7, 0, 1358),
(203, 'San Cristóbal', 7, 0, 1362),
(204, 'San Fernando', 7, 0, 1365),
(205, 'San Pablo de Borbur', 7, 0, 15681),
(206, 'Soplaviento', 7, 0, 1376),
(207, 'Talaigua Nuevo', 7, 0, 1378),
(208, 'Tiquisio', 7, 0, 1381),
(209, 'Tunja', 8, 1, 15001),
(210, 'Almeida', 8, 0, 15022),
(211, 'Aquitania', 8, 0, 15047),
(212, 'Arcabuco', 8, 0, 15051),
(213, 'Belén', 8, 0, 52083),
(214, 'Betéitiva', 8, 0, 15092),
(215, 'Boavita', 8, 0, 15097),
(216, 'Boyacá', 8, 0, 15104),
(217, 'Briceño', 8, 0, 5107),
(218, 'Buena Vista', 8, 0, 15109),
(219, 'Busbanzá', 8, 0, 15114),
(220, 'Caldas', 8, 0, 5129),
(221, 'Campohermoso', 8, 0, 15135),
(222, 'Cerinza', 8, 0, 15162),
(223, 'Chinavita', 8, 0, 15172),
(224, 'Chiquinquirá', 8, 0, 15176),
(225, 'Chita', 8, 0, 15183),
(226, 'Chitaraque', 8, 0, 15185),
(227, 'Chivatá', 8, 0, 15187),
(228, 'Ciénega', 8, 0, 15189),
(229, 'Cómbita', 8, 0, 15204),
(230, 'Coper', 8, 0, 15212),
(231, 'Corrales', 8, 0, 15215),
(232, 'Covarachía', 8, 0, 15218),
(233, 'Cubará', 8, 0, 15223),
(234, 'Cucaita', 8, 0, 15224),
(235, 'Cuítiva', 8, 0, 15226),
(236, 'Chíquiza', 8, 0, 15232),
(237, 'Chivor', 8, 0, 15236),
(238, 'Duitama', 8, 0, 15238),
(239, 'El Cocuy', 8, 0, 15244),
(240, 'El Espino', 8, 0, 15248),
(241, 'Firavitoba', 8, 0, 15272),
(242, 'Floresta', 8, 0, 15276),
(243, 'Gachantivá', 8, 0, 15293),
(244, 'Gameza', 8, 0, 15296),
(245, 'Garagoa', 8, 0, 15299),
(246, 'Guacamayas', 8, 0, 15317),
(247, 'Guateque', 8, 0, 15322),
(248, 'Guayatá', 8, 0, 15325),
(249, 'Güicán', 8, 0, 15332),
(250, 'Iza', 8, 0, 15362),
(251, 'Jenesano', 8, 0, 15367),
(252, 'Jericó', 8, 0, 5368),
(253, 'Labranzagrande', 8, 0, 15377),
(254, 'La Victoria', 8, 0, 15401),
(255, 'La Uvita', 8, 0, 15403),
(256, 'Villa de Leyva', 8, 0, 15407),
(257, 'Macanal', 8, 0, 15425),
(258, 'Maripí', 8, 0, 15442),
(259, 'Miraflores', 8, 0, 15455),
(260, 'Mongua', 8, 0, 15464),
(261, 'Monguí', 8, 0, 15466),
(262, 'Moniquirá', 8, 0, 15469),
(263, 'Motavita', 8, 0, 15476),
(264, 'Nobsa', 8, 0, 15491),
(265, 'Nuevo Colón', 8, 0, 15494),
(266, 'Otanche', 8, 0, 15507),
(267, 'Pachavita', 8, 0, 15511),
(268, 'Páez', 8, 0, 15514),
(269, 'Paipa', 8, 0, 15516),
(270, 'Pajarito', 8, 0, 15518),
(271, 'Panqueba', 8, 0, 15522),
(272, 'Pauna', 8, 0, 15531),
(273, 'Paya', 8, 0, 15533),
(274, 'Paz de Río', 8, 0, 15537),
(275, 'Pesca', 8, 0, 15542),
(276, 'Puerto Boyacá', 8, 0, 15572),
(277, 'Ramiriquí', 8, 0, 15599),
(278, 'Rondón', 8, 0, 15621),
(279, 'Saboyá', 8, 0, 15632),
(280, 'Sáchica', 8, 0, 15638),
(281, 'Samacá', 8, 0, 15646),
(282, 'San José de Pare', 8, 0, 15664),
(283, 'San Luis de Gaceno', 8, 0, 85325),
(284, 'San Mateo', 8, 0, 15673),
(285, 'San Miguel de Sema', 8, 0, 15676),
(286, 'San Pablo de Borbur', 8, 0, 15681),
(287, 'Santana', 8, 0, 15686),
(288, 'Santa Rosa de Viterbo', 8, 0, 15693),
(289, 'Santa Sofía', 8, 0, 15696),
(290, 'Sativasur', 8, 0, 15723),
(291, 'Soatá', 8, 0, 15753),
(292, 'Socotá', 8, 0, 15755),
(293, 'Socha', 8, 0, 15757),
(294, 'Sogamoso', 8, 0, 15759),
(295, 'Somondoco', 8, 0, 15761),
(296, 'Sora', 8, 0, 15762),
(297, 'Sotaquirá', 8, 0, 15763),
(298, 'Soracá', 8, 0, 15764),
(299, 'Susacón', 8, 0, 15774),
(300, 'Sutamarchán', 8, 0, 15776),
(301, 'Sutatenza', 8, 0, 15778),
(302, 'Tenza', 8, 0, 15798),
(303, 'Tibaná', 8, 0, 15804),
(304, 'Tibasosa', 8, 0, 15806),
(305, 'Tinjacá', 8, 0, 15808),
(306, 'Toca', 8, 0, 15814),
(307, 'Togüí', 8, 0, 15816),
(308, 'Tota', 8, 0, 15822),
(309, 'Tununguá', 8, 0, 15832),
(310, 'Turmequé', 8, 0, 15835),
(311, 'Tuta', 8, 0, 15837),
(312, 'Tutazá', 8, 0, 15839),
(313, 'Umbita', 8, 0, 15842),
(314, 'Ventaquemada', 8, 0, 15861),
(315, 'Viracachá', 8, 0, 15879),
(316, 'Zetaquira', 8, 0, 15897),
(317, 'Oicatá', 8, 0, 155),
(318, 'Ráquira', 8, 0, 156),
(319, 'Berbeo', 8, 0, 1509),
(320, 'Chiscas', 8, 0, 1518),
(321, 'La Capilla', 8, 0, 1538),
(322, 'Muzo', 8, 0, 1548),
(323, 'Pisba', 8, 0, 1555),
(324, 'Quípama', 8, 0, 1558),
(325, 'San Eduardo', 8, 0, 1566),
(326, 'Santa María', 8, 0, 1569),
(327, 'Sativanorte', 8, 0, 1572),
(328, 'Siachoque', 8, 0, 1574),
(329, 'Tasco', 8, 0, 1579),
(330, 'Tipacoque', 8, 0, 1581),
(331, 'Tópaga', 8, 0, 1582),
(332, 'Manizales', 9, 1, 17001),
(333, 'Aguadas', 9, 0, 17013),
(334, 'Anserma', 9, 0, 17042),
(335, 'Belalcázar', 9, 0, 17088),
(336, 'Chinchiná', 9, 0, 17174),
(337, 'Filadelfia', 9, 0, 17272),
(338, 'La Merced', 9, 0, 17388),
(339, 'Manzanares', 9, 0, 17433),
(340, 'Marmato', 9, 0, 17442),
(341, 'Marquetalia', 9, 0, 17444),
(342, 'Marulanda', 9, 0, 17446),
(343, 'Neira', 9, 0, 17486),
(344, 'Norcasia', 9, 0, 17495),
(345, 'Pácora', 9, 0, 17513),
(346, 'Palestina', 9, 0, 17524),
(347, 'Pensilvania', 9, 0, 17541),
(348, 'Riosucio', 9, 0, 17614),
(349, 'Risaralda', 9, 0, 17616),
(350, 'Salamina', 9, 0, 17653),
(351, 'Samaná', 9, 0, 17662),
(352, 'San José', 9, 0, 17665),
(353, 'Supía', 9, 0, 17777),
(354, 'Victoria', 9, 0, 17867),
(355, 'Villamaría', 9, 0, 17873),
(356, 'Viterbo', 9, 0, 17877),
(357, 'Aranzazu', 9, 0, 1705),
(358, 'La Dorada', 9, 0, 1738),
(359, 'Florencia', 10, 1, 18001),
(360, 'Albania', 10, 0, 18029),
(361, 'Belén de Los Andaquies', 10, 0, 18094),
(362, 'Curillo', 10, 0, 18205),
(363, 'El Doncello', 10, 0, 18247),
(364, 'El Paujil', 10, 0, 18256),
(365, 'Morelia', 10, 0, 18479),
(366, 'Puerto Rico', 10, 0, 18592),
(367, 'San Vicente del Caguán', 10, 0, 18753),
(368, 'Solano', 10, 0, 18756),
(369, 'Solita', 10, 0, 18785),
(370, 'Cartagena del Chairá', 10, 0, 1815),
(371, 'La Montañita', 10, 0, 1841),
(372, 'Milán', 10, 0, 1846),
(373, 'San José del Fragua', 10, 0, 1861),
(374, 'Valparaíso', 10, 0, 5856),
(375, 'Popayán', 12, 1, 19001),
(376, 'Almaguer', 12, 0, 19022),
(377, 'Balboa', 12, 0, 19075),
(378, 'Caldono', 12, 0, 19137),
(379, 'Caloto', 12, 0, 19142),
(380, 'Corinto', 12, 0, 19212),
(381, 'El Tambo', 12, 0, 19256),
(382, 'Guapi', 12, 0, 19318),
(383, 'Inzá', 12, 0, 19355),
(384, 'Jambaló', 12, 0, 19364),
(385, 'La Sierra', 12, 0, 19392),
(386, 'La Vega', 12, 0, 19397),
(387, 'López', 12, 0, 19418),
(388, 'Miranda', 12, 0, 19455),
(389, 'Morales', 12, 0, 13473),
(390, 'Padilla', 12, 0, 19513),
(391, 'Páez', 12, 0, 15514),
(392, 'Patía', 12, 0, 19532),
(393, 'Piamonte', 12, 0, 19533),
(394, 'Piendamó', 12, 0, 19548),
(395, 'Puerto Tejada', 12, 0, 19573),
(396, 'Puracé', 12, 0, 19585),
(397, 'Rosas', 12, 0, 19622),
(398, 'San Sebastián', 12, 0, 19693),
(399, 'Santander de Quilichao', 12, 0, 19698),
(400, 'Santa Rosa', 12, 0, 13683),
(401, 'Silvia', 12, 0, 19743),
(402, 'Sucre', 12, 0, 19785),
(403, 'Timbío', 12, 0, 19807),
(404, 'Timbiquí', 12, 0, 19809),
(405, 'Toribio', 12, 0, 19821),
(406, 'Totoró', 12, 0, 19824),
(407, 'Villa Rica', 12, 0, 19845),
(408, 'Bolívar', 12, 0, 191),
(409, 'Guachené', 12, 0, 193),
(410, 'Argelia', 12, 0, 5055),
(411, 'Buenos Aires', 12, 0, 1911),
(412, 'Cajibío', 12, 0, 1913),
(413, 'Florencia', 12, 0, 18001),
(414, 'Mercaderes', 12, 0, 1945),
(415, 'Sotara', 12, 0, 1976),
(416, 'Suárez', 12, 0, 1978),
(417, 'Valledupar', 13, 1, 20001),
(418, 'Aguachica', 13, 0, 20011),
(419, 'Agustín Codazzi', 13, 0, 20013),
(420, 'Astrea', 13, 0, 20032),
(421, 'Becerril', 13, 0, 20045),
(422, 'Chimichagua', 13, 0, 20175),
(423, 'Chiriguaná', 13, 0, 20178),
(424, 'Curumaní', 13, 0, 20228),
(425, 'El Copey', 13, 0, 20238),
(426, 'Gamarra', 13, 0, 20295),
(427, 'La Gloria', 13, 0, 20383),
(428, 'Manaure', 13, 0, 20443),
(429, 'Pailitas', 13, 0, 20517),
(430, 'Río de Oro', 13, 0, 20614),
(431, 'La Paz', 13, 0, 20621),
(432, 'Tamalameque', 13, 0, 20787),
(433, 'La Jagua de Ibirico', 13, 0, 204),
(434, 'Bosconia', 13, 0, 2006),
(435, 'El Paso', 13, 0, 2025),
(436, 'González', 13, 0, 2031),
(437, 'Pelaya', 13, 0, 2055),
(438, 'Pueblo Bello', 13, 0, 2057),
(439, 'San Alberto', 13, 0, 2071),
(440, 'San Diego', 13, 0, 2075),
(441, 'San Martín', 13, 0, 2077),
(442, 'Quibdó', 14, 1, 27001),
(443, 'Acandí', 14, 0, 27006),
(444, 'Alto Baudo', 14, 0, 27025),
(445, 'Bagadó', 14, 0, 27073),
(446, 'Bahía Solano', 14, 0, 27075),
(447, 'Bajo Baudó', 14, 0, 27077),
(448, 'Belén de Bajira', 14, 0, 27086),
(449, 'Bojaya', 14, 0, 27099),
(450, 'El Cantón del San Pablo', 14, 0, 27135),
(451, 'Condoto', 14, 0, 27205),
(452, 'El Carmen de Atrato', 14, 0, 27245),
(453, 'Istmina', 14, 0, 27361),
(454, 'Juradó', 14, 0, 27372),
(455, 'Lloró', 14, 0, 27413),
(456, 'Medio Atrato', 14, 0, 27425),
(457, 'Nóvita', 14, 0, 27491),
(458, 'Nuquí', 14, 0, 27495),
(459, 'Riosucio', 14, 0, 17614),
(460, 'Sipí', 14, 0, 27745),
(461, 'Tadó', 14, 0, 27787),
(462, 'Atrato', 14, 0, 2705),
(463, 'Río Quito', 14, 0, 276),
(464, 'Unguía', 14, 0, 278),
(465, 'Carmen del Darien', 14, 0, 2715),
(466, 'Cértegui', 14, 0, 2716),
(467, 'El Litoral del San Juan', 14, 0, 2725),
(468, 'Medio Baudó', 14, 0, 2743),
(469, 'Medio San Juan', 14, 0, 2745),
(470, 'Río Iro', 14, 0, 2758),
(471, 'San José del Palmar', 14, 0, 2766),
(472, 'Unión Panamericana', 14, 0, 2781),
(473, 'Montería', 15, 1, 23001),
(474, 'Ayapel', 15, 0, 23068),
(475, 'Buenavista', 15, 0, 23079),
(476, 'Cereté', 15, 0, 23162),
(477, 'Chimá', 15, 0, 23168),
(478, 'Chinú', 15, 0, 23182),
(479, 'Ciénaga de Oro', 15, 0, 23189),
(480, 'Lorica', 15, 0, 23417),
(481, 'Los Córdobas', 15, 0, 23419),
(482, 'Momil', 15, 0, 23464),
(483, 'Montelíbano', 15, 0, 23466),
(484, 'Planeta Rica', 15, 0, 23555),
(485, 'Puerto Escondido', 15, 0, 23574),
(486, 'Purísima', 15, 0, 23586),
(487, 'San Antero', 15, 0, 23672),
(488, 'San Bernardo del Viento', 15, 0, 23675),
(489, 'San Carlos', 15, 0, 23678),
(490, 'San José de Uré', 15, 0, 23682),
(491, 'San Pelayo', 15, 0, 23686),
(492, 'Tierralta', 15, 0, 23807),
(493, 'Tuchín', 15, 0, 23815),
(494, 'Valencia', 15, 0, 23855),
(495, 'Cotorra', 15, 0, 233),
(496, 'Moñitos', 15, 0, 235),
(497, 'Canalete', 15, 0, 2309),
(498, 'La Apartada', 15, 0, 2335),
(499, 'Pueblo Nuevo', 15, 0, 2357),
(500, 'Puerto Libertador', 15, 0, 2358),
(501, 'Sahagún', 15, 0, 2366),
(502, 'San Andrés Sotavento', 15, 0, 2367),
(503, 'Bogotá D.C.', 16, 1, 11001),
(504, 'Albán', 16, 0, 52019),
(505, 'Anapoima', 16, 0, 25035),
(506, 'Arbeláez', 16, 0, 25053),
(507, 'Beltrán', 16, 0, 25086),
(508, 'Bituima', 16, 0, 25095),
(509, 'Bojacá', 16, 0, 25099),
(510, 'Cachipay', 16, 0, 25123),
(511, 'Cajicá', 16, 0, 25126),
(512, 'Caparrapí', 16, 0, 25148),
(513, 'Caqueza', 16, 0, 25151),
(514, 'Carmen de Carupa', 16, 0, 25154),
(515, 'Chaguaní', 16, 0, 25168),
(516, 'Chía', 16, 0, 25175),
(517, 'Chipaque', 16, 0, 25178),
(518, 'Choachí', 16, 0, 25181),
(519, 'Chocontá', 16, 0, 25183),
(520, 'Cota', 16, 0, 25214),
(521, 'Cucunubá', 16, 0, 25224),
(522, 'El Colegio', 16, 0, 25245),
(523, 'El Peñón', 16, 0, 13268),
(524, 'Facatativá', 16, 0, 25269),
(525, 'Fomeque', 16, 0, 25279),
(526, 'Fosca', 16, 0, 25281),
(527, 'Funza', 16, 0, 25286),
(528, 'Fúquene', 16, 0, 25288),
(529, 'Gachala', 16, 0, 25293),
(530, 'Gachancipá', 16, 0, 25295),
(531, 'Gachetá', 16, 0, 25297),
(532, 'Gama', 16, 0, 25299),
(533, 'Girardot', 16, 0, 25307),
(534, 'Granada', 16, 0, 25312),
(535, 'Guachetá', 16, 0, 25317),
(536, 'Guasca', 16, 0, 25322),
(537, 'Guataquí', 16, 0, 25324),
(538, 'Guatavita', 16, 0, 25326),
(539, 'Guayabal de Siquima', 16, 0, 25328),
(540, 'Guayabetal', 16, 0, 25335),
(541, 'Gutiérrez', 16, 0, 25339),
(542, 'Jerusalén', 16, 0, 25368),
(543, 'Junín', 16, 0, 25372),
(544, 'La Calera', 16, 0, 25377),
(545, 'La Mesa', 16, 0, 25386),
(546, 'La Palma', 16, 0, 25394),
(547, 'La Peña', 16, 0, 25398),
(548, 'La Vega', 16, 0, 19397),
(549, 'Lenguazaque', 16, 0, 25407),
(550, 'Macheta', 16, 0, 25426),
(551, 'Manta', 16, 0, 25436),
(552, 'Medina', 16, 0, 25438),
(553, 'Mosquera', 16, 0, 25473),
(554, 'Nariño', 16, 0, 5483),
(555, 'Nemocón', 16, 0, 25486),
(556, 'Nilo', 16, 0, 25488),
(557, 'Nimaima', 16, 0, 25489),
(558, 'Nocaima', 16, 0, 25491),
(559, 'Venecia', 16, 0, 5861),
(560, 'Pacho', 16, 0, 25513),
(561, 'Paime', 16, 0, 25518),
(562, 'Pandi', 16, 0, 25524),
(563, 'Pasca', 16, 0, 25535),
(564, 'Puerto Salgar', 16, 0, 25572),
(565, 'Quebradanegra', 16, 0, 25592),
(566, 'Quetame', 16, 0, 25594),
(567, 'Quipile', 16, 0, 25596),
(568, 'Apulo', 16, 0, 25599),
(569, 'Ricaurte', 16, 0, 25612),
(570, 'San Antonio del Tequendama', 16, 0, 25645),
(571, 'San Bernardo', 16, 0, 25649),
(572, 'San Cayetano', 16, 0, 25653),
(573, 'San Francisco', 16, 0, 5652),
(574, 'San Juan de Río Seco', 16, 0, 25662),
(575, 'Sasaima', 16, 0, 25718),
(576, 'Sesquilé', 16, 0, 25736),
(577, 'Silvania', 16, 0, 25743),
(578, 'Simijaca', 16, 0, 25745),
(579, 'Soacha', 16, 0, 25754),
(580, 'Sopó', 16, 0, 25758),
(581, 'Subachoque', 16, 0, 25769),
(582, 'Suesca', 16, 0, 25772),
(583, 'Supatá', 16, 0, 25777),
(584, 'Susa', 16, 0, 25779),
(585, 'Sutatausa', 16, 0, 25781),
(586, 'Tabio', 16, 0, 25785),
(587, 'Tausa', 16, 0, 25793),
(588, 'Tena', 16, 0, 25797),
(589, 'Tenjo', 16, 0, 25799),
(590, 'Tibacuy', 16, 0, 25805),
(591, 'Tibirita', 16, 0, 25807),
(592, 'Tocaima', 16, 0, 25815),
(593, 'Tocancipá', 16, 0, 25817),
(594, 'Topaipí', 16, 0, 25823),
(595, 'Ubalá', 16, 0, 25839),
(596, 'Ubaque', 16, 0, 25841),
(597, 'Villa de San Diego de Ubate', 16, 0, 25843),
(598, 'Une', 16, 0, 25845),
(599, 'Útica', 16, 0, 25851),
(600, 'Vergara', 16, 0, 25862),
(601, 'Vianí', 16, 0, 25867),
(602, 'Villagómez', 16, 0, 25871),
(603, 'Villapinzón', 16, 0, 25873),
(604, 'Villeta', 16, 0, 25875),
(605, 'Viotá', 16, 0, 25878),
(606, 'Yacopí', 16, 0, 25885),
(607, 'Zipacón', 16, 0, 25898),
(608, 'Zipaquirá', 16, 0, 25899),
(609, 'Cogua', 16, 0, 252),
(610, 'Anolaima', 16, 0, 2504),
(611, 'Cabrera', 16, 0, 2512),
(612, 'El Rosal', 16, 0, 2526),
(613, 'Fusagasugá', 16, 0, 2529),
(614, 'Guaduas', 16, 0, 2532),
(615, 'Madrid', 16, 0, 2543),
(616, 'Paratebueno', 16, 0, 2553),
(617, 'Pulí', 16, 0, 2558),
(618, 'Sibaté', 16, 0, 2574),
(619, 'Inírida', 17, 1, 94001),
(620, 'Barranco Minas', 17, 0, 94343),
(621, 'Mapiripana', 17, 0, 94663),
(622, 'San Felipe', 17, 0, 94883),
(623, 'Puerto Colombia', 17, 0, 94884),
(624, 'La Guadalupe', 17, 0, 94885),
(625, 'Cacahual', 17, 0, 94886),
(626, 'Pana Pana', 17, 0, 94887),
(627, 'Morichal', 17, 0, 94888),
(628, 'San José del Guaviare', 18, 1, 95001),
(629, 'Calamar', 18, 0, 1314),
(630, 'El Retorno', 18, 0, 95025),
(631, 'Miraflores', 18, 0, 15455),
(632, 'Neiva', 19, 1, 41001),
(633, 'Acevedo', 19, 0, 41006),
(634, 'Agrado', 19, 0, 41013),
(635, 'Aipe', 19, 0, 41016),
(636, 'Altamira', 19, 0, 41026),
(637, 'Baraya', 19, 0, 41078),
(638, 'Campoalegre', 19, 0, 41132),
(639, 'Colombia', 19, 0, 41206),
(640, 'Elías', 19, 0, 41244),
(641, 'Garzón', 19, 0, 41298),
(642, 'Gigante', 19, 0, 41306),
(643, 'Guadalupe', 19, 0, 5315),
(644, 'Hobo', 19, 0, 41349),
(645, 'Iquira', 19, 0, 41357),
(646, 'Isnos', 19, 0, 41359),
(647, 'La Argentina', 19, 0, 41378),
(648, 'La Plata', 19, 0, 41396),
(649, 'Nátaga', 19, 0, 41483),
(650, 'Oporapa', 19, 0, 41503),
(651, 'Paicol', 19, 0, 41518),
(652, 'Palermo', 19, 0, 41524),
(653, 'Pital', 19, 0, 41548),
(654, 'Pitalito', 19, 0, 41551),
(655, 'Rivera', 19, 0, 41615),
(656, 'San Agustín', 19, 0, 41668),
(657, 'Santa María', 19, 0, 1569),
(658, 'Tarqui', 19, 0, 41791),
(659, 'Tesalia', 19, 0, 41797),
(660, 'Tello', 19, 0, 41799),
(661, 'Teruel', 19, 0, 41801),
(662, 'Timaná', 19, 0, 41807),
(663, 'Villavieja', 19, 0, 41872),
(664, 'Yaguará', 19, 0, 41885),
(665, 'Algeciras', 19, 0, 4102),
(666, 'Palestina', 19, 0, 17524),
(667, 'Saladoblanco', 19, 0, 4166),
(668, 'Suaza', 19, 0, 4177),
(669, 'Riohacha', 20, 1, 44001),
(670, 'Albania', 20, 0, 44035),
(671, 'Barrancas', 20, 0, 44078),
(672, 'Distracción', 20, 0, 44098),
(673, 'Fonseca', 20, 0, 44279),
(674, 'Hatonuevo', 20, 0, 44378),
(675, 'Uribia', 20, 0, 44847),
(676, 'Urumita', 20, 0, 44855),
(677, 'Villanueva', 20, 0, 13873),
(678, 'Dibula', 20, 0, 4409),
(679, 'El Molino', 20, 0, 4411),
(680, 'La Jagua del Pilar', 20, 0, 4442),
(681, 'Maicao', 20, 0, 4443),
(682, 'Manaure', 20, 0, 20443),
(683, 'San Juan del Cesar', 20, 0, 4465),
(684, 'Santa Marta', 21, 1, 47001),
(685, 'Aracataca', 21, 0, 47053),
(686, 'Ariguaní', 21, 0, 47058),
(687, 'Cerro San Antonio', 21, 0, 47161),
(688, 'Ciénaga', 21, 0, 47189),
(689, 'Concordia', 21, 0, 5209),
(690, 'El Banco', 21, 0, 47245),
(691, 'El Piñon', 21, 0, 47258),
(692, 'El Retén', 21, 0, 47268),
(693, 'Fundación', 21, 0, 47288),
(694, 'Guamal', 21, 0, 47318),
(695, 'Pedraza', 21, 0, 47541),
(696, 'Pijiño del Carmen', 21, 0, 47545),
(697, 'Pivijay', 21, 0, 47551),
(698, 'Plato', 21, 0, 47555),
(699, 'Remolino', 21, 0, 47605),
(700, 'Salamina', 21, 0, 17653),
(701, 'San Sebastián de Buenavista', 21, 0, 47692),
(702, 'San Zenón', 21, 0, 47703),
(703, 'Santa Ana', 21, 0, 47707),
(704, 'Sitionuevo', 21, 0, 47745),
(705, 'Tenerife', 21, 0, 47798),
(706, 'Algarrobo', 21, 0, 4703),
(707, 'Chivolo', 21, 0, 4717),
(708, 'Nueva Granada', 21, 0, 4746),
(709, 'Pueblo Viejo', 21, 0, 4757),
(710, 'Sabanas de San Angel', 21, 0, 4766),
(711, 'Santa Bárbara de Pinto', 21, 0, 4772),
(712, 'Zapayán', 21, 0, 4796),
(713, 'Zona Bananera', 21, 0, 5736),
(714, 'Villavicencio', 22, 1, 50001),
(715, 'Acacias', 22, 0, 50006),
(716, 'Cabuyaro', 22, 0, 50124),
(717, 'Cubarral', 22, 0, 50223),
(718, 'Cumaral', 22, 0, 50226),
(719, 'El Calvario', 22, 0, 50245),
(720, 'El Castillo', 22, 0, 50251),
(721, 'Fuente de Oro', 22, 0, 50287),
(722, 'Granada', 22, 0, 25312),
(723, 'Guamal', 22, 0, 47318),
(724, 'Mapiripán', 22, 0, 50325),
(725, 'Puerto Gaitán', 22, 0, 50568),
(726, 'Puerto López', 22, 0, 50573),
(727, 'Puerto Lleras', 22, 0, 50577),
(728, 'Restrepo', 22, 0, 50606),
(729, 'San Juan de Arama', 22, 0, 50683),
(730, 'San Juanito', 22, 0, 50686),
(731, 'San Martín', 22, 0, 2077),
(732, 'Vista Hermosa', 22, 0, 50711),
(733, 'Barranca de Upía', 22, 0, 5011),
(734, 'Castilla la Nueva', 22, 0, 5015),
(735, 'El Dorado', 22, 0, 5027),
(736, 'Mesetas', 22, 0, 5033),
(737, 'La Macarena', 22, 0, 5035),
(738, 'Uribe', 22, 0, 5037),
(739, 'Lejanías', 22, 0, 504),
(740, 'Puerto Concordia', 22, 0, 5045),
(741, 'Puerto Rico', 22, 0, 18592),
(742, 'San Carlos de Guaroa', 22, 0, 5068),
(743, 'Pasto', 23, 1, 52001),
(744, 'Albán', 23, 0, 25019),
(745, 'Aldana', 23, 0, 52022),
(746, 'Ancuyá', 23, 0, 52036),
(747, 'Arboleda', 23, 0, 52051),
(748, 'Barbacoas', 23, 0, 52079),
(749, 'Belén', 23, 0, 52083),
(750, 'Colón', 23, 0, 52203),
(751, 'Consaca', 23, 0, 52207),
(752, 'Córdoba', 23, 0, 13212),
(753, 'Cuaspud', 23, 0, 52224),
(754, 'Cumbal', 23, 0, 52227),
(755, 'Cumbitara', 23, 0, 52233),
(756, 'El Peñol', 23, 0, 52254),
(757, 'El Rosario', 23, 0, 52256),
(758, 'El Tablón de Gómez', 23, 0, 52258),
(759, 'Funes', 23, 0, 52287),
(760, 'Guachucal', 23, 0, 52317),
(761, 'Gualmatán', 23, 0, 52323),
(762, 'Iles', 23, 0, 52352),
(763, 'Imués', 23, 0, 52354),
(764, 'Ipiales', 23, 0, 52356),
(765, 'La Cruz', 23, 0, 52378),
(766, 'La Florida', 23, 0, 52381),
(767, 'La Llanada', 23, 0, 52385),
(768, 'La Unión', 23, 0, 54),
(769, 'Leiva', 23, 0, 52405),
(770, 'Linares', 23, 0, 52411),
(771, 'Los Andes', 23, 0, 52418),
(772, 'Magüí', 23, 0, 52427),
(773, 'Mallama', 23, 0, 52435),
(774, 'Mosquera', 23, 0, 25473),
(775, 'Ospina', 23, 0, 52506),
(776, 'Providencia', 23, 0, 52565),
(777, 'Puerres', 23, 0, 52573),
(778, 'Pupiales', 23, 0, 52585),
(779, 'Ricaurte', 23, 0, 25612),
(780, 'Roberto Payán', 23, 0, 52621),
(781, 'Samaniego', 23, 0, 52678),
(782, 'Sandoná', 23, 0, 52683),
(783, 'San Bernardo', 23, 0, 25649),
(784, 'San Lorenzo', 23, 0, 52687),
(785, 'San Pablo', 23, 0, 52693),
(786, 'San Pedro de Cartago', 23, 0, 52694),
(787, 'Santa Bárbara', 23, 0, 5679),
(788, 'Santacruz', 23, 0, 52699),
(789, 'Taminango', 23, 0, 52786),
(790, 'Tangua', 23, 0, 52788),
(791, 'San Andrés de Tumaco', 23, 0, 52835),
(792, 'Túquerres', 23, 0, 52838),
(793, 'Yacuanquer', 23, 0, 52885),
(794, 'Buesaco', 23, 0, 5211),
(795, 'Contadero', 23, 0, 5221),
(796, 'Chachagüí', 23, 0, 5224),
(797, 'El Charco', 23, 0, 5225),
(798, 'El Tambo', 23, 0, 19256),
(799, 'Guaitarilla', 23, 0, 5232),
(800, 'La Tola', 23, 0, 5239),
(801, 'Nariño', 23, 0, 5483),
(802, 'Olaya Herrera', 23, 0, 5249),
(803, 'Francisco Pizarro', 23, 0, 5252),
(804, 'Policarpa', 23, 0, 5254),
(805, 'Potosí', 23, 0, 5256),
(806, 'Sapuyes', 23, 0, 5272),
(807, 'Cúcuta', 24, 1, 54001),
(808, 'Abrego', 24, 0, 54003),
(809, 'Arboledas', 24, 0, 54051),
(810, 'Bochalema', 24, 0, 54099),
(811, 'Bucarasica', 24, 0, 54109),
(812, 'Cácota', 24, 0, 54125),
(813, 'Cachirá', 24, 0, 54128),
(814, 'Chinácota', 24, 0, 54172),
(815, 'Chitagá', 24, 0, 54174),
(816, 'Convención', 24, 0, 54206),
(817, 'Cucutilla', 24, 0, 54223),
(818, 'Durania', 24, 0, 54239),
(819, 'El Carmen', 24, 0, 54245),
(820, 'El Zulia', 24, 0, 54261),
(821, 'Gramalote', 24, 0, 54313),
(822, 'Hacarí', 24, 0, 54344),
(823, 'Herrán', 24, 0, 54347),
(824, 'Labateca', 24, 0, 54377),
(825, 'La Esperanza', 24, 0, 54385),
(826, 'La Playa', 24, 0, 54398),
(827, 'Los Patios', 24, 0, 54405),
(828, 'Lourdes', 24, 0, 54418),
(829, 'Ocaña', 24, 0, 54498),
(830, 'Pamplona', 24, 0, 54518),
(831, 'Puerto Santander', 24, 0, 91669),
(832, 'Ragonvalia', 24, 0, 54599),
(833, 'San Cayetano', 24, 0, 25653),
(834, 'Silos', 24, 0, 54743),
(835, 'Villa Caro', 24, 0, 54871),
(836, 'Villa del Rosario', 24, 0, 54874),
(837, 'El Tarra', 24, 0, 5425),
(838, 'Mutiscua', 24, 0, 5448),
(839, 'Pamplonita', 24, 0, 5452),
(840, 'Salazar', 24, 0, 5466),
(841, 'San Calixto', 24, 0, 5467),
(842, 'Santiago', 24, 0, 8676),
(843, 'Sardinata', 24, 0, 5472),
(844, 'Teorama', 24, 0, 548),
(845, 'Tibú', 24, 0, 5481),
(846, 'Toledo', 24, 0, 5819),
(847, 'Mocoa', 25, 1, 86001),
(848, 'Colón', 25, 0, 52203),
(849, 'Puerto Asís', 25, 0, 86568),
(850, 'Puerto Caicedo', 25, 0, 86569),
(851, 'Puerto Guzmán', 25, 0, 86571),
(852, 'Leguízamo', 25, 0, 86573),
(853, 'Sibundoy', 25, 0, 86749),
(854, 'San Francisco', 25, 0, 5652),
(855, 'San Miguel', 25, 0, 68686),
(856, 'Valle de Guamez', 25, 0, 86865),
(857, 'Villagarzón', 25, 0, 86885),
(858, 'Orito', 25, 0, 8632),
(859, 'Santiago', 25, 0, 8676),
(860, 'Armenia', 26, 1, 5059),
(861, 'Buenavista', 26, 0, 23079),
(862, 'Córdoba', 26, 0, 13212),
(863, 'Filandia', 26, 0, 63272),
(864, 'Génova', 26, 0, 63302),
(865, 'La Tebaida', 26, 0, 63401),
(866, 'Pijao', 26, 0, 63548),
(867, 'Quimbaya', 26, 0, 63594),
(868, 'Calarcá', 26, 0, 6313),
(869, 'Circasia', 26, 0, 6319),
(870, 'Montenegro', 26, 0, 6347),
(871, 'Salento', 26, 0, 6369),
(872, 'Pereira', 27, 1, 66001),
(873, 'Apía', 27, 0, 66045),
(874, 'Balboa', 27, 0, 19075),
(875, 'Belén de Umbría', 27, 0, 66088),
(876, 'Guática', 27, 0, 66318),
(877, 'La Celia', 27, 0, 66383),
(878, 'Mistrató', 27, 0, 66456),
(879, 'Pueblo Rico', 27, 0, 66572),
(880, 'Quinchía', 27, 0, 66594),
(881, 'Santa Rosa de Cabal', 27, 0, 66682),
(882, 'Santuario', 27, 0, 66687),
(883, 'Dosquebradas', 27, 0, 6617),
(884, 'La Virginia', 27, 0, 664),
(885, 'Marsella', 27, 0, 6644),
(886, 'Bucaramanga', 28, 1, 68001),
(887, 'Aguada', 28, 0, 68013),
(888, 'Aratoca', 28, 0, 68051),
(889, 'Barbosa', 28, 0, 5079),
(890, 'Barichara', 28, 0, 68079),
(891, 'Barrancabermeja', 28, 0, 68081),
(892, 'Betulia', 28, 0, 5093),
(893, 'Bolívar', 28, 0, 191),
(894, 'Cabrera', 28, 0, 2512),
(895, 'California', 28, 0, 68132),
(896, 'Capitanejo', 28, 0, 68147),
(897, 'Carcasí', 28, 0, 68152),
(898, 'Cerrito', 28, 0, 68162),
(899, 'Charalá', 28, 0, 68167),
(900, 'Charta', 28, 0, 68169),
(901, 'Chimá', 28, 0, 23168),
(902, 'Chipatá', 28, 0, 68179),
(903, 'Concepción', 28, 0, 5206),
(904, 'Confines', 28, 0, 68209),
(905, 'Contratación', 28, 0, 68211),
(906, 'Coromoro', 28, 0, 68217),
(907, 'Curití', 28, 0, 68229),
(908, 'El Carmen de Chucurí', 28, 0, 68235),
(909, 'El Guacamayo', 28, 0, 68245),
(910, 'El Playón', 28, 0, 68255),
(911, 'Encino', 28, 0, 68264),
(912, 'Enciso', 28, 0, 68266),
(913, 'Florián', 28, 0, 68271),
(914, 'Floridablanca', 28, 0, 68276),
(915, 'Galán', 28, 0, 68296),
(916, 'Gambita', 28, 0, 68298),
(917, 'Girón', 28, 0, 68307),
(918, 'Guaca', 28, 0, 68318),
(919, 'Guapotá', 28, 0, 68322),
(920, 'Guavatá', 28, 0, 68324),
(921, 'Güepsa', 28, 0, 68327),
(922, 'Hato', 28, 0, 68344),
(923, 'Jesús María', 28, 0, 68368),
(924, 'La Belleza', 28, 0, 68377),
(925, 'Landázuri', 28, 0, 68385),
(926, 'La Paz', 28, 0, 20621),
(927, 'Lebríja', 28, 0, 68406),
(928, 'Los Santos', 28, 0, 68418),
(929, 'Macaravita', 28, 0, 68425),
(930, 'Málaga', 28, 0, 68432),
(931, 'Matanza', 28, 0, 68444),
(932, 'Mogotes', 28, 0, 68464),
(933, 'Molagavita', 28, 0, 68468),
(934, 'Ocamonte', 28, 0, 68498),
(935, 'Onzaga', 28, 0, 68502),
(936, 'Palmar', 28, 0, 68522),
(937, 'Palmas del Socorro', 28, 0, 68524),
(938, 'Páramo', 28, 0, 68533),
(939, 'Piedecuesta', 28, 0, 68547),
(940, 'Pinchote', 28, 0, 68549),
(941, 'Puente Nacional', 28, 0, 68572),
(942, 'Puerto Parra', 28, 0, 68573),
(943, 'Puerto Wilches', 28, 0, 68575),
(944, 'Rionegro', 28, 0, 5615),
(945, 'Sabana de Torres', 28, 0, 68655),
(946, 'San Andrés', 28, 0, 68669),
(947, 'San Benito', 28, 0, 68673),
(948, 'San Gil', 28, 0, 68679),
(949, 'San Joaquín', 28, 0, 68682),
(950, 'San José de Miranda', 28, 0, 68684),
(951, 'San Miguel', 28, 0, 68686),
(952, 'San Vicente de Chucurí', 28, 0, 68689),
(953, 'Santa Bárbara', 28, 0, 5679),
(954, 'Simacota', 28, 0, 68745),
(955, 'Socorro', 28, 0, 68755),
(956, 'Sucre', 28, 0, 19785),
(957, 'Valle de San José', 28, 0, 68855),
(958, 'Vélez', 28, 0, 68861),
(959, 'Vetas', 28, 0, 68867),
(960, 'Villanueva', 28, 0, 13873),
(961, 'Zapatoca', 28, 0, 68895),
(962, 'Albania', 28, 0, 44035),
(963, 'Cepitá', 28, 0, 6816),
(964, 'Cimitarra', 28, 0, 6819),
(965, 'El Peñón', 28, 0, 13268),
(966, 'Guadalupe', 28, 0, 5315),
(967, 'Jordán', 28, 0, 6837),
(968, 'Oiba', 28, 0, 685),
(969, 'Santa Helena del Opón', 28, 0, 6872),
(970, 'Suaita', 28, 0, 6877),
(971, 'Suratá', 28, 0, 6878),
(972, 'Tona', 28, 0, 6882),
(973, 'Sincelejo', 29, 1, 70001),
(974, 'Caimito', 29, 0, 70124),
(975, 'Coloso', 29, 0, 70204),
(976, 'Corozal', 29, 0, 70215),
(977, 'Coveñas', 29, 0, 70221),
(978, 'El Roble', 29, 0, 70233),
(979, 'Galeras', 29, 0, 70235),
(980, 'Guaranda', 29, 0, 70265),
(981, 'Los Palmitos', 29, 0, 70418),
(982, 'Majagual', 29, 0, 70429),
(983, 'Morroa', 29, 0, 70473),
(984, 'Ovejas', 29, 0, 70508),
(985, 'Palmito', 29, 0, 70523),
(986, 'San Benito Abad', 29, 0, 70678),
(987, 'San Juan de Betulia', 29, 0, 70702),
(988, 'San Marcos', 29, 0, 70708),
(989, 'San Onofre', 29, 0, 70713),
(990, 'San Pedro', 29, 0, 5664),
(991, 'San Luis de Sincé', 29, 0, 70742),
(992, 'Sucre', 29, 0, 19785),
(993, 'Tolú Viejo', 29, 0, 70823),
(994, 'Buenavista', 29, 0, 23079),
(995, 'Chalán', 29, 0, 7023),
(996, 'La Unión', 29, 0, 54),
(997, 'Sampués', 29, 0, 7067),
(998, 'Santiago de Tolú', 29, 0, 7082),
(999, 'Ibagué', 30, 1, 73001),
(1000, 'Alpujarra', 30, 0, 73024),
(1001, 'Alvarado', 30, 0, 73026),
(1002, 'Anzoátegui', 30, 0, 73043),
(1003, 'Armero', 30, 0, 73055),
(1004, 'Ataco', 30, 0, 73067),
(1005, 'Cajamarca', 30, 0, 73124),
(1006, 'Carmen de Apicala', 30, 0, 73148),
(1007, 'Casabianca', 30, 0, 73152),
(1008, 'Chaparral', 30, 0, 73168),
(1009, 'Coyaima', 30, 0, 73217),
(1010, 'Cunday', 30, 0, 73226),
(1011, 'Dolores', 30, 0, 73236),
(1012, 'Espinal', 30, 0, 73268),
(1013, 'Flandes', 30, 0, 73275),
(1014, 'Fresno', 30, 0, 73283),
(1015, 'Guamo', 30, 0, 73319),
(1016, 'Herveo', 30, 0, 73347),
(1017, 'Honda', 30, 0, 73349),
(1018, 'Icononzo', 30, 0, 73352),
(1019, 'Lérida', 30, 0, 73408),
(1020, 'Líbano', 30, 0, 73411),
(1021, 'Mariquita', 30, 0, 73443),
(1022, 'Melgar', 30, 0, 73449),
(1023, 'Murillo', 30, 0, 73461),
(1024, 'Natagaima', 30, 0, 73483),
(1025, 'Ortega', 30, 0, 73504),
(1026, 'Piedras', 30, 0, 73547),
(1027, 'Planadas', 30, 0, 73555),
(1028, 'Prado', 30, 0, 73563),
(1029, 'Purificación', 30, 0, 73585),
(1030, 'Rio Blanco', 30, 0, 73616),
(1031, 'Roncesvalles', 30, 0, 73622),
(1032, 'Rovira', 30, 0, 73624),
(1033, 'Saldaña', 30, 0, 73671),
(1034, 'San Antonio', 30, 0, 73675),
(1035, 'San Luis', 30, 0, 566),
(1036, 'Santa Isabel', 30, 0, 73686),
(1037, 'Valle de San Juan', 30, 0, 73854),
(1038, 'Venadillo', 30, 0, 73861),
(1039, 'Villarrica', 30, 0, 73873),
(1040, 'Ambalema', 30, 0, 7303),
(1041, 'Coello', 30, 0, 732),
(1042, 'Falan', 30, 0, 7327),
(1043, 'Palocabildo', 30, 0, 7352),
(1044, 'Suárez', 30, 0, 1978),
(1045, 'Villahermosa', 30, 0, 7387),
(1046, 'Cali', 31, 1, 76001),
(1047, 'Andalucía', 31, 0, 76036),
(1048, 'Ansermanuevo', 31, 0, 76041),
(1049, 'Argelia', 31, 0, 5055),
(1050, 'Buenaventura', 31, 0, 76109),
(1051, 'Guadalajara de Buga', 31, 0, 76111),
(1052, 'Bugalagrande', 31, 0, 76113),
(1053, 'Caicedonia', 31, 0, 76122),
(1054, 'Calima', 31, 0, 76126),
(1055, 'Cartago', 31, 0, 76147),
(1056, 'Dagua', 31, 0, 76233),
(1057, 'El Águila', 31, 0, 76243),
(1058, 'El Cairo', 31, 0, 76246),
(1059, 'El Cerrito', 31, 0, 76248),
(1060, 'Florida', 31, 0, 76275),
(1061, 'Ginebra', 31, 0, 76306),
(1062, 'Guacarí', 31, 0, 76318),
(1063, 'Jamundí', 31, 0, 76364),
(1064, 'La Cumbre', 31, 0, 76377),
(1065, 'La Victoria', 31, 0, 15401),
(1066, 'Obando', 31, 0, 76497),
(1067, 'Pradera', 31, 0, 76563),
(1068, 'Restrepo', 31, 0, 50606),
(1069, 'Riofrío', 31, 0, 76616),
(1070, 'Roldanillo', 31, 0, 76622),
(1071, 'Sevilla', 31, 0, 76736),
(1072, 'Toro', 31, 0, 76823),
(1073, 'Trujillo', 31, 0, 76828),
(1074, 'Tuluá', 31, 0, 76834),
(1075, 'Ulloa', 31, 0, 76845),
(1076, 'Versalles', 31, 0, 76863),
(1077, 'Vijes', 31, 0, 76869),
(1078, 'Yumbo', 31, 0, 76892),
(1079, 'Zarzal', 31, 0, 76895),
(1080, 'Alcalá', 31, 0, 7602),
(1081, 'Bolívar', 31, 0, 191),
(1082, 'Candelaria', 31, 0, 8141),
(1083, 'El Dovio', 31, 0, 7625),
(1084, 'La Unión', 31, 0, 54),
(1085, 'Palmira', 31, 0, 7652),
(1086, 'San Pedro', 31, 0, 5664),
(1087, 'Yotoco', 31, 0, 7689),
(1088, 'Mitú', 32, 1, 97001),
(1089, 'Carurú', 32, 0, 97161),
(1090, 'Pacoa', 32, 0, 97511),
(1091, 'Taraira', 32, 0, 97666),
(1092, 'Papunahua', 32, 0, 97777),
(1093, 'Yavaraté', 32, 0, 97889),
(1094, 'Puerto Carreño', 33, 1, 99001),
(1095, 'La Primavera', 33, 0, 99524),
(1096, 'Santa Rosalía', 33, 0, 99624),
(1097, 'Cumaribo', 33, 0, 99773),
(1098, 'Arauca', 3, 1, 81001),
(1099, 'Arauquita', 3, 0, 81065),
(1100, 'Puerto Rondón', 3, 0, 81591),
(1101, 'Saravena', 3, 0, 81736),
(1102, 'Tame', 3, 0, 81794),
(1103, 'Cravo Norte', 3, 0, 8122),
(1104, 'Yopal', 11, 1, 85001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dts`
--

CREATE TABLE `dts` (
  `dts_id` int(11) NOT NULL,
  `dts_name` varchar(80) DEFAULT NULL,
  `dts_lastName` varchar(80) DEFAULT NULL,
  `dts_bithDate` date DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `tyDoc_id` int(11) DEFAULT NULL,
  `dts_doc` double DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `dts_addr` varchar(80) DEFAULT NULL,
  `serialTel_id` int(11) DEFAULT NULL,
  `dts_tel` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dts`
--

INSERT INTO `dts` (`dts_id`, `dts_name`, `dts_lastName`, `dts_bithDate`, `sex_id`, `tyDoc_id`, `dts_doc`, `city_id`, `dts_addr`, `serialTel_id`, `dts_tel`) VALUES
(6, 'luna', 'gar', '2000-01-12', 2, 3, 1232124334, 13, '0', NULL, 1233211212),
(7, 'Juana', 'Peráz', '0000-00-00', 2, 1, 12312312, 13, 'carr 213 123123 12', NULL, 1231231212);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dtsemp`
--

CREATE TABLE `dtsemp` (
  `dtsEmp_id` int(11) NOT NULL,
  `dtsEmp_name` varchar(80) DEFAULT NULL,
  `dtsEmp_lastName` varchar(80) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `tyDoc_id` int(11) DEFAULT NULL,
  `dtsEmp_doc` double DEFAULT NULL,
  `dtsEmp_addr` varchar(80) DEFAULT NULL,
  `dtsEmp_tel` double DEFAULT NULL,
  `dtsEmp_bithDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp`
--

CREATE TABLE `emp` (
  `emp_id` int(11) NOT NULL,
  `dts_id` int(11) DEFAULT NULL,
  `reg_id` int(11) DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pag`
--

CREATE TABLE `pag` (
  `pag_id` int(11) NOT NULL,
  `pag_typ` varchar(10) DEFAULT NULL,
  `pag_code` int(11) DEFAULT NULL,
  `pag_nam` varchar(60) DEFAULT NULL,
  `pag_text` text DEFAULT NULL,
  `pag_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pag`
--

INSERT INTO `pag` (`pag_id`, `pag_typ`, `pag_code`, `pag_nam`, `pag_text`, `pag_img`) VALUES
(1, 'Home', 1, 'Sobre Nosotros', 'Somos una red de firmas presente en 156 países con más de 295,000 personas comprometidas con entregar calidad en los servicios de auditoría, impuestos y consultoría de negocios.', 'data:image/jpeg;base64,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'),
(2, 'Home', 2, 'Estamos Ubicados', 'En la *******', 'https://www.tcgroupsolutions.com/wp-content/uploads/2021/03/retail-intelligence-tc-street-2.png'),
(3, 'Home', 3, 'Horarios', 'Horario de apertura\r\nlunes\r\n\r\n8:00am - 7:00pm\r\n\r\nmartes\r\n\r\n8:00am - 7:00pm\r\n\r\nmiércoles\r\n\r\n8:00am - 7:00pm\r\n\r\njueves\r\n\r\n8:00am - 7:00pm\r\n\r\nviernes\r\n\r\n8:00am - 7:00pm\r\n\r\nsábado\r\n\r\n8:00am - 7:00pm\r\n\r\ndomingo\r\n\r\nCerrado', 'https://cdn-icons-png.flaticon.com/512/4689/4689650.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg`
--

CREATE TABLE `reg` (
  `reg_id` int(11) NOT NULL,
  `reg_ema` varchar(80) DEFAULT NULL,
  `reg_usrName` varchar(80) DEFAULT NULL,
  `reg_pass` varchar(80) DEFAULT NULL,
  `reg_term` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reg`
--

INSERT INTO `reg` (`reg_id`, `reg_ema`, `reg_usrName`, `reg_pass`, `reg_term`) VALUES
(1, 'lunMa@gmail.com', 'luGar123', '123321', 'on'),
(2, 'juanaAl@gmail.com', 'Jiana123', 'Jiana123123', 'on');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serialtel`
--

CREATE TABLE `serialtel` (
  `serialTel_id` int(11) NOT NULL,
  `serialTel_pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sex`
--

CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL,
  `sex_nam` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sex`
--

INSERT INTO `sex` (`sex_id`, `sex_nam`) VALUES
(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `srv`
--

CREATE TABLE `srv` (
  `srv_id` int(11) NOT NULL,
  `srv_nam` varchar(60) DEFAULT NULL,
  `srv_code` varchar(40) DEFAULT NULL,
  `srv_dsc` text DEFAULT NULL,
  `srv_img` text DEFAULT NULL,
  `srv_prc` double DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `srv`
--

INSERT INTO `srv` (`srv_id`, `srv_nam`, `srv_code`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) VALUES
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
  `sta_nam` varchar(15) DEFAULT NULL,
  `sta_des` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sta`
--

INSERT INTO `sta` (`sta_id`, `sta_nam`, `sta_des`) VALUES
(1, 'Activo', NULL),
(2, 'Inactivo', NULL),
(3, 'Por confirmar', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tydoc`
--

CREATE TABLE `tydoc` (
  `tyDoc_id` int(11) NOT NULL,
  `tyDoc_nam` varchar(30) DEFAULT NULL,
  `tyDoc_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tydoc`
--

INSERT INTO `tydoc` (`tyDoc_id`, `tyDoc_nam`, `tyDoc_desc`) VALUES
(1, 'RC', 'Registro Civil'),
(2, 'TI', 'Targeta De Identidad'),
(3, 'CC', 'Cedula Ciudadana'),
(4, 'CE', 'Cedula Extrangera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE `usr` (
  `usr_id` int(11) NOT NULL,
  `dts_id` int(11) DEFAULT NULL,
  `reg_id` int(11) DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usr`
--

INSERT INTO `usr` (`usr_id`, `dts_id`, `reg_id`, `sta_id`) VALUES
(1, 6, 1, 1),
(2, 7, 2, 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_tusr`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_tusr` (
`ID De Usuario` int(11)
,`Estado ID` int(11)
,`Estado` varchar(15)
,`Nombre` varchar(80)
,`Apellido` varchar(80)
,`Fecha De Nacimiento` date
,`Género ID` int(11)
,`Género` varchar(20)
,`Tipo De Documento ID` int(11)
,`Tipo De Documento` varchar(30)
,`Número De Documento` double
,`Dirección` varchar(80)
,`Serial Telefónico` int(11)
,`Número De Teléfono` double
,`Email` varchar(80)
,`Nombre De Usuario` varchar(80)
,`Contraseña` varchar(80)
,`Terminos Y Condiciones` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_tusr`
--
DROP TABLE IF EXISTS `v_tusr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tusr`  AS SELECT `u`.`usr_id` AS `ID De Usuario`, `s`.`sta_id` AS `Estado ID`, `s`.`sta_nam` AS `Estado`, `d`.`dts_name` AS `Nombre`, `d`.`dts_lastName` AS `Apellido`, `d`.`dts_bithDate` AS `Fecha De Nacimiento`, `se`.`sex_id` AS `Género ID`, `se`.`sex_nam` AS `Género`, `td`.`tyDoc_id` AS `Tipo De Documento ID`, `td`.`tyDoc_nam` AS `Tipo De Documento`, `d`.`dts_doc` AS `Número De Documento`, `d`.`dts_addr` AS `Dirección`, `d`.`serialTel_id` AS `Serial Telefónico`, `d`.`dts_tel` AS `Número De Teléfono`, `r`.`reg_ema` AS `Email`, `r`.`reg_usrName` AS `Nombre De Usuario`, `r`.`reg_pass` AS `Contraseña`, `r`.`reg_term` AS `Terminos Y Condiciones` FROM (((((`usr` `u` join `dts` `d` on(`u`.`dts_id` = `d`.`dts_id`)) join `reg` `r` on(`u`.`reg_id` = `r`.`reg_id`)) join `sta` `s` on(`u`.`sta_id` = `s`.`sta_id`)) join `sex` `se` on(`d`.`sex_id` = `se`.`sex_id`)) join `tydoc` `td` on(`d`.`tyDoc_id` = `td`.`tyDoc_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`cita_id`),
  ADD UNIQUE KEY `cita_date` (`cita_date`),
  ADD KEY `usr_id` (`usr_id`,`srv_id`,`emp_id`,`sta_id`),
  ADD KEY `srvPk_citaFK_srv_id` (`srv_id`),
  ADD KEY `empPk_citaFK_emp_id` (`emp_id`),
  ADD KEY `staPk_citaFK_sta_id` (`sta_id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indices de la tabla `dts`
--
ALTER TABLE `dts`
  ADD PRIMARY KEY (`dts_id`),
  ADD UNIQUE KEY `dts_doc` (`dts_doc`),
  ADD KEY `sex_id` (`sex_id`,`tyDoc_id`,`city_id`,`serialTel_id`),
  ADD KEY `serialTelPk_dtsFK_serialTel_id` (`serialTel_id`),
  ADD KEY `cityPk_dtsFK_city_id` (`city_id`),
  ADD KEY `tyDocPk_dtsFK_tyDoc_id` (`tyDoc_id`);

--
-- Indices de la tabla `dtsemp`
--
ALTER TABLE `dtsemp`
  ADD PRIMARY KEY (`dtsEmp_id`),
  ADD UNIQUE KEY `dtsEmp_doc` (`dtsEmp_doc`),
  ADD KEY `sex_id` (`sex_id`,`tyDoc_id`),
  ADD KEY `tyDocPk_dtsEmpFK_tyDoc_id` (`tyDoc_id`);

--
-- Indices de la tabla `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `dts_id_2` (`dts_id`,`reg_id`),
  ADD KEY `dts_id` (`dts_id`,`reg_id`,`sta_id`),
  ADD KEY `staPK_empFk_sta_id` (`sta_id`),
  ADD KEY `regPK_empFk_reg_id` (`reg_id`);

--
-- Indices de la tabla `pag`
--
ALTER TABLE `pag`
  ADD PRIMARY KEY (`pag_id`),
  ADD UNIQUE KEY `pag_code` (`pag_code`);

--
-- Indices de la tabla `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`reg_id`),
  ADD UNIQUE KEY `reg_usrName` (`reg_usrName`,`reg_pass`);

--
-- Indices de la tabla `serialtel`
--
ALTER TABLE `serialtel`
  ADD PRIMARY KEY (`serialTel_id`);

--
-- Indices de la tabla `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`),
  ADD UNIQUE KEY `sex_nam` (`sex_nam`);

--
-- Indices de la tabla `srv`
--
ALTER TABLE `srv`
  ADD PRIMARY KEY (`srv_id`),
  ADD UNIQUE KEY `srv_nam` (`srv_nam`,`srv_code`,`srv_dsc`) USING HASH,
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `sta`
--
ALTER TABLE `sta`
  ADD PRIMARY KEY (`sta_id`),
  ADD UNIQUE KEY `sta_nam` (`sta_nam`,`sta_des`) USING HASH;

--
-- Indices de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  ADD PRIMARY KEY (`tyDoc_id`),
  ADD UNIQUE KEY `tyDoc_nam` (`tyDoc_nam`,`tyDoc_desc`) USING HASH;

--
-- Indices de la tabla `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `dts_id_2` (`dts_id`,`reg_id`),
  ADD KEY `dts_id` (`dts_id`,`reg_id`,`sta_id`),
  ADD KEY `staPK_usrFk_sta_id` (`sta_id`),
  ADD KEY `regPK_usrFk_reg_id` (`reg_id`);

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
  MODIFY `dts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `dtsemp`
--
ALTER TABLE `dtsemp`
  MODIFY `dtsEmp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emp`
--
ALTER TABLE `emp`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pag`
--
ALTER TABLE `pag`
  MODIFY `pag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reg`
--
ALTER TABLE `reg`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de la tabla `usr`
--
ALTER TABLE `usr`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `empPk_citaFK_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `emp` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `srvPk_citaFK_srv_id` FOREIGN KEY (`srv_id`) REFERENCES `srv` (`srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staPk_citaFK_sta_id` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usrPk_citaFK_usr_id` FOREIGN KEY (`usr_id`) REFERENCES `usr` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dts`
--
ALTER TABLE `dts`
  ADD CONSTRAINT `cityPk_dtsFK_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `serialTelPk_dtsFK_serialTel_id` FOREIGN KEY (`serialTel_id`) REFERENCES `serialtel` (`serialTel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sexPk_dtsFK_sex_id` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`sex_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tyDocPk_dtsFK_tyDoc_id` FOREIGN KEY (`tyDoc_id`) REFERENCES `tydoc` (`tyDoc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dtsemp`
--
ALTER TABLE `dtsemp`
  ADD CONSTRAINT `sexPk_dtsEmpFK_sex_id` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`sex_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tyDocPk_dtsEmpFK_tyDoc_id` FOREIGN KEY (`tyDoc_id`) REFERENCES `tydoc` (`tyDoc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `dtsPK_empFk_dts_id` FOREIGN KEY (`dts_id`) REFERENCES `dts` (`dts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `regPK_empFk_reg_id` FOREIGN KEY (`reg_id`) REFERENCES `reg` (`reg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staPK_empFk_sta_id` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `srv`
--
ALTER TABLE `srv`
  ADD CONSTRAINT `staPk_srvFK_sta_id` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usr`
--
ALTER TABLE `usr`
  ADD CONSTRAINT `dtsPK_usrFk_dts_id` FOREIGN KEY (`dts_id`) REFERENCES `dts` (`dts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `regPK_usrFk_reg_id` FOREIGN KEY (`reg_id`) REFERENCES `reg` (`reg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staPK_usrFk_sta_id` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

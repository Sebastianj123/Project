-- Base de datos "Salon De Belleza Cabello Bello JJ " (CabelloBelloJJ);

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Crear base de datos
CREATE OR REPLACE DATABASE CabelloBelloJJ 
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Usar la base de datos
USE `CabelloBelloJJ`;

-- Creación de tablas -------------------------------------------------------------------------

    -- Creación de tablas secundarias -----------------------------

-- Tabla De Serie telefonica según país
CREATE TABLE serialTel (
    serialTel_id INT PRIMARY KEY,
    serialTel_pais varchar(50)
);


-- Tabla estado
CREATE TABLE sta(
    sta_id INT PRIMARY KEY AUTO_INCREMENT,
    sta_nam VARCHAR(15),
    sta_des TEXT,
    UNIQUE(sta_nam,sta_des)
);
-- Inserción de datos
INSERT INTO sta (`sta_nam`) VALUES 
('Activo'), 
('Inactivo'), 
('Por confirmar');


-- Tabla Tipo De Documento
CREATE TABLE tyDoc (
    tyDoc_id INT PRIMARY KEY AUTO_INCREMENT,
    tyDoc_nam VARCHAR(30),
    tyDoc_desc TEXT,
    UNIQUE(tyDoc_nam,tyDoc_desc)
);
-- Inserción de datos
INSERT INTO `tyDoc` VALUES 
(NULL, 'RC', 'Registro Civil'),
(NULL, 'TI', 'Targeta De Identidad'),
(NULL, 'CC', 'Cedula Ciudadana'),
(NULL, 'CE', 'Cedula Extrangera');


-- Crear Tabla Sex0
CREATE TABLE sex (
    sex_id INT PRIMARY KEY AUTO_INCREMENT,
    sex_nam VARCHAR(20),
    UNIQUE(sex_nam)
);
-- Inserción de datos
INSERT INTO `sex` VALUES 
(NULL, 'Hombre'),
(NULL, 'Mujer'),
(NULL, 'Otro');


-- Creación tabla "Servicios"
CREATE TABLE srv (
    srv_id INT PRIMARY KEY AUTO_INCREMENT,
    srv_nam VARCHAR(60),
    srv_code VARCHAR(40),
    srv_dsc TEXT,
    srv_img TEXT,
    srv_prc DOUBLE,
    sta_id INT,
    INDEX(sta_id),
    UNIQUE(srv_nam,srv_code,srv_dsc),
    CONSTRAINT `staPk_srvFK_sta_id` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Inserción de datos

INSERT INTO `srv`(`srv_nam`, `srv_code`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) VALUES
('Manicure y pedicure','Este servicio consiste en un tratamiento para las uñas (de las manos y pies). Ofrecemos el arte y la moda para las uñas, por ejemplo, pintándolas en diferentes estilos, también se aplica, repara y quita uñas postizas o extensiones.','001-a','https://bonitta.com.mx/wp-content/uploads/2021/03/bonitta_Tipos-de-manicura-profesional.jpg.webp',40000,1);

INSERT INTO srv (`srv_nam`,`srv_dsc`) VALUES
('Masajes',null),
('Maquillaje',null),
('Depilación',null),
('Tratamientos faciales',null),
('Colorimetría',null),
('Corte de cabello',null),
('Tratamiento capilar',null);


        -- Creación tablas principales --------------------------------------------------------------------------
    -- usuario
-- Creación de la tabla "Registro"
    
CREATE TABLE reg (
    reg_id INT PRIMARY KEY AUTO_INCREMENT,
    reg_ema VARCHAR(80),
    reg_usrName VARCHAR(80),
    reg_pass VARCHAR(80),
    reg_term VARCHAR(10),
    UNIQUE(reg_usrName,reg_pass)
);


-- Tabla Datos
CREATE TABLE dts (
    dts_id INT PRIMARY KEY AUTO_INCREMENT,
    dts_name VARCHAR(80),
    dts_lastName VARCHAR(80),
    dts_bithDate DATE,
    sex_id INT,
    tyDoc_id INT,
    dts_doc DOUBLE,
    dts_addr VARCHAR(80),
    serialTel_id INT,
    dts_tel DOUBLE,
    INDEX(sex_id,tyDoc_id,serialTel_id),
    UNIQUE(dts_doc),
    CONSTRAINT `sexPk_dtsFK_sex_id` FOREIGN KEY (sex_id) REFERENCES sex (sex_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `serialTelPk_dtsFK_serialTel_id` FOREIGN KEY (serialTel_id) REFERENCES serialTel (serialTel_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `tyDocPk_dtsFK_tyDoc_id` FOREIGN KEY (tyDoc_id) REFERENCES tyDoc (tyDoc_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Usuario
CREATE TABLE usr (
    usr_id INT PRIMARY KEY AUTO_INCREMENT,
    dts_id INT,
    reg_id INT,
    sta_id INT,
    INDEX(dts_id,reg_id,sta_id),
    UNIQUE(dts_id,reg_id),
    CONSTRAINT `dtsPK_usrFk_dts_id` FOREIGN KEY (dts_id) REFERENCES `dts`(dts_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `staPK_usrFk_sta_id` FOREIGN KEY (sta_id) REFERENCES `sta`(sta_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `regPK_usrFk_reg_id` FOREIGN KEY (reg_id) REFERENCES `reg`(reg_id) ON DELETE CASCADE ON UPDATE CASCADE
);

    -- Empleado
-- Tabla Datos Empleado
CREATE TABLE dtsEmp (
    dtsEmp_id INT PRIMARY KEY AUTO_INCREMENT,
    dtsEmp_name VARCHAR(80),
    dtsEmp_lastName VARCHAR(80),
    sex_id INT,
    tyDoc_id INT,
    dtsEmp_doc DOUBLE,
    dtsEmp_addr VARCHAR(80),
    dtsEmp_tel DOUBLE,
    dtsEmp_bithDate DATE,
    INDEX(sex_id,tyDoc_id),
    UNIQUE(dtsEmp_doc),
    CONSTRAINT `sexPk_dtsEmpFK_sex_id` FOREIGN KEY (sex_id) REFERENCES sex (sex_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `tyDocPk_dtsEmpFK_tyDoc_id` FOREIGN KEY (tyDoc_id) REFERENCES tyDoc (tyDoc_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Empleado
CREATE TABLE emp (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    dts_id INT,
    reg_id INT,
    sta_id INT,
    INDEX(dts_id,reg_id,sta_id),
    UNIQUE(dts_id,reg_id),
    CONSTRAINT `dtsPK_empFk_dts_id` FOREIGN KEY (dts_id) REFERENCES `dts`(dts_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `staPK_empFk_sta_id` FOREIGN KEY (sta_id) REFERENCES `sta`(sta_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `regPK_empFk_reg_id` FOREIGN KEY (reg_id) REFERENCES `reg`(reg_id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Creación Tabla Citas
CREATE TABLE cita (
    cita_id INT PRIMARY KEY AUTO_INCREMENT,
    usr_id INT,
    cita_date DATETIME,
    srv_id INT,
    emp_id INT,
    sta_id INT,
    INDEX(usr_id,srv_id,emp_id,sta_id),
    UNIQUE(cita_date),
    CONSTRAINT `usrPk_citaFK_usr_id` FOREIGN KEY (usr_id) REFERENCES usr (usr_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `srvPk_citaFK_srv_id` FOREIGN KEY (srv_id) REFERENCES srv (srv_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `empPk_citaFK_emp_id` FOREIGN KEY (emp_id) REFERENCES emp (emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `staPk_citaFK_sta_id` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Creación de procediminetos almacenados ----------------------------------------------------------------------------------------

-- Ingresar datos de usuario
DELIMITER //
CREATE PROCEDURE i_user (
    IN nam VARCHAR(80), 
    IN ltName VARCHAR(80), 
    IN birth DATE, 
    IN sex INT,
    IN tyDoc INT,
    IN doc DOUBLE,
    IN addr VARCHAR(80),
	IN serie INT,
    IN tel DOUBLE,
    IN em VARCHAR(80), 
    IN usrNam VARCHAR(80), 
    IN pass VARCHAR(80), 
    IN term VARCHAR(10)
)
BEGIN
    DECLARE dtsId INT;
    DECLARE usrId INT;
    DECLARE regId INT;
    
    -- Insertar en la tabla dts y obtener el último ID insertado
    INSERT INTO `dts` VALUES (NULL, nam, ltName, birth, sex, tyDoc, doc, addr, serie, tel);
    SET dtsId = LAST_INSERT_ID();
    
    -- Insertar en la tabla reg y obtener el último ID insertado
    INSERT INTO reg VALUES (NULL, em, usrNam, pass, term);
    SET regId = LAST_INSERT_ID();
    
    -- Insertar en la tabla usr con los IDs obtenidos
    INSERT INTO usr VALUES (NULL, dtsId, regId, 3);
    SET usrId = LAST_INSERT_ID();

    CALL v_usrId(usrId);

END //
DELIMITER ();

-- Actualizar estado de usuario por id
DELIMITER // 
CREATE PROCEDURE u_usrStaId (
    IN id INT,
    IN estado INT)
BEGIN
UPDATE `usr` SET `sta_id` = estado WHERE `usr_id` = id;

call v_usrStaId(id);

END //
DELIMITER ();

-- Ver datos de usuario mediante id
DELIMITER //
CREATE PROCEDURE v_usrId (IN id INT)
BEGIN 

SELECT `usr_id` 'ID De Usuario', s.`sta_id` 'Estado ID', `sta_nam` 'Estado', `dts_name` 'Nombre', `dts_lastName` 'Apellido', `dts_bithDate` 'Fecha De Nacimiento', se.`sex_id` 'Género ID', `sex_nam` 'Género', td.`tyDoc_id` 'Tipo De Documento ID', `tyDoc_nam` 'Tipo De Documento', `dts_doc` 'Número De Documento', `dts_addr` 'Dirección', `serialTel_id` 'Serial Telefónico', `dts_tel` 'Número De Teléfono', `reg_ema` 'Email', `reg_usrName` 'Nombre De Usuario', `reg_pass` 'Contraseña', `reg_term` 'Terminos Y Condiciones'
    FROM usr u INNER JOIN
    dts d on u.dts_id = d.dts_id INNER JOIN
    reg r on u.reg_id = r.reg_id INNER JOIN
    sta s on u.sta_id = s.sta_id INNER JOIN
    sex se on d.sex_id = se.sex_id INNER JOIN
    tyDoc td on d.tyDoc_id = td.tyDoc_id
    WHERE u.usr_id = id;
END //

DELIMITER ();

-- Ver Estado de usuario por id
DELIMITER //
CREATE PROCEDURE v_usrStaId (
    IN id INT
)
BEGIN

SELECT `usr_id` 'ID De Usuario', d.dts_name 'Nombre', d.dts_lastName 'Apellido',s.`sta_id` 'Estado ID', `sta_nam` 'Estado' FROM 
`usr` u INNER JOIN
`sta` s ON u.sta_id = s.sta_id INNER JOIN 
dts d on u.dts_id = d.dts_id
WHERE u.usr_id = id;

END //

DELIMITER ();

-- Ver Registro de usuario por id 
DELIMITER //
CREATE PROCEDURE v_usrRegId (
    IN id INT
)
BEGIN

SELECT `usr_id` 'ID De Usuario', d.dts_name 'Nombre', d.dts_lastName 'Apellido', r.reg_ema 'Email', r.reg_usrName 'Nombre De Usuario', s.`sta_id` 'Estado ID', `sta_nam` 'Estado' FROM 
`usr` u INNER JOIN
`sta` s ON u.sta_id = s.sta_id INNER JOIN
`dts` d ON u.dts_id = d.dts_id INNER JOIN
`reg` r ON u.reg_id = r.reg_id
WHERE u.usr_id = id;

END //
DELIMITER ();

-- Crear nuevo Servicio
DELIMITER $$
CREATE PROCEDURE i_srv (
    IN nam VARCHAR(60),
    cod VARCHAR(40),
    dsc TEXT,
    img TEXT,
    prc DOUBLE,
    sta INT
) 

INSERT INTO `srv`(`srv_id`, `srv_nam`, `srv_code`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) 
VALUES (NULL,nam,cod,dsc,img,prc,2);
$$

-- Ver Servicio mediante id
DELIMITER $$
CREATE PROCEDURE v_srv (IN id int) 
SELECT `srv_id`,`srv_nam`,`srv_code`,`srv_dsc`,`srv_img`,`srv_prc`,a.`sta_id`,a.`sta_nam` FROM srv s INNER JOIN 
sta a ON s.sta_id = a.sta_id WHERE s.srv_id = id AND a.sta_id = 1;
$$

-- Ver todos los Servicios Activos
DELIMITER $$
CREATE PROCEDURE vT_srvA () 
SELECT `srv_id`,`srv_nam`,`srv_code`,`srv_dsc`,`srv_img`,`srv_prc`,a.`sta_id`,a.`sta_nam` FROM srv s INNER JOIN 
sta a ON s.sta_id = a.sta_id WHERE a.sta_id = 1;
$$

-- Ver todos los Servicios
DELIMITER $$
CREATE PROCEDURE vT_srv () 
SELECT `srv_id`,`srv_nam`,`srv_code`,`srv_dsc`,`srv_img`,`srv_prc`,a.`sta_id`,a.`sta_nam` FROM srv s INNER JOIN 
sta a ON s.sta_id = a.sta_id;
$$

-- Cambiar el estado de los servicios
DELIMITER $$
CREATE PROCEDURE u_srvS (
    IN id INT,
	sta INT
)
UPDATE `srv` SET `sta_id` = sta WHERE srv_id = id;
$$

-- Actualizar Servicios
DELIMITER $$
CREATE PROCEDURE u_srv (
	IN id INT,
    nam VARCHAR(60),
    cod VARCHAR(40),
    dsc TEXT,
    img TEXT,
    prc DOUBLE,
    sta INT
)
UPDATE `srv` SET `srv_nam`= nam,`srv_code`= cod,`srv_dsc`= dsc,`srv_img`= img,`srv_prc`=prc,`sta_id`=sta 
WHERE `srv_id` = ID;
$$
-- Creación de vistas -------------------------------------------------------------------------------------------------------------------------

-- -- Ver todos los datos de los usuarios
CREATE VIEW v_tUsr AS
SELECT `usr_id` 'ID De Usuario', s.`sta_id` 'Estado ID', `sta_nam` 'Estado', `dts_name` 'Nombre', `dts_lastName` 'Apellido', `dts_bithDate` 'Fecha De Nacimiento', se.`sex_id` 'Género ID', `sex_nam` 'Género', td.`tyDoc_id` 'Tipo De Documento ID', `tyDoc_nam` 'Tipo De Documento', `dts_doc` 'Número De Documento', `dts_addr` 'Dirección', `serialTel_id` 'Serial Telefónico', `dts_tel` 'Número De Teléfono', `reg_ema` 'Email', `reg_usrName` 'Nombre De Usuario', `reg_pass` 'Contraseña', `reg_term` 'Terminos Y Condiciones'
    FROM usr u INNER JOIN
    dts d on u.dts_id = d.dts_id INNER JOIN
    reg r on u.reg_id = r.reg_id INNER JOIN
    sta s on u.sta_id = s.sta_id INNER JOIN
    sex se on d.sex_id = se.sex_id INNER JOIN
    tyDoc td on d.tyDoc_id = td.tyDoc_id;
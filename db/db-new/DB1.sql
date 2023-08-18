CREATE OR REPLACE DATABASE cabellobellojj;
USE cabellobellojj;

-- CREACIÓN DE TABLAS

-- STADO
CREATE TABLE sta (
    sta_id INT PRIMARY KEY AUTO_INCREMENT,
    sta_name VARCHAR(20),
    sta_dsc text,
    UNIQUE(sta_name,sta_id)
);

INSERT INTO sta (`sta_name`, `sta_dsc`) VALUES 
('Activo','Este estado respecta a un usuario o servicio activo en la plataforma'), 
('Inactivo','Este estado respecta a un usuario o servicio inactivo en la plataforma'), 
('Por confirmar','Este estado respecta a un usuario o servicio en proceso de ser activado en la plataforma ya que requiere de un proceso para este mismo');
    
-- TYDOCS
CREATE TABLE tyDoc (
    tyDoc_id INT PRIMARY KEY AUTO_INCREMENT,
    tyDoc_name VARCHAR(30),
    tyDoc_dsc TEXT,
    UNIQUE(tyDoc_name,tyDoc_dsc)
);

	-- Inserción de datos
	INSERT INTO `tyDoc` VALUES 
(NULL, 'RC', 'Registro Civil'),
(NULL, 'TI', 'Targeta De Identidad'),
(NULL, 'CC', 'Cedula Ciudadana'),
(NULL, 'CE', 'Cedula Extrangera');

-- SERVICIO
CREATE TABLE srv (
    srv_id INT PRIMARY KEY AUTO_INCREMENT,
    srv_name VARCHAR(60),
    srv_cod VARCHAR(40),
    srv_dsc TEXT,
    srv_img TEXT,
    srv_prc DOUBLE,
    sta_id INT,
    INDEX(sta_id),
    UNIQUE(srv_name,srv_cod,srv_dsc),
    CONSTRAINT `srv_sta_idFk_sta_sta_idPK` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `srv`(`srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) 
VALUES
('Manicure y pedicure','001-a','Este servicio consiste en un tratamiento para las uñas (de las manos y pies). Ofrecemos el arte y la moda para las uñas, por ejemplo, pintándolas en diferentes estilos, también se aplica, repara y quita uñas postizas o extensiones.','https://bonitta.com.mx/wp-content/uploads/2021/03/bonitta_Tipos-de-manicura-profesional.jpg.webp',40000,1),
('Masajes','002-a','Es un tipo de medicina integral en la que un masajista frota y presiona firmemente la piel, los músculos, los tendones y los ligamentos. En la masoterapia, un especialista frota y presiona los tejidos blandos del cuerpo. Los tejidos blandos incluyen músculo, tejido conectivo, tendones, ligamentos y piel.','https://velkaspa.com/wp-content/uploads/2022/09/blog_3.jpg',100000,1),
('Maquillaje','003-a','Aplicar cosméticos a alguien o a una parte de su cuerpo, especialmente su rostro, para embellecerlo o modificar su aspecto.','https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/04/04/16490814041338.jpg',35990,1),
('Depilación','004-a','La depilación es una práctica muy común entre las mujeres, que se realiza comúnmente en las cejas, el rostro, las axilas, las piernas y la Zona V. Existen diferentes tipos de depilación íntima, como la cera, cremas, cuchillas y el láser, siendo esta última realizada por un experto.','https://www.diariamenteali.com/medias/depilacion-con.cera-crema-o-laser-1900Wx500H?context=bWFzdGVyfGltYWdlc3w5NDcwOXxpbWFnZS9qcGVnfGhhOS9oNzkvOTA3NDM5ODU2MDI4Ni9kZXBpbGFjaW9uLWNvbi5jZXJhLWNyZW1hLW8tbGFzZXIgXzE5MDBXeDUwMEh8ZTJkNTJkYjc0NjZhZWVlZGNkMjU4OTM4OGI4ZTRlZTE5MmMxMDBlZDQzNjhkMmRmMGU2ZDJkMTk3Y2ZhOTc2Ng',20000,1),
('Tratamientos faciales','005-a','Este tratamiento basado en ultrasonidos sirve para mejorar las arrugas y líneas del escote, elevan la piel del cuello, cejar y bajo del mentón. Consiste en estimular con ultrasonidos la producción de nuevo colágeno y elastina en las capas profundas de la piel.','https://blog.farmaelglobo.com/wp-content/uploads/2021/06/positive-dark-skinned-woman-with-afro-combed-hair-wears-headband-cares-about-facial-skin-wipes-cheek-with-cosmetic-sponge-keeps-eyes-shut-with-pleasure.jpg',18000,1),
('Cortes De Cabello','006-a','Corte de pelo desfilado, la primera idea que te surge. Es el más común y el primero que te van a ofrecer los peluqueros, porque sigue funcionando como el primer día.','https://media.vozpopuli.com/2022/07/cortes-de-pelo-corto.jpeg',23000,1),
('Tratamiento Capilar','007-a','El tratamiento capilar son cuidados que se aplican al cabello y cuya finalidad es mantener la salud y buena apariencia del mismo. Actualmente existen múltiples tratamientos capilares para cada problema, como por ejemplo para tratar la caída del cabello, el pelo graso, hidratar o dar volumen.','https://www.todoimplantecapilar.com/wp-content/uploads/2019/09/Tratamientos-para-la-alopecia-7-alternativas-para-tener-en-cuenta.jpg',80000,1);


-- ROL
CREATE TABLE rol (
	rol_id INT PRIMARY KEY AUTO_INCREMENT,
    rol_name VARCHAR(30),
    rol_dsc TEXT
);

INSERT INTO rol VALUES 
    (NULL,'Administrador','...'),
    (NULL,'Empleado','...'),
    (NULL,'Cliente','...');

-- SEXO/GENERO
CREATE TABLE sex (
    sex_id INT PRIMARY KEY AUTO_INCREMENT,
    sex_name VARCHAR(20),
    sex_dsc TEXT,
    UNIQUE(sex_name,sex_dsc)
);
-- Inserción de datos
	INSERT INTO `sex` VALUES 
(NULL, 'Hombre',''),
(NULL, 'Mujer',''),
(NULL, 'Otro','');

-- PERFIL
CREATE TABLE `per` (
	per_id INT AUTO_INCREMENT PRIMARY KEY,
    per_name VARCHAR(120),
    sex_id INT,
    per_brithDate DATE,
    tyDoc_id INT,
    per_doc DOUBLE,
    per_tel DOUBLE,
    per_ema VARCHAR(80),
    per_usrName VARCHAR(80),
    per_pass VARCHAR(80),
    UNIQUE(per_doc,per_usrName,per_pass),
    INDEX(tyDoc_id,sex_id),
    CONSTRAINT `per_tyDoc_idFK_tyDoc_tyDoc_idPK` FOREIGN KEY (tyDoc_id) REFERENCES tyDoc (tyDoc_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `per_sex_idFK_sex_sex_idPK` FOREIGN KEY (sex_id) REFERENCES sex (sex_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- USER 
CREATE TABLE `user` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    per_id INT,
    rol_id INT,
    sta_id INT,
    INDEX(per_id,rol_id,sta_id),
    CONSTRAINT `user_per_idFK_per_per_idPK` FOREIGN KEY (per_id) REFERENCES per (per_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_rol_id_rol_rol_idPK` FOREIGN KEY (rol_id) REFERENCES rol (rol_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_sta_idFK_sta_sta_idPK` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE table emp_srv (
	emp_srv_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    srv_id INT,
    UNIQUE(emp_srv_id,user_id,srv_id),
    INDEX(user_id,srv_id),
    CONSTRAINT `emp_srv_user_idFK_user_user_idPK` FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `emp_srv_SRV_idFK_srv_srv_idPK` FOREIGN KEY (srv_id) REFERENCES srv (srv_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- CITA
CREATE TABLE cita (
	cita_id INT PRIMARY KEY AUTO_INCREMENT,
    cita_date DATETIME,
    user_id INT,
    emp_srv_id INT,
    sta_id INT,
    INDEX(user_id,emp_srv_id,sta_id),
    CONSTRAINT `cita_user_idFK_user_user_idPK` FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `cita_emp_srv_idFK_emp_srv_emp_srv_idPK` FOREIGN KEY (emp_srv_id) REFERENCES emp_srv (emp_srv_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `cita_sta_idFK_sta_sta_idPK` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE topic (
	topic_id INT AUTO_INCREMENT PRIMARY KEY,
    topic_name VARCHAR(80),
    topic_dsc TEXT,
    topic_img TEXT
);

CREATE TABLE empr (
	empr_id INT AUTO_INCREMENT PRIMARY KEY,
    empr_name VARCHAR(80),
    topic_id INT,
    empr_logo TEXT,
    addr VARCHAR(80),
    INDEX(topic_id),
    CONSTRAINT `empr_topic_idFK_topic_topic_idPK` FOREIGN KEY (topic_id) REFERENCES topic (topic_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `info` (
	info_id INT AUTO_INCREMENT PRIMARY KEY,
    empr_id INT,
    info_name VARCHAR(70),
    info_text TEXT,
    info_img TEXT,
    UNIQUE(empr_id),
    INDEX(empr_id),
    CONSTRAINT `info_empr_idFK_empr_empr_idPK` FOREIGN KEY (empr_id) REFERENCES empr (empr_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Sta --------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE i_sta (
	IN name VARCHAR(20),
    IN dsc TEXT
)
BEGIN
	INSERT INTO sta VALUES (NULL,name,dsc);
END
$$


DELIMITER $$
CREATE PROCEDURE u_sta (
    IN id INT,
    IN changeId INT,
	IN name VARCHAR(20),
    IN dsc TEXT
)
BEGIN

	UPDATE `sta` SET `sta_id` = changeId WHERE `sta_id` = id;
	UPDATE `sta` SET `sta_name` = name, `sta_dsc` = dsc WHERE `sta_id` = changeId;
    
END
$$

DELIMITER $$
CREATE PROCEDURE v_sta ()
BEGIN
	SELECT * FROM sta;
END
$$

-- TyDoc --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE i_tyDoc (
	IN name VARCHAR(30),
    IN dsc TEXT
)
BEGIN
	INSERT INTO `tydoc`(`tyDoc_name`, `tyDoc_dsc`) VALUES (name,dsc);
END
$$

DELIMITER $$
CREATE PROCEDURE u_tyDoc (
	IN id INT,
    IN changeId INT,
	IN name VARCHAR(30),
    IN dsc TEXT
)
BEGIN
	UPDATE `tydoc` SET `tyDoc_id` = changeId WHERE `tyDoc_id` = id; 
	UPDATE `tydoc` SET `tyDoc_name`= name,`tyDoc_dsc`=dsc WHERE `tyDoc_id` = changeId;
END
$$

DELIMITER $$
CREATE PROCEDURE v_tyDoc ()
BEGIN
	SELECT * FROM `tydoc`;	
END
$$


-- SEX --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE i_sex (
	IN name VARCHAR(20),
    IN dsc TEXT
)
BEGIN
	INSERT INTO `sex`(`sex_name`, `sex_dsc`) VALUES (name,dsc);
END
$$

DELIMITER $$
CREATE PROCEDURE u_sex (
    IN id INT,
    IN changeId INT,
	IN name VARCHAR(20),
    IN dsc TEXT
)
BEGIN
	UPDATE `sex` SET `sex_id` = changeId WHERE `sex_id` = id;
    UPDATE `sex` SET `sex_name` = name, `sex_dsc` = dsc WHERE `sex_id` = changeId;
END
$$

DELIMITER $$
CREATE PROCEDURE v_sex ()
BEGIN
	SELECT * FROM `sex`;	
END
$$


-- Usuarios ------------------------------------------------------------------------------
    -- Cliente -----------------------------------------------------------------

    DELIMITER $$
    CREATE PROCEDURE i_client (
        IN name VARCHAR(120),
        IN sex INT,
        IN `date` DATE,
        IN tyDoc INT,
        IN doc DOUBLE,
        IN tel DOUBLE,
        IN ema VARCHAR(80),
        IN usrName VARCHAR(80),
        IN pass VARCHAR(80)
    )
    BEGIN

        DECLARE idPer INT;
        INSERT INTO `per`(`per_name`, `sex_id`, `per_brithDate`, `tyDoc_id`, `per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`) 
        VALUES 
        (name, sex, `date`, tyDoc, doc, tel, ema, usrName, pass);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `user`(`per_id`, `rol_id`, `sta_id`) 
        VALUES (idPer, 3, 3);
    END
    $$

    -- Empleado --------------------------------------------------------


    DELIMITER $$
    CREATE PROCEDURE i_emp (
        IN name VARCHAR(120),
        IN sex INT,
        IN `date` DATE,
        IN tyDoc INT,
        IN doc DOUBLE,
        IN tel DOUBLE,
        IN ema VARCHAR(80),
        IN usrName VARCHAR(80),
        IN pass VARCHAR(80)
    )
    BEGIN

        DECLARE idPer INT;
        INSERT INTO `per`(`per_name`, `sex_id`, `per_brithDate`, `tyDoc_id`, `per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`) 
        VALUES 
        (name, sex, `date`, tyDoc, doc, tel, ema, usrName, pass);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `user`(`per_id`, `rol_id`, `sta_id`) 
        VALUES (idPer, 2, 3);
    END
    $$

DELIMITER $$
CREATE PROCEDURE v_users ()
BEGIN
	SELECT U.`user_id`, P.`per_id`, `per_name`, Se.`sex_id`, Se.sex_name, `per_brithDate`, D.`tyDoc_id`, D.tyDoc_name, D.tyDoc_dsc ,`per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, R.`rol_id`, R.rol_name, R.rol_dsc, S.`sta_id`, S.sta_name, S.sta_dsc FROM `user` U  
    INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN tyDoc D ON P.tyDoc_id = D.tyDoc_id
	INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex Se ON P.sex_id = Se.sex_id;
END
$$

DELIMITER $$
CREATE PROCEDURE v_users_IN_staId_rolId (
    IN staId INT,
    IN rolId INT
    )
BEGIN
	SELECT U.`user_id`, P.`per_id`, `per_name`, Se.`sex_id`, Se.sex_name, `per_brithDate`, D.`tyDoc_id`, D.tyDoc_name, D.tyDoc_dsc ,`per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, R.`rol_id`, R.rol_name, R.rol_dsc, S.`sta_id`, S.sta_name, S.sta_dsc FROM `user` U  
    INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN tyDoc D ON P.tyDoc_id = D.tyDoc_id
	INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex Se ON P.sex_id = Se.sex_id
    WHERE S.sta_id = staId AND R.rol_id = rolId;
END
$$

DELIMITER $$
CREATE PROCEDURE v_users_IN_ID (
    IN id INT
    )
BEGIN
	SELECT U.`user_id`, P.`per_id`, `per_name`, Se.`sex_id`, Se.sex_name, `per_brithDate`, D.`tyDoc_id`, D.tyDoc_name, D.tyDoc_dsc ,`per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, R.`rol_id`, R.rol_name, R.rol_dsc, S.`sta_id`, S.sta_name, S.sta_dsc FROM `user` U  
    INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN tyDoc D ON P.tyDoc_id = D.tyDoc_id
	INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex Se ON P.sex_id = Se.sex_id
    WHERE U.user_id = id;
END
$$

DELIMITER $$
CREATE PROCEDURE v_usersReg (
    IN usr VARCHAR(80)
    )
BEGIN
	SELECT U.user_id, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, S.sta_id, S.sta_name, S.sta_dsc
    FROM `per` P INNER JOIN
    user U ON U.per_id = P.per_id INNER JOIN
    sta S ON U.sta_id = S.sta_id
    WHERE `per_ema` = usr OR `per_usrName` = usr OR `per_tel` = usr AND U.sta_id = 1;
END
$$

DELIMITER $$
CREATE PROCEDURE u_users (
    IN id_usr INT,
    IN id_per INT,
    IN name VARCHAR(120),
    IN sex INT,
    IN `date` DATE,
    IN tyDoc INT,
    IN doc DOUBLE,
    IN tel DOUBLE,
    IN ema VARCHAR(80),
    IN usrName VARCHAR(80),
    IN pass VARCHAR(80),
    IN rolId INT, 
    IN staId INT)
BEGIN

-- CALL v_users_IN_ID (id_usr);

UPDATE `per` SET 
`per_name`= name
,`sex_id`= sex
,`per_brithDate`= `date`
,`tyDoc_id`= tydoc
,`per_doc`= doc
,`per_tel`= tel
,`per_ema`= ema
,`per_usrName`= usrName
,`per_pass`= pass
WHERE per_id = id_per;

UPDATE `user` SET 
`rol_id`= rolId
,`sta_id`= staId
 WHERE user_id = id_usr;

CALL v_users_IN_ID (id_usr);

END
$$

-- Rol --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE i_rol (
    IN name VARCHAR(30),
    IN dsc TEXT
)
BEGIN
	INSERT INTO `rol`(`rol_name`, `rol_dsc`) VALUES (name,dsc);
END
$$

DELIMITER $$
CREATE PROCEDURE u_rol (
    IN id INT,
    IN changeId INT,
    IN name VARCHAR(30),
    IN dsc TEXT
)
BEGIN
	UPDATE rol SET rol_id = changeId WHERE rol_id = id;
    UPDATE rol SET `rol_name` = name, `rol_dsc` = dsc WHERE rol_id = changeId;
END
$$

DELIMITER $$
CREATE PROCEDURE v_rol ()
BEGIN
	SELECT * FROM rol;
END
$$

DELIMITER $$
CREATE PROCEDURE v_rol_IN_id (
    IN id INT
)
BEGIN
	SELECT * FROM rol WHERE rol_id = id;
END
$$

-- Servicios --------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE i_srv (
	IN name VARCHAR(60),
    IN cod varchar(40),
    IN dsc TEXT,
    IN img TEXT,
    IN prc DOUBLE
)
BEGIN
	INSERT INTO `srv`(`srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id`) VALUES (name,cod,dsc,img,prc,3);
END
$$

DELIMITER $$
CREATE PROCEDURE u_srv (
    IN id INT,
    IN changeId INT,
	IN name VARCHAR(60),
    IN cod varchar(40),
    IN dsc TEXT,
    IN img TEXT,
    IN prc DOUBLE,
    IN sta INT
)
BEGIN
	UPDATE srv SET srv_id = changeId WHERE srv_id = id;
    UPDATE srv SET srv_name = name, srv_cod = cod, srv_dsc = dsc, srv_img = img, srv_prc = prc, sta_id = sta WHERE srv_id = changeId;
END
$$

DELIMITER $$
CREATE PROCEDURE v_srv ()
BEGIN
	SELECT `srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id` FROM `srv`;	
END
$$

DELIMITER $$
CREATE PROCEDURE v_srvA ()
BEGIN
	SELECT `srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id` FROM `srv` WHERE sta_id = 1;	
END
$$

DELIMITER $$
CREATE PROCEDURE v_srv_IN_id (
	IN id INT
)
BEGIN
	SELECT `srv_id`, `srv_name`, `srv_cod`, `srv_dsc`, `srv_img`, `srv_prc`, `sta_id` FROM `srv` WHERE `srv_id` = id;	
END
$$

--- Cita ---------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE i_cita (
	IN `date` DATETIME,
    IN `usr` INT,
    IN emp_srv INT
)
BEGIN
	INSERT INTO `cita`(`cita_date`, `user_id`, `emp_srv_id`, `sta_id`) VALUES (`date`,usr,emp_srv,3);
END
$$

DELIMITER $$
CREATE PROCEDURE u_cita (
	IN id INT,
    IN changeId INT,
    IN `date` DATETIME,
    IN `usr` INT,
    IN emp_srv INT,
    IN sta INT
)
BEGIN
	UPDATE `cita` SET `cita_id`= changeId, `cita_date`= `date`, `user_id`= usr,`emp_srv_id`=emp_srv,`sta_id`= sta WHERE `cita_id` = id;
END
$$

DELIMITER $$
CREATE PROCEDURE v_cita ()
BEGIN
	SELECT * FROM cita;
END
$$

DELIMITER $$
CREATE PROCEDURE v_cita_IN_id (
	IN id INT
)
BEGIN
	SELECT * FROM cita WHERE `cita_id` = id;
END
$$

DELIMITER $$
CREATE PROCEDURE v_citaA ()
BEGIN
	SELECT * FROM cita WHERE `sta_id` = 1;
END
$$

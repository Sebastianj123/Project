CREATE or replace DATABASE cabellobellojj;
use cabellobellojj;

CREATE Table tyTrun (
    tyTurn_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tyTurn_nm VARCHAR(40) NOT NULL,
    tyTurn_dsc TEXT NOT NULL
);
CREATE Table sta (
    sta_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sta_nm VARCHAR(40) NOT NULL,
    sta_dsc TEXT NOT NULL
);
CREATE TABLE tyDoc (
    tyDoc_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tyDoc_nm VARCHAR(40) NOT NULL,
    tyDoc_dsc TEXT NOT NULL
);
CREATE TABLE sex (
    sex_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sex_nm VARCHAR(40) NOT NULL,
    sex_dsc TEXT NOT NULL
);
CREATE TABLE rol (
    rol_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rol_nm VARCHAR(40) NOT NULL,
    rol_dsc TEXT NOT NULL
);
CREATE Table `per` (
    per_id int PRIMARY KEY auto_increment not null,
    per_nm varchar(80) not null,
    per_ltnm varchar(80) NOT NULL,
    per_bithdt DATE,
    sex_id INT NOT NULL,
    tyDoc_id INT NOT NULL,
    per_doc DOUBLE NOT NULL,
    per_addr VARCHAR(90),
    INDEX(tyDoc_id, sex_id),
    UNIQUE(per_doc),
    constraint `sex_idPK_per` Foreign Key (sex_id) REFERENCES sex (sex_id) on delete cascade on update cascade,
    constraint `tyDoc_idPK_per` Foreign Key (tyDoc_id) REFERENCES tyDoc (tyDoc_id) on delete cascade on update cascade
);
CREATE TABLE usr(
    usr_id	int	primary key	auto_increment not null,
    usr_nm	varchar(80)	not null,
    usr_ema	varchar(80) not null,
    usr_tel	DOUBLE not null,
    usr_pass varchar(60) not null,
    rol_id INT NOT NULL,
    per_id int not null,
    sta_id INT NOT NULL,
    INDEX(per_id, rol_id, sta_id),
    UNIQUE(usr_nm, usr_ema, usr_tel, per_id),
    constraint `per_idPK_usr` FOREIGN KEY (per_id) REFERENCES per (per_id) on delete cascade on update CASCADE,
    constraint `rol_idPK_usr` FOREIGN KEY (rol_id) REFERENCES rol (rol_id) on delete cascade on update CASCADE,
    constraint `sta_idPK_usr` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE srv(
    srv_id int PRIMARY KEY auto_increment not null,
    srv_nm VARCHAR(80) not NULL,
    srv_dsc TEXT NOT NULL,
    srv_tm int NOT NULL,
    srv_img TEXT NOT NULL,
    srv_cost DOUBLE NOT NULL,
    sta_id INt NOT NULL,
    index(sta_id),
    CONSTRAINT `sta_idPK_srv_FK` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tyAgn (
    tyAgn_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tyAgn_nm VARCHAR(40) not null,
    tyAgn_dsc TEXT not NULL,
    UNIQUE(tyAgn_nm,tyAgn_dsc)
);
CREATE TABLE agn (
    agn_id INT PRIMARY KEY auto_increment not null,
    agn_dt DATETIME not NULL,
    tyAgn_id INT not null,
    INDEX (tyAgn_id),
    CONSTRAINT `tyAng_idPK_ang` FOREIGN KEY (tyAgn_id) REFERENCES tyAgn (tyAgn_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE emp (
    emp_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    usr_id INT NOT NULL,
    srv_id INT NOT NULL,
    INDEX(usr_id, srv_id),
    constraint `usr_idPK_emp` Foreign Key (usr_id) REFERENCES usr (usr_id) on UPDATE CASCADE on delete cascade,
    constraint `srv_idPK_emp` Foreign Key (srv_id) REFERENCES srv (srv_id) on UPDATE CASCADE on delete cascade
);
CREATE TABLE `turn` (
    `turn_id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `emp_id` int(11) NOT NULL,
    `turn_dt` date NOT NULL,
    `turn_ini` time NOT NULL,
    `turn_end` time NOT NULL,
    `tyTurn_id` int(11) NOT NULL,
    INDEX(emp_id, tyTurn_id),
    CONSTRAINT `emp_idPK_tunr` FOREIGN KEY (`emp_id`) REFERENCES `emp` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `tyTurn_idPK_tunr` FOREIGN KEY (`tyTurn_id`) REFERENCES `tytrun` (`tyTurn_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE cita (
    cita_id INT PRIMARY KEY auto_increment not null,
    agn_id INT,
    emp_id INT,
    usr_id INT,
    INDEX(agn_id, usr_id , emp_id),
    constraint `agn_idPK_cita` Foreign Key (agn_id) REFERENCES agn (agn_id) on UPDATE CASCADE on delete cascade,
    constraint `usr_idPK_cita` Foreign Key (usr_id) REFERENCES usr (usr_id) on UPDATE CASCADE on delete cascade,
    constraint `emp_idPK_cita` Foreign Key (emp_id) REFERENCES emp (emp_id) on UPDATE CASCADE on delete cascade
);

INSERT INTO `tytrun`(`tyTurn_nm`, `tyTurn_dsc`) VALUES 
('Trabaja', 'Esta opción corresponde a un turno de trabajo denotado dentro de un horario establecido o a establecer según el calendario'),
('Descansa','Esta opción corresponde a un "turno" de descanso que tiene el empleado dentro del sistema denotado dentro de un horario establecido o a establecer según el calendario');

INSERT INTO `sex`(`sex_nm`, `sex_dsc`) VALUES 
('Masculino','Se identifica con las características sociales, culturales y psicológicas asociadas a los hombres.'),
('Femenino','Se identifica con las características sociales, culturales y psicológicas asociadas a las mujeres.'),
('No binario','No se identifica con ninguno de los géneros binarios, masculino o femenino.'),
('Intergénero','Se identifica con una combinación de características de ambos géneros binarios, masculino o femenino.'),
('Género fluido','Su identidad de género cambia con el tiempo.'),
('Agénero','No se identifica con ningún género.'),
('Bigénero','Se identifica con dos géneros, masculino y femenino.'),
('Poligénero','Se identifica con tres o más géneros.'),
('Demigénero','Se identifica parcialmente con un género, pero no completamente.'),
('Genderqueer','Se identifica con un género que no se ajusta a las normas sociales tradicionales.'),
('Ninguno de los anteriores','Escribe con que género te identificas que no corresponda a los que están en el formulario');

INSERT INTO `rol`(`rol_nm`, `rol_dsc`) VALUES 
('Administrador','Es la persona que está a cargo de la tienda y se encarga de tomar las decisiones importantes, como el inventario, el marketing y el personal.'),
('Empleado','Es la persona que trabaja en la tienda y se encarga de atender a los clientes, realizar las ventas y mantener la tienda en orden.'),
('Cliente','Es la persona que visita la tienda para comprar productos o servicios.');

INSERT INTO `sta` (`sta_nm`, `sta_dsc`) VALUES
('Activo', 'Este estado respecta a un usuario o servicio activo en la plataforma'),
('Inactivo', 'Este estado respecta a un usuario o servicio inactivo en la plataforma'),
('Por confirmar', 'Este estado respecta a un usuario o servicio en proceso de ser activado en la plataforma ya que requiere de un proceso para este mismo'),
('inhabilitado', 'El usuario borro la cuenta');

INSERT INTO `srv` (`srv_id`, `srv_nm`, `srv_dsc`, `srv_tm`, `srv_img`, `srv_cost`, `sta_id`) VALUES
(1, 'Manicure y pedicure', 'Este servicio consiste en un tratamiento para las uñas (de las manos y pies). Ofrecemos el arte y la moda para las uñas, por ejemplo, pintándolas en diferentes estilos, también se aplica, repara y quita uñas postizas o extensiones.', 30, 'https://bonitta.com.mx/wp-content/uploads/2021/03/bonitta_Tipos-de-manicura-profesional.jpg.webp', 40000, 1),
(2, 'Masajes', 'Es un tipo de medicina integral en la que un masajista frota y presiona firmemente la piel, los músculos, los tendones y los ligamentos. En la masoterapia, un especialista frota y presiona los tejidos blandos del cuerpo. Los tejidos blandos incluyen músculo, tejido conectivo, tendones, ligamentos y piel.', 40, 'https://velkaspa.com/wp-content/uploads/2022/09/blog_3.jpg', 100000, 1),
(3, 'Maquillaje', 'Aplicar cosméticos a alguien o a una parte de su cuerpo, especialmente su rostro, para embellecerlo o modificar su aspecto.', 30, 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/04/04/16490814041338.jpg', 35990, 1),
(4, 'Depilación', 'La depilación es una práctica muy común entre las mujeres, que se realiza comúnmente en las cejas, el rostro, las axilas, las piernas y la Zona V. Existen diferentes tipos de depilación íntima, como la cera, cremas, cuchillas y el láser, siendo esta última realizada por un experto.', 35, 'https://www.diariamenteali.com/medias/depilacion-con.cera-crema-o-laser-1900Wx500H?context=bWFzdGVyfGltYWdlc3w5NDcwOXxpbWFnZS9qcGVnfGhhOS9oNzkvOTA3NDM5ODU2MDI4Ni9kZXBpbGFjaW9uLWNvbi5jZXJhLWNyZW1hLW8tbGFzZXIgXzE5MDBXeDUwMEh8ZTJkNTJkYjc0NjZhZWVlZGNkMjU4OTM4OGI4ZTRlZTE5MmMxMDBlZDQzNjhkMmRmMGU2ZDJkMTk3Y2ZhOTc2Ng', 20000, 1),
(5, 'Tratamientos faciales', 'Este tratamiento basado en ultrasonidos sirve para mejorar las arrugas y líneas del escote, elevan la piel del cuello, cejar y bajo del mentón. Consiste en estimular con ultrasonidos la producción de nuevo colágeno y elastina en las capas profundas de la piel.', 25, 'https://blog.farmaelglobo.com/wp-content/uploads/2021/06/positive-dark-skinned-woman-with-afro-combed-hair-wears-headband-cares-about-facial-skin-wipes-cheek-with-cosmetic-sponge-keeps-eyes-shut-with-pleasure.jpg', 18000, 1),
(6, 'Cortes De Cabello', 'Corte de pelo desfilado, la primera idea que te surge. Es el más común y el primero que te van a ofrecer los peluqueros, porque sigue funcionando como el primer día.', 15, '30', 23000, 1),
(7, 'Tratamiento Capilar', 'El tratamiento capilar son cuidados que se aplican al cabello y cuya finalidad es mantener la salud y buena apariencia del mismo. Actualmente existen múltiples tratamientos capilares para cada problema, como por ejemplo para tratar la caída del cabello, el pelo graso, hidratar o dar volumen.', 30, 'https://www.todoimplantecapilar.com/wp-content/uploads/2019/09/Tratamientos-para-la-alopecia-7-alternativas-para-tener-en-cuenta.jpg', 80000, 1);

INSERT INTO `tydoc`(`tyDoc_nm`, `tyDoc_dsc`) VALUES 
('Registro civil de nacimiento','Es un documento público que acredita la filiación de una persona. Es expedido por la Registraduría Nacional del Estado Civil, y contiene la información personal de la persona, como su nombre completo, fecha y lugar de nacimiento, sexo, filiación y nacionalidad.'),
('Tarjeta de identidad','Es un documento público que identifica a las personas menores de edad de 7 a 17 años. Es expedido por la Registraduría Nacional del Estado Civil, y contiene la información personal de la persona, como su nombre completo, fecha y lugar de nacimiento, sexo, filiación, huella dactilar y grupo sanguíneo.'),
('Cédula de ciudadanía','Es un documento público que identifica a las personas mayores de edad. Es expedido por la Registraduría Nacional del Estado Civil, y contiene la información personal de la persona, como su nombre completo, fecha y lugar de nacimiento, sexo, filiación, huella dactilar, grupo sanguíneo y número de identificación personal (NIP).'),
('Tarjeta de extranjería','Es un documento público que identifica a los extranjeros residentes en Colombia. Es expedido por la Unidad Administrativa Especial Migración Colombia, y contiene la información personal del extranjero, como su nombre completo, fecha y lugar de nacimiento, nacionalidad, documento de identidad extranjero y número de identificación de extranjería (NIE).'),
('Pasaporte','Es un documento público que permite a los ciudadanos colombianos viajar al exterior. Es expedido por la Unidad Administrativa Especial Migración Colombia, y contiene la información personal del titular, como su nombre completo, fecha y lugar de nacimiento, nacionalidad, foto, firma y número de pasaporte.');

DELIMITER $$
CREATE PROCEDURE `i_client` (IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `date` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(60), IN `addr` VARCHAR(80))   BEGIN
        DECLARE idPer INT;

        INSERT INTO `per`(`per_nm`, `per_ltnm`, `per_bithDt`, `sex_id`, `tyDoc_id`, `per_doc`, `per_addr`) VALUES
        (`name`, lastName, `date`, sex, tyDoc, doc, addr);
        SET idPer = LAST_INSERT_ID();
        
        INSERT INTO `usr` 
        (`usr_nm`, `usr_ema`, `usr_tel`, `usr_pass`, `rol_id`, `per_id`, `sta_id`)  
        VALUES (usrName, ema, tel, `pass`, 3, idPer, 3);
    END$$

CREATE PROCEDURE `i_emp` (IN `name` VARCHAR(80), IN `lastName` VARCHAR(80), IN `date` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(80), IN `addr` VARCHAR(80), IN `srvID` INT)   BEGIN
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

CREATE PROCEDURE `i_rol` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO `rol`(`rol_nm`, `rol_dsc`) VALUES (name,dsc);
END$$

CREATE PROCEDURE `i_sex` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO `sex`(`sex_nm`, `sex_dsc`) VALUES (`name`,dsc);
END$$

CREATE PROCEDURE `i_srv` (IN `name` VARCHAR(80), IN `dsc` TEXT, IN `tm` INT, IN `img` TEXT, IN `prc` DOUBLE)   BEGIN
	INSERT INTO `srv`(`srv_nm`, `srv_dsc`, `srv_tm`, `srv_img`, `srv_cost`, `sta_id`) VALUES (name,dsc,tm,img,prc,3);
END$$

CREATE PROCEDURE `i_sta` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO sta VALUES (NULL,`name`,dsc);
END$$

CREATE PROCEDURE `i_tyDoc` (IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	INSERT INTO `tydoc`(`tyDoc_nm`, `tyDoc_dsc`) VALUES (`name`,dsc);
END$$

CREATE PROCEDURE i_agn (IN dt DATETIME) BEGIN 
    INSERT INTO `agn` (agn_dt) VALUES (dt);
END$$
CREATE PROCEDURE `u_rol` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	UPDATE rol SET rol_id = changeId WHERE rol_id = id;
    UPDATE rol SET `rol_nm` = name, `rol_dsc` = dsc WHERE rol_id = changeId;
END$$
CREATE PROCEDURE `u_sex` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	UPDATE `sex` SET `sex_id` = changeId WHERE `sex_id` = `id`;
    UPDATE `sex` SET `sex_nm` = `name`, `sex_dsc` = dsc WHERE `sex_id` = changeId;
END$$

CREATE PROCEDURE `u_srv` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(80), IN `dsc` TEXT, IN ti INT, IN `img` TEXT, IN `prc` DOUBLE, IN `sta` INT)   BEGIN
	UPDATE srv SET srv_id = changeId WHERE srv_id = id;
    UPDATE srv SET srv_name = name, srv_dsc = dsc, srv_tm = ti ,srv_img = img, srv_cost = prc, sta_id = sta WHERE srv_id = changeId;
END$$

CREATE PROCEDURE `u_sta` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN

	UPDATE `sta` SET `sta_id` = changeId WHERE `sta_id` = `id`;
	UPDATE `sta` SET `sta_nm` = `name`, `sta_dsc` = dsc WHERE `sta_id` = changeId;
    
END$$

CREATE PROCEDURE `u_tyDoc` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(40), IN `dsc` TEXT)   BEGIN
	UPDATE `tydoc` SET `tyDoc_id` = changeId WHERE `tyDoc_id` = `id`; 
	UPDATE `tydoc` SET `tyDoc_nm`= `name`,`tyDoc_dsc`=dsc WHERE `tyDoc_id` = changeId;
END$$

CREATE PROCEDURE `u_usr` (IN `id` INT, IN `changeId` INT, IN `name` VARCHAR(80), IN `lastName` VARCHAR(80),IN `date` DATE, IN `sex` INT, IN `tyDoc` INT, IN `doc` DOUBLE, IN `addr` VARCHAR(80), IN `usrName` VARCHAR(80), IN `ema` VARCHAR(80), IN `tel` DOUBLE, IN `pass` VARCHAR(60), IN `rol` INT, IN `sta` INT)   BEGIN

	UPDATE `per` SET `per_id` = changeId WHERE per_id = id;
    
	UPDATE `per` SET `per_nm`= name ,`per_ltnm`= lastName ,`sex_id`= sex ,`tyDoc_id`= tyDoc ,`per_doc`= doc ,`per_bithDt`= `date` ,`per_addr`= addr  WHERE per_id = changeId;
    
    UPDATE `usr` SET usr_nm = usrName, usr_ema = ema, usr_tel = tel, usr_pass = pass, rol_id = rol , sta_id = sta WHERE usr.per_id = changeId;
    
    END$$

CREATE PROCEDURE `u_usr_sta` (IN `id` INT, IN `sta` INT)   BEGIN
	UPDATE `usr` SET `sta_id`= sta WHERE usr_id = id;
END$$

CREATE PROCEDURE u_agn (IN id INT, IN changeId INT, IN dt DATETIME) BEGIN
	UPDATE agn SET agn_id = changeId WHERE agn_id = id;
    UPDATE agn SET agn_dt = dt WHERE agn_id = changeId;
END$$

DELIMITER $$
CREATE PROCEDURE `v_active_user` (in id INT)   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.usr_id = id AND U.sta_id = 1;
END$$

CREATE PROCEDURE `v_reg` (IN id INT) BEGIN
	SELECT * FROM usr U WHERE U.usr_id = id;
END$$

CREATE PROCEDURE `v_regs` () BEGIN
	SELECT * FROM usr;
END$$

CREATE PROCEDURE `v_active_reg` (IN id INT) BEGIN
	SELECT * FROM usr U WHERE U.usr_id = id AND U.sta_id = 1;
END$$

CREATE PROCEDURE `v_active_regs` () BEGIN
	SELECT * FROM usr u WHERE u.sta_id =1 ;
END$$

CREATE PROCEDURE `v_users` () BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id;
END$$

CREATE PROCEDURE `v_per` (IN id INT) BEGIN
	SELECT U.usr_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr FROM usr U 
    INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.usr_id = id;
END$$

CREATE PROCEDURE `v_emp` (IN id INT)   BEGIN
	SELECT U.usr_id, U.usr_nm, U.usr_ema, U.usr_tel, U.usr_pass, U.rol_id, R.rol_nm, R.rol_dsc, U.per_id, P.per_nm, P.per_ltnm, P.per_bithdt, P.sex_id, E.sex_nm, E.sex_dsc, P.tyDoc_id, T.tyDoc_nm, T.tyDoc_dsc, P.per_doc, P.per_addr, U.sta_id, S.sta_nm, S.sta_dsc 
    FROM usr U INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex E ON P.sex_id = E.sex_id
    INNER JOIN tyDoc T ON P.tyDoc_id = T.tyDoc_id
    WHERE U.usr_id = id AND U.rol_id = 2;
END$$

CREATE PROCEDURE `v_rol` ()   BEGIN
	SELECT * FROM rol;
END$$

CREATE PROCEDURE `v_sex` ()   BEGIN
	SELECT * FROM sex;
END$$

CREATE PROCEDURE `v_srv` ()   BEGIN
	SELECT * FROM srv;
END$$

CREATE PROCEDURE `v_sta` ()   BEGIN
	SELECT * FROM sta;
END$$

CREATE PROCEDURE `v_tyDoc` ()   BEGIN
	SELECT * FROM tyDoc;
END$$

CREATE PROCEDURE v_agn () BEGIN
	SELECT * FROM agn;
END$$

DELIMITER ;



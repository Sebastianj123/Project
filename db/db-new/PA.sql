-- Sta --------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE i_sta (
	IN `name` VARCHAR(20),
    IN dsc TEXT
)
BEGIN
	INSERT INTO sta VALUES (NULL,`name`,dsc);
END
$$


DELIMITER $$
CREATE PROCEDURE u_sta (
    IN `id` INT,
    IN changeId INT,
	IN `name` VARCHAR(20),
    IN dsc TEXT
)
BEGIN

	UPDATE `sta` SET `sta_id` = changeId WHERE `sta_id` = `id`;
	UPDATE `sta` SET `sta_name` = `name`, `sta_dsc` = dsc WHERE `sta_id` = changeId;
    
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
	IN `name` VARCHAR(30),
    IN dsc TEXT
)
BEGIN
	INSERT INTO `tydoc`(`tyDoc_name`, `tyDoc_dsc`) VALUES (`name`,dsc);
END
$$

DELIMITER $$
CREATE PROCEDURE u_tyDoc (
	IN `id` INT,
    IN changeId INT,
	IN `name` VARCHAR(30),
    IN dsc TEXT
)
BEGIN
	UPDATE `tydoc` SET `tyDoc_id` = changeId WHERE `tyDoc_id` = `id`; 
	UPDATE `tydoc` SET `tyDoc_name`= `name`,`tyDoc_dsc`=dsc WHERE `tyDoc_id` = changeId;
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
	IN `name` VARCHAR(20),
    IN dsc TEXT
)
BEGIN
	INSERT INTO `sex`(`sex_name`, `sex_dsc`) VALUES (`name`,dsc);
END
$$

DELIMITER $$
CREATE PROCEDURE u_sex (
    IN `id` INT,
    IN changeId INT,
	IN `name` VARCHAR(20),
    IN dsc TEXT
)
BEGIN
	UPDATE `sex` SET `sex_id` = changeId WHERE `sex_id` = `id`;
    UPDATE `sex` SET `sex_name` = `name`, `sex_dsc` = dsc WHERE `sex_id` = changeId;
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
        IN `name` VARCHAR(120),
        IN sex INT,
        IN `date` DATE,
        IN tyDoc INT,
        IN doc DOUBLE,
        IN tel DOUBLE,
        IN ema VARCHAR(80),
        IN usrName VARCHAR(80),
        IN `pass` VARCHAR(80)
    )
    BEGIN

        DECLARE idPer INT;
        INSERT INTO `per`(`per_name`, `sex_id`, `per_brithDate`, `tyDoc_id`, `per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`) 
        VALUES 
        (`name`, sex, `date`, tyDoc, doc, tel, ema, usrName, `pass`);
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

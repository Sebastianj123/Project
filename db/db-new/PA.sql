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
CREATE PROCEDURE v_sta ()
BEGIN
	SELECT * FROM sta;
END
$$

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
CREATE PROCEDURE v_tyDoc ()
BEGIN
	SELECT * FROM `tydoc`;	
END
$$

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
CREATE PROCEDURE v_sex ()
BEGIN
	SELECT * FROM `sex`;	
END
$$

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
	INSERT INTO `per`(`per_name`, `sex_id`, `brithDate`, `tyDoc_id`, `per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`) 
    VALUES 
    (name, sex, `date`, tyDoc, doc, tel, ema, usrName, pass);
    SET idPer = LAST_INSERT_ID();
    
    INSERT INTO `user`(`per_id`, `rol_id`, `sta_id`) 
    VALUES (idPer, 3, 3);
END
$$

DELIMITER $$
CREATE PROCEDURE v_users ()
BEGIN
	SELECT U.`user_id`, P.`per_id`, `per_name`, Se.`sex_id`, Se.sex_name, `brithDate`, D.`tyDoc_id`, D.tyDoc_name, D.tyDoc_dsc ,`per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, R.`rol_id`, R.rol_name, R.rol_dsc, S.`sta_id`, S.sta_name, S.sta_dsc FROM `user` U  
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
	SELECT U.`user_id`, P.`per_id`, `per_name`, Se.`sex_id`, Se.sex_name, `brithDate`, D.`tyDoc_id`, D.tyDoc_name, D.tyDoc_dsc ,`per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, R.`rol_id`, R.rol_name, R.rol_dsc, S.`sta_id`, S.sta_name, S.sta_dsc FROM `user` U  
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
	SELECT U.`user_id`, P.`per_id`, `per_name`, Se.`sex_id`, Se.sex_name, `brithDate`, D.`tyDoc_id`, D.tyDoc_name, D.tyDoc_dsc ,`per_doc`, `per_tel`, `per_ema`, `per_usrName`, `per_pass`, R.`rol_id`, R.rol_name, R.rol_dsc, S.`sta_id`, S.sta_name, S.sta_dsc FROM `user` U  
    INNER JOIN per P ON U.per_id = P.per_id
    INNER JOIN tyDoc D ON P.tyDoc_id = D.tyDoc_id
	INNER JOIN rol R ON U.rol_id = R.rol_id
    INNER JOIN sta S ON U.sta_id = S.sta_id
    INNER JOIN sex Se ON P.sex_id = Se.sex_id
    WHERE U.user_id = id;
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
,`brithDate`= `date`
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
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
    brithDate DATE,
    tyDoc_id INT,
    per_doc DOUBLE,
    per_tel DOUBLE,
    per_ema VARCHAR(80),
    per_usrName VARCHAR(80),
    per_pass VARCHAR(80),
    UNIQUE(per_usrName,per_pass),
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

-- CITA
CREATE TABLE cita (
	cita_id INT PRIMARY KEY AUTO_INCREMENT,
    cita_date DATE,
    srv_id INT,
    sta_id INT,
    INDEX(srv_id,sta_id),
    CONSTRAINT `cita_srv_idFK_srv_srv_idPK` FOREIGN KEY (srv_id) REFERENCES srv (srv_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `cita_sta_idFK_sta_sta_idPK` FOREIGN KEY (sta_id) REFERENCES sta (sta_id) ON DELETE CASCADE ON UPDATE CASCADE
);
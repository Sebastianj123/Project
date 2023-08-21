CREATE or REPLACE DATABASE cabellobellojj;
use cabellobellojj;

CREATE TABLE `caja` (
  `caja_id` int(11) NOT NULL,
  `caja_numModulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `caja` (`caja_id`, `caja_numModulo`) VALUES
(1, 1),
(2, 2);
CREATE TABLE IF NOT EXISTS `his_fin` (
  `his_fin_id` int(11) NOT NULL,
  `his_type_id` int(11) DEFAULT NULL,
  `fin_id` int(11) DEFAULT NULL,
  `his_fin_monto` double DEFAULT NULL,
  `recivo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `caja_user` (
  `caja_user_id` int(11) NOT NULL,
  `caja_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cita` (
  `cita_id` int(11) NOT NULL,
  `cita_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `emp_srv_id` int(11) DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `recibo` (
  `recivo_id` int(11) NOT NULL,
  `cita_id` int(11) DEFAULT NULL,
  `recivo_time` datetime DEFAULT NULL,
  `caja_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`);

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
  ADD KEY `cita_sta_idFK_sta_sta_idPK` (`sta_id`);

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
  MODIFY `cita_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `emp_srv`
  MODIFY `emp_srv_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tydoc`
--
ALTER TABLE `tydoc`
  MODIFY `tyDoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `caja_user`
  ADD CONSTRAINT `caja_caja_idPK-caja_user_caja_idFK` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_user_idPK-caja_user_user_idFK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_emp_srv_idFK_emp_srv_emp_srv_idPK` FOREIGN KEY (`emp_srv_id`) REFERENCES `emp_srv` (`emp_srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_sta_idFK_sta_sta_idPK` FOREIGN KEY (`sta_id`) REFERENCES `sta` (`sta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_user_idFK_user_user_idPK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Filtros para la tabla `emp_srv`
--
ALTER TABLE `emp_srv`
  ADD CONSTRAINT `emp_srv_SRV_idFK_srv_srv_idPK` FOREIGN KEY (`srv_id`) REFERENCES `srv` (`srv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_srv_user_idFK_user_user_idPK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `his_fin`
--
ALTER TABLE `his_fin`
  ADD CONSTRAINT `fin_fin_idPK-his_fin_fin_idFK` FOREIGN KEY (`fin_id`) REFERENCES `fin` (`fin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `his_fin_ibfk_1` FOREIGN KEY (`recivo_id`) REFERENCES `recibo` (`recivo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `his_type_his_type_idPK-his_fin_his_type_idFK` FOREIGN KEY (`his_type_id`) REFERENCES `his_type` (`his_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  
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
call i_client ('Juali','ape',1,3,123123123,'1200-12-12','ruben:d','s@a.a',1231231212,'pas','kr');
call i_client (
		'juli1',
        'Poster',
        1,
        3,
        1232121211,
        '0012-12-03',
        'juli1231',
        'juli1233211@gmail.com',
        12312312123,
        1233213,
        'kr1a'
    );
    
call i_emp (
		'juli',
        'Pastrana',
        1,
        3,
        123212121,
        '0012-12-10',
        'juli123',
        'juli123321@gmail.com',
        1231231212,
        123321,
        'kr'
    );

    CALL u_sta (1,8,'Activo','');
call i_rol ('as','asdfasdfasdf');
call u_rol (1,100,'asdfasdf','asdfdsfasdf');
call v_rol ();
call v_rol_IN_id (4);


-- Servicios
call i_srv ('assddf', '00110-a', 'dasjfhlasdfasldkjf','https', 12000);
call u_srv (1,100,'asd124141343f', '0010-a', 'dasjfhlasdfasldkjf','https', 12000,1);
call v_srv ();
call v_srv_IN_id(100);


-- Cita
call i_cita ('0021-12-12',null,null);
call u_cita (1,1,'0021-12-12',null,null,1);
call v_cita ();
call v_citaA ();
call v_cita_IN_id(1);
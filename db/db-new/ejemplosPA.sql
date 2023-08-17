-- Usuarios

CALL i_client (
	'Juana Pastrona',
    2,
    '0011-01-21',
    1,
    12312111,
    1231231212,
    'Juana@gmail.com',
    'Juana123A',
    'juana123'
);

CALL i_client (
	'Juan Pastrona',
    1,
    '0011-01-21',
    2,
    123121111,
    1231231232,
    'Juan@gmail.com',
    'Juan123A',
    'juan123'
);

CALL i_client (
	'Julian Pastrona',
    1,
    '0011-01-21',
    1,
    123121611,
    1231232232,
    'JulianPastrona@gmail.com',
    'JulianPastrona123A',
    'JulianPastrona123'
);
CALL v_users();

CALL u_users (
    1,
    3,
    'Julian',
    1,
    Null,
    2,
    1245789898,
    12325465,
    'Julian123@gmail.com',
    'Julian123',
    'Julian123',
    3, 
    2);


-- Stado y rol
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
CALL i_user (
	'Louis', 
    'Fernando', 
    '1997-12-12', 
    1,
    3,
    8909785,
    'car 12 #43 b',
	null,
    9087865645,
    'LouiS@gmail.co', 
    'LouisSFerR', 
    'LouiS123321', 
    'on'
);
CALL v_usrId (1);
CALL v_usrRegId (1);
CALL v_usrStaId (1);
CALL u_usrStaId (1,1);
CALL v_usrStaId (1);

CALL i_user (
	'luna', 
    'gar', 
    '2000-01-12', 
    2,
    3,
    1232124334,
    'car 23 a',
	null,
    1233211212,
    'lunMa@gmail.com', 
    'luGar123', 
    123321, 
    'on'
);
CALL v_usrId (2);
CALL v_usrRegId (2);
CALL v_usrStaId (2);
CALL u_usrStaId (2,2);
CALL v_usrStaId (2);

SELECT * FROM v_tUsr;
USE mysql;

-- Creacion del usuario que tendra mayores permisos
CREATE USER 'mariano'@'localhost' IDENTIFIED BY 'mariano123';

-- Otorgamiento de permisos de select, insert y update sobre todas las tablas
GRANT SELECT, INSERT, UPDATE ON concesionaria_vf_marianopavone.* TO 'mariano'@'localhost';

-- Creacion del segundo usuario.
CREATE USER 'agustin'@'localhost' IDENTIFIED BY 'agustin123';

-- Concesion de permiso de lectura sobre todas las tablas
GRANT SELECT ON concesionaria_vf_marianopavone.* TO 'agustin'@'localhost';

select * from user;

SHOW GRANTS FOR 'mariano'@'localhost';
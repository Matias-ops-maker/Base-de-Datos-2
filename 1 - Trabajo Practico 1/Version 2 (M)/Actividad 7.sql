-- Crear un usuario llamado 'analista'
CREATE USER 'analista'@'localhost' IDENTIFIED BY 'password123';

-- Otorgar permisos de solo lectura en todas las tablas de la base de datos EjerciciosDB
GRANT SELECT ON EjerciciosDB.* TO 'analista'@'localhost';

-- Verificar los permisos otorgados
SHOW GRANTS FOR 'analista'@'localhost';

#REVISAR/confirmar
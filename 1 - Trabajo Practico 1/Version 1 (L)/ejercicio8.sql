CREATE DATABASE negocio2;

USE negocio2;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    fecha_registro DATE
);

CREATE TABLE auditoria_clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    operacion VARCHAR(10),         -- 'INSERT', 'UPDATE', 'DELETE'
    cliente_id INT,
    nombre_anterior VARCHAR(100),
    email_anterior VARCHAR(100),
    fecha_registro_anterior DATE,
    fecha_operacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER auditoria_insert
AFTER INSERT ON clientes
FOR EACH ROW
INSERT INTO auditoria_clientes (operacion, cliente_id)
VALUES ('INSERT', NEW.id);

CREATE TRIGGER auditoria_update
BEFORE UPDATE ON clientes
FOR EACH ROW
INSERT INTO auditoria_clientes (
    operacion, cliente_id, nombre_anterior, email_anterior, fecha_registro_anterior
)
VALUES (
    'UPDATE', OLD.id, OLD.nombre, OLD.email, OLD.fecha_registro
);

CREATE TRIGGER auditoria_delete
BEFORE DELETE ON clientes
FOR EACH ROW
INSERT INTO auditoria_clientes (
    operacion, cliente_id, nombre_anterior, email_anterior, fecha_registro_anterior
)
VALUES (
    'DELETE', OLD.id, OLD.nombre, OLD.email, OLD.fecha_registro
);

INSERT INTO clientes (nombre, email, fecha_registro)
VALUES ('Laura Gomez', 'laura@gmail.com', '2024-04-01');
INSERT INTO clientes (nombre, email, fecha_registro)
VALUES ('Carlos Díaz', 'carlos@gmail.com', '2024-04-10');


UPDATE clientes
SET email = 'laura_gomez@gmail.com'
WHERE id = 1;

DELETE FROM clientes WHERE id = 1;

SELECT * FROM auditoria_clientes;











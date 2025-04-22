-- Crear la base de datos y seleccionarla
CREATE DATABASE EjerciciosDB;
USE EjerciciosDB;

-- Ejercicio 1: Integridad Referencial
CREATE TABLE Estudiantes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Cursos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Inscripciones (
    id INT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Insertar datos
INSERT INTO Estudiantes (id, nombre) VALUES (1, 'Juan'), (2, 'Ana');
INSERT INTO Cursos (id, nombre) VALUES (1, 'Matemáticas'), (2, 'Historia');
INSERT INTO Inscripciones (id, estudiante_id, curso_id) VALUES (1, 1, 1), (2, 1, 2);

-- Prueba: Eliminar un estudiante y ver cascada
DELETE FROM Estudiantes WHERE id = 1;
SELECT * FROM Inscripciones;

-- Ejercicio 2: Restricciones de Integridad
CREATE TABLE Matriculas (
    id INT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Insertar datos válidos
INSERT INTO Matriculas (id, estudiante_id, curso_id) VALUES (1, 2, 1);

-- Ejercicio 3: Concurrencia
CREATE TABLE Cuentas (
    id INT PRIMARY KEY,
    saldo DECIMAL(10,2)
);

INSERT INTO Cuentas (id, saldo) VALUES (1, 1000.00);

-- Simulación de transacciones
START TRANSACTION;
SELECT saldo FROM Cuentas WHERE id = 1 FOR UPDATE;
UPDATE Cuentas SET saldo = saldo - 100 WHERE id = 1;
COMMIT;

-- Ejercicio 4: Plan de Ejecución
CREATE TABLE Ventas (
    id INT PRIMARY KEY,
    producto_id INT,
    cantidad INT
);

INSERT INTO Ventas (id, producto_id, cantidad) VALUES (1, 1, 5), (2, 1, 10), (3, 2, 15), (4, 3, 20);

EXPLAIN SELECT * FROM Ventas WHERE producto_id = 1;
CREATE INDEX idx_producto ON Ventas(producto_id);
EXPLAIN SELECT * FROM Ventas WHERE producto_id = 1;

-- Ejercicio 5: Índices
CREATE INDEX idx_producto_cantidad ON Ventas(producto_id, cantidad);
EXPLAIN SELECT * FROM Ventas WHERE producto_id = 1 AND cantidad > 5;

-- Ejercicio 6: Creación de Vistas
CREATE VIEW VentasMensuales AS
SELECT producto_id, SUM(cantidad) AS total_ventas
FROM Ventas
GROUP BY producto_id;

SELECT * FROM VentasMensuales WHERE total_ventas > 100;

-- Ejercicio 7: Gestión de Permisos
CREATE USER 'analista'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON EjerciciosDB.* TO 'analista'@'localhost';
SHOW GRANTS FOR 'analista'@'localhost';

-- Ejercicio 8: Auditoría de Transacciones
CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    operacion VARCHAR(50),
    tabla_afectada VARCHAR(50),
    fecha_hora DATETIME DEFAULT NOW()
);

INSERT INTO Auditoria (usuario, operacion, tabla_afectada) 
VALUES ('admin', 'INSERT', 'Ventas');

SELECT * FROM Auditoria;

-- Ejercicio 9: Backup y Restore
-- Backup desde la terminal:
-- mysqldump -u root -p EjerciciosDB > backup_ejerciciosdb.sql

-- Restaurar desde la terminal:
-- mysql -u root -p EjerciciosDB < backup_ejerciciosdb.sql
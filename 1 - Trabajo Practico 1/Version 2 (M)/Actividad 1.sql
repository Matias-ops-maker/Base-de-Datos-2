CREATE DATABASE EjerciciosDB;
USE EjerciciosDB;

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

-- Prueba: Elimina un estudiante y verifica la cascada
DELETE FROM Estudiantes WHERE id = 1;
SELECT * FROM Inscripciones;
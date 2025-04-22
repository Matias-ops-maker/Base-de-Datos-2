CREATE DATABASE Universidad;
USE Universidad;

CREATE TABLE Estudiantes (
	id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100)
); 

CREATE TABLE Cursos (
	id_curso INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Inscripciones (
	id_estudiante INT,
    id_curso INT,
    PRIMARY KEY(id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)
    ON DELETE RESTRICT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
    ON DELETE RESTRICT
);

INSERT INTO Estudiantes VALUES (1, "Julian");
INSERT INTO Cursos VALUES (1, "Data");
INSERT INTO inscripciones VALUES (1, 1);

DELETE FROM Estudiantes WHERE id_estudiante = 1;
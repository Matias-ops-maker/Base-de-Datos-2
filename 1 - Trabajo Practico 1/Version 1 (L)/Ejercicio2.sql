USE Universidad;

CREATE TABLE Matriculas (
	id_estudiante INT,
    id_curso INT,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
	FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

INSERT INTO Estudiantes VALUES (2, "Nicolas");
INSERT INTO Cursos VALUES (2, "Programacion");
INSERT INTO Matriculas VALUES (2, 2);
INSERT INTO Matriculas VALUES (2, 22);
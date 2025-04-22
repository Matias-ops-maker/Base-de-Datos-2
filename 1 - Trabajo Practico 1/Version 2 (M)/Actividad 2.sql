CREATE TABLE Matriculas (
    id INT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Probar violación de integridad (esto dará error)
INSERT INTO Matriculas (id, estudiante_id, curso_id) VALUES (1, 999, 1);
-- Crear una tabla para auditar transacciones
CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    operacion VARCHAR(50),
    tabla_afectada VARCHAR(50),
    fecha_hora DATETIME DEFAULT NOW()
);

-- Ejemplo: Registrar manualmente una operación de auditoría
INSERT INTO Auditoria (usuario, operacion, tabla_afectada) 
VALUES ('admin', 'INSERT', 'Ventas');

-- Consultar los registros de auditoría
SELECT * FROM Auditoria;
CREATE TABLE Ventas (
    id INT PRIMARY KEY,
    producto_id INT,
    cantidad INT
);

-- Insertar datos de prueba
INSERT INTO Ventas (id, producto_id, cantidad) VALUES 
(1, 1, 5), (2, 1, 10), (3, 2, 15), (4, 3, 20);

-- Consulta sin índice
EXPLAIN SELECT * FROM Ventas WHERE producto_id = 1;

-- Crear índice
CREATE INDEX idx_producto ON Ventas(producto_id);

-- Consulta con índice
EXPLAIN SELECT * FROM Ventas WHERE producto_id = 1;
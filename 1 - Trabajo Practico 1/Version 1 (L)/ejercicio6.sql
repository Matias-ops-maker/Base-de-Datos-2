CREATE DATABASE negocio;
USE negocio;

CREATE TABLE Productos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Ventas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

INSERT INTO Productos (nombre) VALUES
('Auriculares'),
('Teclado'),
('Mouse'),
('Monitor'),
('Notebook'),
('Parlante'),
('Webcam'),
('Impresora'),
('Silla Gamer'),
('Router');

INSERT INTO Ventas (producto_id, cantidad, fecha) VALUES
(1, 5, '2024-01-15'),
(2, 3, '2024-01-20'),
(1, 4, '2024-02-10'),
(3, 2, '2024-02-11'),
(4, 6, '2024-03-01'),
(5, 10, '2024-03-05'),
(2, 5, '2024-03-07'),
(6, 8, '2024-04-10'),
(7, 4, '2024-04-15'),
(8, 6, '2024-04-20'),
(5, 3, '2024-05-02'),
(1, 7, '2024-05-05'),
(9, 2, '2024-05-10'),
(10, 1, '2024-05-15'),
(5, 4, '2024-05-25'),
(2, 3, '2024-06-01'),
(3, 9, '2024-06-03'),
(4, 5, '2024-06-04'),
(6, 7, '2024-06-10'),
(1, 6, '2024-06-11');

CREATE VIEW resumen_mensual AS
SELECT 
	p.nombre AS producto,
    DATE_FORMAT(v.fecha, '%Y-%m') AS mes,
    SUM(v.cantidad) AS total_vendidos
FROM Ventas v
LEFT JOIN Productos p ON v.producto_id = p.id
GROUP BY p.nombre, mes;

SELECT producto, SUM(total_vendidos) AS total
FROM resumen_mensual
GROUP BY producto
ORDER BY total DESC
LIMIT 5;


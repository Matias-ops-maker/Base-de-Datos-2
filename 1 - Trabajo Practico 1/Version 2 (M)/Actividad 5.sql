SELECT * FROM Ventas WHERE producto_id = 5 AND cantidad > 10;
CREATE INDEX idx_producto_cantidad ON Ventas(producto_id, cantidad);

-- Comparar consultas
EXPLAIN SELECT * FROM Ventas WHERE producto_id = 1 AND cantidad > 5;
-- Crea una vista que resume las ventas mensuales
CREATE VIEW VentasMensuales AS
SELECT 
    producto_id,
    SUM(cantidad) AS total_ventas,
    MONTH(CURDATE()) AS mes_actual
FROM Ventas
GROUP BY producto_id;

-- Usa la vista para consultar productos con más de 100 unidades vendidas este mes
SELECT * FROM VentasMensuales WHERE total_ventas > 100;
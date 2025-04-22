CREATE INDEX idx_categoria ON productos(categoria);
CREATE INDEX idx_precio ON productos(precio);

CREATE INDEX idx_categoria_precio ON productos(categoria, precio);

EXPLAIN SELECT * FROM productos
WHERE categoria = 'Juguetes' AND precio > 500;
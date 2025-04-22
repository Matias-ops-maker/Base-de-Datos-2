EXPLAIN SELECT * FROM productos
WHERE stock = 400;


CREATE INDEX idx_stock ON productos(stock);
EXPLAIN SELECT * FROM productos 
WHERE stock = 400;
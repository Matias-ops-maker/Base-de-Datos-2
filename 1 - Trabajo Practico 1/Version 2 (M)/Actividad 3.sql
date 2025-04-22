CREATE TABLE Cuentas (
    id INT PRIMARY KEY,
    saldo DECIMAL(10,2)
);

-- Insertar cuenta con saldo
INSERT INTO Cuentas (id, saldo) VALUES (1, 1000.00);

-- Simular transacciones (usa conexiones separadas para probar)
-- Usuario 1
START TRANSACTION;
SELECT saldo FROM Cuentas WHERE id = 1 FOR UPDATE;
UPDATE Cuentas SET saldo = saldo - 100 WHERE id = 1;

-- Usuario 2
START TRANSACTION;
SELECT saldo FROM Cuentas WHERE id = 1 FOR UPDATE;
-- Esto esperará hasta que haga COMMIT

-- Usuario 1: Finaliza la transacción
COMMIT;

-- Usuario 2: Finaliza la transacción
UPDATE Cuentas SET saldo = saldo - 50 WHERE id = 1;
COMMIT;
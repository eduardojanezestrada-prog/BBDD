DROP DATABASE IF EXISTS Banco;
CREATE DATABASE Banco;
USE Banco;

CREATE TABLE cuenta (
numCuenta INTEGER PRIMARY KEY,
saldo INTEGER NOT NULL
);

DESCRIBE cuenta;

SET @saldo=0;

#-- Trigger sumar (INSERT)
CREATE TRIGGER sumar
AFTER INSERT ON cuenta
FOR EACH ROW
SET @saldo=@saldo+NEW.saldo;

INSERT INTO cuenta VALUES(101,40),(102,60),(103,50),(104,30),(105,70);
SELECT @saldo;
#-- Trigger cambiar (UPDATE)
CREATE TRIGGER cambiar
BEFORE UPDATE ON cuenta
FOR EACH ROW
SET @saldo=@saldo-OLD.saldo+NEW.saldo;

#-- Reduce 10 euros a las cuentas con saldo superior a 50 euros
UPDATE cuenta
SET saldo=saldo-10
WHERE saldo>50;
SELECT @saldo;

#-- Aumenta 10 euros a las cuentas con saldo de al menos 50 eurps
UPDATE cuenta
SET saldo=saldo+10
WHERE saldo>=50;
SELECT @saldo;

#-- Trigger restar (DELETE)
CREATE TRIGGER restar
BEFORE DELETE ON cuenta
FOR EACH ROW
SET @saldo=@saldo-OLD.saldo;

DELETE FROM cuenta WHERE numCuenta=101;
SELECT @saldo;
DELETE FROM cuenta WHERE numCuenta=102;
SELECT @saldo;
DELETE FROM cuenta WHERE numCuenta=103;
SELECT @saldo;
DELETE FROM cuenta WHERE numCuenta=104;
SELECT @saldo;
DELETE FROM cuenta WHERE numCuenta=105;
SELECT @saldo;

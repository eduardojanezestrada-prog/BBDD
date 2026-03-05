#-- Creamos la base de datos
DROP DATABASE IF EXISTS SPSP;
CREATE DATABASE SPSP;
USE SPSP;

#-- Creamos las tablas
CREATE TABLE S(
sn VARCHAR(4),
snombre VARCHAR(20) NOT NULL,
estado INTEGER,
ciudad VARCHAR(20) NOT NULL,
PRIMARY KEY(sn)
);

CREATE TABLE P(
pn VARCHAR(4),
pnombre VARCHAR(20) NOT NULL,
color VARCHAR(20) NOT NULL,
peso INTEGER NOT NULL,
ciudad VARCHAR(20) NOT NULL,
PRIMARY KEY(pn)
);

CREATE TABLE SP(
sn VARCHAR(4),
pn VARCHAR(4),
cant INTEGER NOT NULL,
PRIMARY KEY(sn,pn),
FOREIGN KEY(sn) REFERENCES S(sn)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(pn) REFERENCES P(pn)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

#-- Mostramos las tablas
SHOW TABLES;

#-- Describimos cada tablas
DESCRIBE S;
DESCRIBE P;
DESCRIBE SP;

#-- Insertamos proveedores
INSERT INTO S VALUES
('S1', 'Salazar', 20, 'Londres'),
('S2', 'Jaimes', 10, 'Paris'),
('S3', 'Bernal', 30, 'Paris'),
('S4', 'Corona', 20, 'Londres'),
('S5', 'Aldana', NULL, 'Atenas');

SELECT * FROM S;

#-- Insertamos piezas
INSERT INTO P VALUES 
('P1', 'tuerca', 'verde', 12, 'Paris'),
('P2', 'perno', 'rojo', 17, 'Londres'),
('P3', 'birlo', 'azul', 17, 'Roma'),
('P4', 'birlo', 'rojo', 14, 'Londres'),
('P5', 'leva', 'azul', 12, 'Paris'),
('P6', 'engrane', 'rojo', 19, 'Paris');

SELECT * FROM P;

#-- Crear una variable global @TOTAL y la inicializamos a 0
SET @TOTAL=0;
SELECT @TOTAL;

#-- Creación de un trigger (o disparador)
#-- Trigger: Objeto que se asocia a una tabla y se activa cuando se produce un evento particular.(Insert, Update o Delete).
#-- Sumar los valores insertados en una de las columnas de la tabla.
#-- En nuestro caso, vamos a llevar la suma de todas las cantidades enviadas de piezas.

CREATE TRIGGER sumar
AFTER INSERT ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL+NEW.cant;

INSERT INTO SP VALUES ('S1','P1', 100);
DROP DATABASE IF EXISTS SP;
CREATE DATABASE SP;
USE SP;

#-- Creamos las tablas
CREATE TABLE S (
sn 			VARCHAR(4), 
snombre 	VARCHAR(20) 		NOT NULL, 
estado 		INTEGER, 
ciudad 		VARCHAR(20) 		NOT NULL,
PRIMARY KEY(sn)
);

CREATE TABLE P (
pn 			VARCHAR(4),
pnombre 	VARCHAR(20) 		NOT NULL,
color 		VARCHAR(20) 		NOT NULL,
peso 		INTEGER 			NOT NULL,
ciudad 		VARCHAR(30) 		NOT NULL,
PRIMARY KEY(pn)
);

CREATE TABLE SP (
sn 			VARCHAR(4),
pn 			VARCHAR(4),
cant 		INTEGER 			NOT NULL,
PRIMARY KEY(sn,pn),
FOREIGN KEY(sn) REFERENCES S(sn)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(pn) REFERENCES P(pn)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

#-- Ejercicio 2
INSERT INTO S VALUES ('S1', 'Salazar', 20, 'Londres');
INSERT INTO S VALUES ('S2', 'Jaimes', 10, 'Paris');
INSERT INTO S VALUES ('S3', 'Bernal', 30, 'Paris');
INSERT INTO S VALUES ('S4', 'Corona', 20, 'Londres');
INSERT INTO S VALUES ('S5', 'Aldana', NULL, 'Atenas');

#-- Ejercicio 3
LOAD DATA INFILE 'C:\\BBDD\\P.txt' INTO TABLE P;

SELECT * FROM P;

#-- Ejercicio 4
LOAD DATA INFILE 'C:\\BBDD\\SP.txt' INTO TABLE SP;

SELECT * FROM SP;

#-- Ejercicio 5
#--Inserta un nuevo proveedor: Marco, con código S6, estado 20 y ciudad Londres.
INSERT INTO S VALUES ('S6', 'Marco', 20, 'Londres');
SELECT * FROM S;

#-- Ejercicio 6
#-- Inserta un nuevo proveedor: Andreu, con código S7, estado 10 y ciudad Atenas.
INSERT INTO S VALUES('S7', 'Andreu', 10, 'Atenas');
SELECT * FROM S;

#-- Ejercicio 7
#-- Inserta nuevos envíos: el proveedor S6 enviará 100 unidades de cada pieza.
INSERT INTO SP 
SELECT 'S6', pn, 100
FROM P;

#-- Ejercicio 8
#-- Inserta nuevos envíos: el proveedor S7 enviará las mismas piezas y en las mismas cantidades que el proveedor S2.
INSERT INTO SP
SELECT 'S7', pn, cant
FROM SP
WHERE sn='S2';
SELECT * FROM SP;

#-- Ejercicio 9
#-- Inserta en la tabla de envíos SP para el proveedor S7 tantas piezas P4 como envía el proveedor S1.
INSERT INTO SP
SELECT 'S7', 'P4', cant
FROM SP
WHERE sn='S1' AND pn='P4';
SELECT * FROM SP;

#-- Ejercicio 10
#-- Disminuye una unidad el peso de las piezas azules.
UPDATE P 
SET peso=peso-1
WHERE color='azul';
SELECT * FROM P;

#-- Ejercicio 11
#-- Sube a 300 los envíos del proveedor S6 de la pieza P3.
UPDATE SP
SET cant=300
WHERE sn='S6' AND pn='P3';
SELECT * FROM SP;

#-- Ejercicio 12
#-- Duplica la cantidad de envíos que hace el proveedor S6 de las piezas P1 y P2.
UPDATE SP
SET cant=cant*2
WHERE sn='S6' AND pn IN ('P1', 'P2');
SELECT * FROM SP;

#-- Ejercicio 13
#-- Aumenta en 100 todos los envíos del proveedor S7.
UPDATE SP
SET cant=cant+100
WHERE sn='S7';
SELECT * FROM SP;

#-- Ejercicio 14
#-- Aumenta en 25 unidades la cantidad de envíos de piezas con el mayor peso.
UPDATE SP
SET cant=cant+25
WHERE pn IN(SELECT pn FROM P WHERE peso>= ALL(SELECT peso FROM P));
SELECT * FROM SP;

#-- Ejercicio 15
#-- Elimina todos los envíos de piezas de menor peso.
DELETE FROM SP
WHERE pn IN (SELECT pn FROM P WHERE peso <= ALL(SELECT peso FROM P));
SELECT * FROM SP;

#-- Ejercicio 16
#-- Elimina todos los envíos del proveedor S7.
DELETE FROM SP
WHERE sn='S7';
SELECT * FROM SP;

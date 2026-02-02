/* Creamos la base de datos */
DROP DATABASE IF EXISTS Envios;
CREATE DATABASE Envios;
USE Envios;

/* Creamos la tabla de los proveedores */
CREATE TABLE S (
sn 			VARCHAR(4),
snombre 	VARCHAR(20) 	NOT NULL,
estado	 	INTEGER 		NOT NULL,
ciudad 		VARCHAR(20) 	NOT NULL,
PRIMARY KEY(sn)
);

/* Comprobamos que se ha creado la tabla S */
SHOW TABLES;
DESCRIBE S;

/* Creamos la tabla de las piezas */
CREATE TABLE P (
pn 			VARCHAR(4),
pnombre 	VARCHAR(20) 	NOT NULL,
color 		VARCHAR(20) 	NOT NULL,
peso 		INTEGER 		NOT NULL,
ciudad 		VARCHAR(20) 	NOT NULL,
PRIMARY KEY(pn)
);

/* Comprobamos que se ha creado la tabla P */
SHOW TABLES;
DESCRIBE P;

/* Creamos la tabla SP */
CREATE TABLE SP (
sn 			VARCHAR(4),
pn 			VARCHAR(4),
cant 		INTEGER 		NOT NULL,
PRIMARY KEY(sn,pn),
FOREIGN KEY(sn) REFERENCES S(sn) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
FOREIGN KEY(pn) REFERENCES P(pn) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

/* Comprobamos que se ha creado la tabla SP */
SHOW TABLES;
DESCRIBE SP;


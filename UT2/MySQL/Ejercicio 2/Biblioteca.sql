/* Creamos la base de datos */
DROP DATABASE IF EXISTS Biblioteca;
CREATE DATABASE Biblioteca;
USE Biblioteca;

/* Creamos la tabla de usuarios */
CREATE TABLE Usuario (
dni 	VARCHAR(10),
edad 	INTEGER 		NOT NULL,
cuota 	INTEGER 		NOT NULL,
PRIMARY KEY(dni)
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE Usuario;

/* Creamos la tabla libro */
CREATE TABLE Libro (
isbn 		VARCHAR(13),
titulo 		VARCHAR(20) 	NOT NULL,
autor 		VARCHAR(20) 	NOT NULL,
editorial 	VARCHAR(20) 	NOT NULL,
PRIMARY KEY(isbn)
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE Libro;

/* Creamos la tabla prestamo */
CREATE TABLE Prestamo (
isbn 			VARCHAR(13),
dni_usuario 	VARCHAR(10) 	NOT NULL,
fecha 			DATE,
periodo 		VARCHAR(20) 	NOT NULL,
PRIMARY KEY(isbn,fecha),
FOREIGN KEY(isbn) REFERENCES Libro(isbn)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(dni_usuario) REFERENCES Usuario(dni)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE Prestamo;
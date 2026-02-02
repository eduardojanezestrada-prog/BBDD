/* Creamos la tabla empresa */
DROP DATABASE IF EXISTS Empresa;
CREATE DATABASE Empresa;
USE Empresa;

/* Creamos la tabla empleado */
CREATE TABLE Empleado (
codigo 		VARCHAR(10),
puesto 		CHAR(30) 	NOT NULL,
salario 	FLOAT 		NOT NULL,
codigo_jefe VARCHAR(10) 	NOT NULL,
PRIMARY KEY(codigo),
FOREIGN KEY(codigo_jefe) REFERENCES Empleado(codigo)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE Empleado;

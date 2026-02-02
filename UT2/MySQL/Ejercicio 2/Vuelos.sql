/* Creamos la base de datos */
DROP DATABASE IF EXISTS Vuelos;
CREATE DATABASE Vuelos;
USE Vuelos;

/* Empezamos creando la tabla de vuelo */
CREATE TABLE Vuelo (
m_avion 		CHAR(20),
n_pasajeros 	INTEGER 	NOT NULL,
fecha_ida 		DATE,
fecha_vuelta 	DATE 		NOT NULL,
PRIMARY KEY(m_avion, fecha_ida)
);

/* Comprobamos que se haya creado la tabla vuelos bien */
SHOW TABLES;
DESCRIBE Vuelo;

/* Creamos la tabla avión */
CREATE TABLE Avion (
matricula 		CHAR(20),
capacidad 		INTEGER 	NOT NULL,
n_alas 			INTEGER 	NOT NULL,
combustible 	FLOAT 		NOT NULL,
PRIMARY KEY (matricula)
);

/* Comprobamos que se haya creado la tabla avión bien */
SHOW TABLES;
DESCRIBE Avion;

/* Editamos la tabla vuelo para añadir una clave ajena */
ALTER TABLE Vuelo 
ADD FOREIGN KEY(m_avion) REFERENCES Avion(matricula)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

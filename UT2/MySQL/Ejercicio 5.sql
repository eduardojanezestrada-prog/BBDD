/* Creamos la base de datos */
DROP DATABASE IF EXISTS Catastro;
CREATE DATABASE Catastro;
USE Catastro;

/* Empezamos creando la tabla de habitantes */
CREATE TABLE habitantes (
nif 		VARCHAR(10),
nombre 		VARCHAR(20) 	NOT NULL,
apellidos 	VARCHAR(30) 	NOT NULL,
direccion 	VARCHAR(50) 	NOT NULL,
municipio 	VARCHAR(20) 	NOT NULL,
cabeza_fam 	VARCHAR(10) 	NOT NULL,
PRIMARY KEY(nif),
FOREIGN KEY(cabeza_fam) REFERENCES habitantes(nif)
		ON UPDATE CASCADE
);
/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE habitantes;

/* Creamos la tabla municipio */
CREATE TABLE municipio (
nombre 		VARCHAR(20),
km2 		INTEGER 		NOT NULL,
nviviendas  INTEGER 		NOT NULL,
PRIMARY KEY(nombre)
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE municipio;

/* Creamos la tabla vivienda */
CREATE TABLE vivienda (
direccion 		VARCHAR(50),
municipio 		VARCHAR(20),
nifprop 		VARCHAR(10) 	NOT NULL,
PRIMARY KEY(direccion, municipio),
FOREIGN KEY(municipio) REFERENCES municipio(nombre)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
FOREIGN KEY(nifprop) REFERENCES habitantes(nif)
		ON UPDATE CASCADE
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE vivienda;

/* Editamos la tabla habitantes para refenciar la tabla vivienda */
ALTER TABLE habitantes
ADD FOREIGN KEY(direccion, municipio) REFERENCES vivienda(direccion, municipio)
		ON UPDATE CASCADE;

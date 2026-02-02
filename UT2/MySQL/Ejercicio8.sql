/* Creamos la base de datos */
DROP DATABASE IF EXISTS Ciclistas;
CREATE DATABASE Ciclistas;
USE Ciclistas;

/* Creamos la tabla ciclista */
CREATE TABLE ciclista (
dni 			VARCHAR(10),
alias 			VARCHAR(20) 		NOT NULL,
direccion 		VARCHAR(50) 		NOT NULL,
tlf 			VARCHAR(15)			NOT NULL,
PRIMARY KEY(dni),
UNIQUE(alias)
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE ciclista;

/* Creamos la tabla carrera */
CREATE TABLE carrera (
id_carrera 		VARCHAR(10),
nombre 			VARCHAR(40) 		NOT NULL,
fech_crea 		DATE 				NOT NULL,
pais 			VARCHAR(20) 		NOT NULL,
num_edi 		FLOAT 				NOT NULL,
maxi_gan 		VARCHAR(10),
amateur 		BOOLEAN 			NOT NULL,
PRIMARY KEY(id_carrera),
FOREIGN KEY(maxi_gan) REFERENCES ciclista(dni)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE carrera;

/* Creamos la tabla edicion */
CREATE TABLE edicion (
id_carrera 		VARCHAR(10),
fech_edi 		DATE 				NOT NULL,
nombre 			VARCHAR(20) 		NOT NULL,
ganador 		VARCHAR(10),
prim_equip 		VARCHAR(10),
pos_pri_equi 	INTEGER 			NOT NULL,
PRIMARY KEY(id_carrera, fech_edi),
FOREIGN KEY(id_carrera) REFERENCES carrera(id_carrera)
		ON UPDATE CASCADE,
FOREIGN KEY(ganador) REFERENCES ciclista(dni)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
FOREIGN KEY(prim_equip) REFERENCES ciclista(dni)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE edicion;

/* Creamos la tabla ciclista_edicion */
CREATE TABLE ciclista_edicion (
dni 			VARCHAR(10),
id_carrera 		VARCHAR(10),
fecha_edi 		DATE,
cuota 			FLOAT,
dorsal 			INTEGER 		NOT NULL,
PRIMARY KEY(dni, id_carrera, fecha_edi),
FOREIGN KEY(dni) REFERENCES ciclista(dni)
		ON UPDATE CASCADE,
FOREIGN KEY(id_carrera, fecha_edi) REFERENCES edicion(id_carrera, fech_edi)
		ON UPDATE CASCADE
);

/* Creamos la tabla ciclista_edicion */
CREATE TABLE ciclista_edicion (
dni 			VARCHAR(10),
id_carrera 		VARCHAR(10),
fecha_edi 		DATE,
cuota 			FLOAT,
dorsal 			INTEGER 		NOT NULL,
PRIMARY KEY(dni, id_carrera, fecha_edi),
FOREIGN KEY(dni) REFERENCES ciclista(dni)
		ON UPDATE CASCADE,
FOREIGN KEY(id_carrera, fecha_edi) REFERENCES edicion(id_carrera, fech_edi)
		ON UPDATE CASCADE
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE ciclista_edicion;


/* Creamos la tabla etapa */
CREATE TABLE etapa (
id_etapa 		VARCHAR(10),
id_carrera 		VARCHAR(10),
fecha_edic 		DATE,
origen 			VARCHAR(30) 		NOT NULL,
destino 		VARCHAR(30) 		NOT NULL,
fecha 			DATE 				NOT NULL,
ganador 		VARCHAR(10),
detall 			VARCHAR(50) 		NOT NULL,
PRIMARY KEY(id_etapa, id_carrera, fecha_edic),
FOREIGN KEY(id_carrera, fecha_edic) REFERENCES edicion(id_carrera, fech_edi)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
FOREIGN KEY(ganador) REFERENCES ciclista(dni)
		ON UPDATE CASCADE
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE etapa;

/* Creamos la tabla metavolante */
CREATE TABLE metavolante (
codmeta 		VARCHAR(10),
idetapa 		VARCHAR(10) 		NOT NULL,
idcarrera 		VARCHAR(10) 		NOT NULL,
fechedic 		DATE 				NOT NULL,
ganador 		VARCHAR(10),
PRIMARY KEY(codmeta),
FOREIGN KEY(idetapa, idcarrera, fechedic) REFERENCES etapa(id_etapa, id_carrera, fecha_edic)
		ON UPDATE CASCADE,
FOREIGN KEY(ganador) REFERENCES ciclista(dni)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

/* Comprobamos que se haya creado la tabla */
SHOW TABLES;
DESCRIBE metavolante;

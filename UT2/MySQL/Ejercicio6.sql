/* Creamos la base de datos */
DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;
USE blog;

/* Creamos la tabla de usuario */
CREATE TABLE usuario(
nick 			VARCHAR(20),
correo 			VARCHAR(20),
rol 			VARCHAR(10),
fechaalta 		DATE		 		NOT NULL,
PRIMARY KEY(nick),
UNIQUE(correo)
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE usuario;

/* Creamos la tabla noticia */
CREATE TABLE noticia(
idNoticia 		INTEGER,
titulo 			VARCHAR(20) 		NOT NULL,
autor 			VARCHAR(20) 		NOT NULL,
contenido 		VARCHAR(10) 		NOT NULL,
fechapubli 		DATE 				NOT NULL,
PRIMARY KEY(idNoticia),
FOREIGN KEY(autor) REFERENCES usuario(nick)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/* Comprobamos la tabla */
SHOW TABLES;
DESCRIBE noticia;

/* Creamos la tabla comentario */
CREATE TABLE comentario(
idCom 			INTEGER,
usuario 		VARCHAR(20) 		NOT NULL,
noticia 		INTEGER 			NOT NULL,
contenido 		VARCHAR(100) 		NOT NULL,
fecha 			DATE 				NOT NULL,
PRIMARY KEY(idCom),
FOREIGN KEY(usuario) REFERENCES usuario(nick)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
FOREIGN KEY(noticia) REFERENCES noticia(idNoticia)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

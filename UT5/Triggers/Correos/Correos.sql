#-- 1 Crea la tabla
DROP DATABASE IF EXISTS Correos;
CREATE DATABASE Correos;
USE Correos;

CREATE TABLE Usuario(
id INTEGER,
nombre VARCHAR(20) NOT NULL,
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20) NOT NULL,
email VARCHAR(60),
PRIMARY KEY(id)
);
DESCRIBE Usuario;


#-- 2 Función para generar email
DROP FUNCTION IF EXISTS emailpersonalizado;

DELIMITER $$

CREATE FUNCTION emailpersonalizado(nom VARCHAR(20), ape1 VARCHAR(20), ape2 VARCHAR(20)) RETURNS VARCHAR(60)
BEGIN
	DECLARE emailper VARCHAR(60);
	SET emailper=CONCAT(nom,'.',ape1,'.',ape2,'@cesvegamedia.es');
	RETURN LOWER(emailper);
END$$

DELIMITER ;

SELECT emailpersonalizado('edu','janez','estrada');


#-- 3 Trigger
DELIMITER $$

CREATE TRIGGER insertar_email
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
	IF NEW.email IS NULL THEN
		SET NEW.email=emailpersonalizado(NEW.nombre,NEW.apellido1,NEW.apellido2);
	END IF;
END$$

DELIMITER ;


#-- 4 Inserciones
INSERT INTO Usuario VALUES(1,'Javi','Marin','Lopez', NULL),(2,'Diego','Jose','Perez', 'sadjkad@gmail.com'),
(3,'Pepe','Luis','Norberto', NULL),(4,'Victor','Josue','Moro', NULL);

SELECT * FROM Usuario;

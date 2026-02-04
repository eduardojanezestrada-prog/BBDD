#-- Unidad 4: TRATAMIENTO DE DATOS
#-- Base de datos newLigaBasket

DROP DATABASE IF EXISTS newLigaBasketcopia;
CREATE DATABASE newLigaBasketcopia;
USE newLigaBasketcopia;

#-- Creación de tablas
#-- Creamos la tabla Equipos
CREATE TABLE Equipos (
id_equipo 		INTEGER 		AUTO_INCREMENT,
nombre 			CHAR(50) 		NOT NULL, 
ciudad 			CHAR(50) 		NOT NULL, 
pabellon 		CHAR(100),
PRIMARY KEY(id_equipo)
);

#-- Mostramos la tabla Equipos
SHOW TABLES;
DESCRIBE Equipos;

#-- Creamos la tabla Partidos
CREATE TABLE Partidos(
id_partido 		INTEGER 		AUTO_INCREMENT,
elocal 			INTEGER 		NOT NULL,
evisit 			INTEGER 		NOT NULL,
puntosL 		INTEGER 		NOT NULL,
puntosV 		INTEGER 		NOT NULL,
fecha 			DATE,
PRIMARY KEY(id_partido),
FOREIGN KEY(elocal) REFERENCES Equipos(id_equipo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
FOREIGN KEY(evisit) REFERENCES Equipos(id_equipo)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

#-- Mostramos la tabla Partidos
SHOW TABLES;
DESCRIBE Partidos;

#-- Creamos la tabla Jugadores
CREATE TABLE Jugadores(
id_jugador 		INTEGER 		AUTO_INCREMENT,
nombre 			CHAR(30) 		NOT NULL,
apellido 		CHAR(30) 		NOT NULL,
puesto 			CHAR(20) 		NOT NULL,
salario 		INTEGER 		NOT NULL,
altura 			FLOAT,
id_capitan 		INTEGER,
equipo 			INTEGER 		NOT NULL,
PRIMARY KEY(id_jugador),
FOREIGN KEY(id_capitan) REFERENCES Jugadores(id_jugador)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
FOREIGN KEY(equipo) REFERENCES Equipos(id_equipo)
		ON UPDATE CASCADE
);

#-- Mostramos la tabla Jugadores
SHOW TABLES;
DESCRIBE Jugadores;


#-------------------------------------------------------------------------------------------------------------------------------------------
#-- INSERT ---------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------

#-- Insertar registro a registro
INSERT INTO Equipos(id_equipo, nombre, ciudad, pabellon) VALUES (0, 'Real Madrid', 'Madrid', 'Movistar Arena');
INSERT INTO Equipos VALUES (0, 'FC Barcelona', 'Barcelona', 'Palau Blaugrana');

#-- Insertar varios registros
INSERT INTO Equipos VALUES (0, 'Ucam Murcia', 'Murcia', 'Palacio Municipal de Deportes'), (0, 'Valencia Basket', 'Valencia', 'Roig Arena');

#-- 2 Formas de insertar un registro que contiene un campo nulo
/*  INSERT INTO Equipos(id_equipo, nombre, ciudad) VALUES (0, 'Unicaja', 'Malaga');  */
INSERT INTO Equipos VALUES (0, 'Unicaja', 'Malaga', NULL);

#-- Insertar un registro esoecificando el nombre y el valor de las columnas con SET
INSERT INTO Equipos SET nombre='Baskonia', ciudad='Vitoria';

#-- Insertar valores procedentes de consultas SELECT
INSERT INTO Equipos(id_equipo, nombre, ciudad, pabellon)
SELECT 0, 'Estudiantes', ciudad, pabellon
FROM Equipos
WHERE nombre='Real Madrid';

#-- Insertamos registros en la tabla de los Partidos
INSERT INTO Partidos(id_partido, elocal, evisit, puntosL, puntosV, fecha) VALUES (0, 1, 2, 90, 84, '2026-01-16');
INSERT INTO Partidos VALUES (0, 3, 4, 72, 81, '2026-01-17');
INSERT INTO Partidos VALUES (0, 5, 6, 60, 80, '2026-01-18');
INSERT INTO Partidos VALUES (0, 1, 2, 82, 95, CURRENT_DATE());

#-- Insertar partido jugado hoy entre Valencia Basket y Unicaja con resultado 75 a 74.
INSERT INTO Partidos
SELECT 0, E.id_equipo, Q.id_equipo, 75, 74, CURRENT_DATE()
FROM Equipos E, Equipos Q
WHERE E.nombre='Valencia Basket' AND Q.nombre='Unicaja';

#-- Insertar el partido jugado hoy entre los equipos 2 y 3,
#-- con el mismo resultado que el partido jugado entre Valencia Basket Y Unicaja
INSERT INTO Partidos
SELECT 0, 2, 3, puntosL, puntosV, CURRENT_DATE()
FROM Partidos
WHERE elocal=(SELECT id_equipo FROM Equipos WHERE nombre='Valencia Basket')
AND evisit=(SELECT id_equipo FROM Equipos WHERE nombre='Unicaja');

#-- REPLACE
#-- Si el registro existe(porque ya existe la clave primaria), lo reemplaza con los nuevos valores.
REPLACE INTO Partidos VALUES (1, 1, 2, 90, 86, '2026-01-16');
SELECT * FROM Partidos;

REPLACE INTO Partidos VALUES (7, 1, 2, 91, 86, '2026-01-16');
SELECT * FROM Partidos;

#-- Importar datos(Carga masiva) de Jugadores



#-------------------------------------------------------------------------------------------------------------------------------------------
#---- Modificaciones: UPDATE ---------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------

#-- Establece como pabellón de juego del Baskonia el "Fernando Buesa Arena"


#-- Establece como pabellón de juego de la ciudad de Malaga el "Martin Carpena"


#-- Cambiar el resultado del partido jugado entre los equipos 3 y 4, con resultado final 84-86


#-- Subir el salario de TODOS los jugadore 1000€


#-- Bajar el salario 1000€ a los jugadores del Madrid



#-------------------------------------------------------------------------------------------------------------------------------------------
#-- Borrar registros: DELETE ---------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------



#-- Eliminamos el jugador Markus Howard


#-- Eliminar los partidos de Unicaja como visitante


#-- Borramos TODOS los partidos de Ucam Murcia


#-- Borramos de la base de datos TODOS los registros de Jugadores


#-- Importar datos(Carga masiva)



#-------------------------------------------------------------------------------------------------------------------------------------------
#-- INTEGRIDAD REFERENCIAL -----------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------

#-- 1) BORRADO RESTRINGIDO -----------------------------------------------------------------------------------------------------------------

#-- Intentamos borrar al Baskonia pero no nos deja por una restricción de borrado(en la tabla Jugadores)
#-- Para borrarlo antes tenemos que hacer que no haya jugadores de ese equipo.


#-- Una vez que no haya jugadores de Baskonia y no haya referencias a este equipo podemos borrarlo



#-- 2) BORRADO NULO -----------------------------------------------------------------------------------------------------------------------

#-- Borramos al jugador Sergio Llull(Capitan del Madrid)


#-- 3) BORRADO EN CASCADA -----------------------------------------------------------------------------------------------------------------
#-- Borramos el equipo Real Madrid




#-- Comprobamos que se hayan borrado sus partidos tambien



#-------------------------------------------------------------------------------------------------------------------------------------------
#-- TRANSACCIONES --------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------

#-- Borrar yb Equipo implica dos operaciones:
#-- 1) Borrar todos los jugadores de Unicaja(o cambiarlos de equipo)
#-- 2) Una vez que el equipo no tiene jugadores, borrar el equipo



#-- Si ejecutamos ROLLBACK; veremos que se vuelve al estado previo al BEGIN;
#-- Se deshace la operación de borrado

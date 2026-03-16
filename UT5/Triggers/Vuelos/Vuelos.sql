#-- 1. Crea la base de datos ‘VUELOS’ y empieza a usarla como base de datos por defecto. 
DROP DATABASE IF EXISTS Vuelos;
CREATE DATABASE Vuelos;
USE Vuelos;

#-- 2. Crea la tabla ‘COMPAÑÍAS’ con los siguientes campos: 
CREATE TABLE Companias(
id_compania VARCHAR(2),
nombre VARCHAR(20) NOT NULL,
nacionalidad VARCHAR(20) NOT NULL,
PRIMARY KEY(id_compania)
);
DESCRIBE Companias;

#-- Carga los datos en la tabla desde un fichero de texto. 
LOAD DATA INFILE "C:/BBDD/Datos_Companias.txt" INTO TABLE Companias;
SELECT * FROM Companias;

#-- 3. Crea una tabla ‘CLIENTES’ con los siguientes campos:  
CREATE TABLE Clientes(
nif VARCHAR(9),
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20) NOT NULL,
nombre VARCHAR(20) NOT NULL,
poblacion VARCHAR(20) NOT NULL,
PRIMARY KEY(nif)
);
DESCRIBE Clientes;

#-- Carga los datos en la tabla desde un fichero de texto.
LOAD DATA INFILE "C:/BBDD/Datos_Clientes.txt" INTO TABLE Clientes;
SELECT * FROM Clientes;

#-- 4. Crea una tabla ‘VUELOS’ como la que se muestra a continuación.
CREATE TABLE Vuelos(
vuelo INT(4),
id_compania VARCHAR(2) NOT NULL,
fecha DATE NOT NULL,
origen VARCHAR(20) NOT NULL,
destino VARCHAR(20) NOT NULL,
plazas INT(5) NOT NULL,
PRIMARY KEY(vuelo),
UNIQUE(fecha,origen,destino),
UNIQUE(vuelo,id_compania,fecha),
FOREIGN KEY(id_compania) REFERENCES Companias(id_compania)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
DESCRIBE Vuelos;

#-- Carga los datos en la tabla desde un fichero de texto.
LOAD DATA INFILE "C:/BBDD/Datos_Vuelos.txt" INTO TABLE Vuelos;
SELECT * FROM Vuelos;

#-- 5. Crea una tabla ‘OCUPACIÓN_VUELOS’ y otra ‘RESERVAS’ con los campos y formatos 
#-- que se indican a continuación. Ten en cuenta que para un vuelo los asientos son 
#-- únicos. 
CREATE TABLE Ocuapcion_Vuelos(
vuelo INT(4),
pasajero VARCHAR(9),
asiento VARCHAR(3), 
observaciones VARCHAR(40),
PRIMARY KEY(vuelo, pasajero),
UNIQUE(vuelo, asiento),
FOREIGN KEY(vuelo) REFERENCES Vuelos(vuelo)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
FOREIGN KEY(pasajero) REFERENCES Clientes(nif)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
DESCRIBE Ocuapcion_Vuelos;

CREATE TABLE Reservas(
vuelo INT(4),
pasajero VARCHAR(9),
fecha_reserva DATE,
PRIMARY KEY(vuelo,pasajero,fecha_reserva),
FOREIGN KEY(vuelo) REFERENCES Vuelos(vuelo)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
FOREIGN KEY(pasajero) REFERENCES Clientes(nif)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
DESCRIBE Reservas;

#-- 6. Crea un trigger que, al insertar valores en la tabla ‘OCUPACIÓN_VUELOS’, inserte 
#-- automáticamente los valores correspondientes en la tabla ‘RESERVAS’.
CREATE TRIGGER alta_reservas
AFTER INSERT ON Ocuapcion_Vuelos
FOR EACH ROW
INSERT INTO Reservas(vuelo,pasajero,fecha_reserva)
VALUES (NEW.vuelo,NEW.pasajero,NOW());

#-- 7. Inserta los siguientes valores en la tabla ‘OCUPACIÓN_VUELOS’. Comprueba que han 
#-- sido insertados los correspondientes datos de forma automática en la tabla ‘RESERVAS’ 
INSERT INTO Ocuapcion_Vuelos(vuelo,pasajero,asiento)
VALUES (1005,'70589658A','1A'),(1005,'52587412D','3G');

SELECT * FROM Ocuapcion_Vuelos;

INSERT INTO Ocuapcion_Vuelos
VALUES (1005,'47852358S','4F','BEBE < 1 AÑO');

INSERT INTO Ocuapcion_Vuelos
VALUES (7458,'74125896Q','2G','SILLA RUEDAS');

SELECT * FROM Ocuapcion_Vuelos;

INSERT INTO Ocuapcion_Vuelos(vuelo,pasajero,asiento)
VALUES (7458,'12547854F','3F'),(4712,'52587412D','3G'),
(4712,'47852358S','1A'),(4712,'12547854F','5H'),(7525,'70589658A','2F');

SELECT * FROM Ocuapcion_Vuelos;
SELECT * FROM Reservas;

#-- 8. Cambia el asiento del pasajero 47852358S en el vuelo 4712 por el asiento 2C.
UPDATE Ocuapcion_Vuelos
SET asiento='2C'
WHERE pasajero='47852358S' AND vuelo='4712';
SELECT * FROM Ocuapcion_Vuelos;

#-- 9. Realiza una reserva (ocupación) para el vuelo BERLÍN-DUBLÍN del pasajero 12547854F.
INSERT INTO Ocuapcion_Vuelos
SELECT vuelo, '12547854F', NULL, NULL
FROM Vuelos
WHERE origen='BERLIN' AND destino='DUBLIN';
SELECT * FROM Ocuapcion_Vuelos;

#-- 10. Asigna al pasajero 12547854F del vuelo BERLÍN-DUBLÍN el asiento 4B.
UPDATE Ocuapcion_Vuelos
SET asiento='4B'
WHERE pasajero='12547854F' AND vuelo=(SELECT vuelo 
									  FROM Vuelos 
									  WHERE origen='BERLIN' AND destino='DUBLIN');
SELECT * FROM Ocuapcion_Vuelos;

#-- 11. Se ha cancelado el vuelo MADRID-LONDRES del 23 de abril de 2024. Saca un listado 
#-- con los datos de los pasajeros afectados.
SELECT C.*
FROM Ocuapcion_Vuelos O JOIN Vuelos V ON O.vuelo=V.vuelo JOIN Clientes C ON O.pasajero=C.nif
WHERE origen='MADRID' AND destino='LONDRES' AND fecha='2024-04-23';

#-- 12. Obtén los datos de los vuelos previstos para mayo y junio de 2024.
SELECT *
FROM Vuelos
WHERE year(fecha)=2024 AND month(fecha) IN(5,6);

#-- 13.  Crea un trigger que, al eliminar filas en la tabla ‘OCUPACIÓN_VUELOS’, elimine 
#-- automáticamente las filas correspondientes en la tabla ‘RESERVAS’.
CREATE TRIGGER eliminar
BEFORE DELETE ON Ocuapcion_Vuelos
FOR EACH ROW
DELETE FROM Reservas
WHERE OLD.vuelo=vuelo AND OLD.pasajero=pasajero;

#-- 14. Se cancelan los vuelos SEVILLA-BARCELONA. Elimínalos de la base de datos. 
#-- Comprueba que también han sido borradas las ocupaciones de vuelo y las reservas.
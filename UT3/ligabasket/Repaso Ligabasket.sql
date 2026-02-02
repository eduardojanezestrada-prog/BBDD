/* Creamos y cargamos la base de datos */
DROP DATABASE IF EXISTS ligabasket;
CREATE DATABASE ligabasket;
USE ligabasket;
SOURCE C:\BD_ligabasket.sql;

/* Comprobamos que la base de datos se ha cargado */
SHOW TABLES;
DESCRIBE equipos;
DESCRIBE jugadores;
DESCRIBE partidos;

/* Obtenemos todos los datos de los equipos */


/* Obtenemos todos los datos de los jugadores */


/* Obtenemos todos los datos de los partidos */


/* Obtenemos el nombre de cada equipo */


/* Obtenemos el nombre y la ciudad de cada equipo */


/* Obtenemos el nombre, la ciudad y el pabellón de cada equipo */


/* Obtenemos los nombres y apellidos de todos los jugadores */


/* Obtenemos nombres, apellidos y altura de todos los jugadores */


/* Obtenemos el apellido y el salario de todos los jugadores */


/* Obtenemos apellidos y altura en cm de todos los jugadores */


/* Obtenemos el nombre de cada equipo */


/* Obtenemos el nombre de cada equipo */


/* Obtenemos el nombre de cada equipo junto a la ciudad que representa */


/* Mostramos el resultado de los partidos */


/* Renombramos siempre, resta puntos por que el nombre de la consulta sea la operación */


/* Mostramos el apellido y altura de cada jugador */


/* Deleccionamos los nombres y apellidos de los jugadores ordenados por apellido */


/* Nombre y altura segun el orden ascendente de altura */


/* Nombre y altura segun el orden descendente de altura */


/* Nombre y altura segun el orden ascendente de altura */


/* nombre y apellidos del jugador más bajo */


/* nombre y apellidos del jugador más alto */


/* Nombre, apellido y sueldo de los 5 jugadoresque mas cobran */


/* Mostrar todas las posiciones de juego */
/* Eliminamos las filas o registros duplicados */


/* Calcular salario neto anual a percibir por cada jugador */
/* Suponemos un irpf del 18% */


/* Mostrar la fecha actual del sistema */


/* Mostramos nombre y apellidos solo de los pivot */
SELECT nombre, apellido
FROM jugadores
WHERE puesto="pivot";

/* Mostramos nombre y apellidos solo de los que cobren mas de 100k */
SELECT nombre, apellido
FROM jugadores
WHERE salario>100000;

/* Nombre y apellidos de los jugadores que ganan mas de 100k */
/* Por orden alfabetico según apellido */
SELECT nombre, apellido
FROM jugadores
WHERE salario>100000
ORDER BY apellido;

#-- Nombre, apellidos y altura de los pivots, ordenados de mayor a menor altura
SELECT nombre, apellido, altura
FROM jugadores
WHERE puesto="pivot"
ORDER BY altura DESC;

#-- Datos d elos jugadores que sean pivots y ganen mas de 100k
SELECT *
FROM jugadores
WHERE puesto="pivot" AND salario>100000;

#-- Nombre, apellidos y altura de los bases que midan más de 2m
SELECT nombre, apellido, altura
FROM jugadores
WHERE puesto="base" AND altura>2;

#-- Nombre, apellidos y altura de los aleros que midan más de 2m
SELECT nombre, apellido, altura
FROM jugadores
WHERE puesto="alero" AND altura>2;

#-- DATOS DE los jugadores que no pertenecen al equipo 3
SELECT *
FROM jugadores
WHERE equipo!=3;

SELECT *
FROM jugadores
WHERE equipo<>3;

#-- Resultado de los partidos jugados en mayo
SELECT CONCAT(puntosL,"-",puntosV) AS "Resultados Mayo"
FROM partidos
WHERE month(fecha)=5;

#-- Resultado de los partido del 30/1/2018
SELECT CONCAT(puntosL,"-",puntosV) AS "Resultado 30 de enero"
FROM partidos
WHERE month(fecha)=1 AND day(fecha)=30 AND year(fecha)=2018;

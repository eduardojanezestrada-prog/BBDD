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
SELECT *
FROM equipos;

/* Obtenemos todos los datos de los jugadores */
SELECT *
FROM jugadores;

/* Obtenemos todos los datos de los partidos */
SELECT *
FROM partidos;

/* Obtenemos el nombre de cada equipo */
SELECT nombre
FROM equipos;

/* Obtenemos el nombre y la ciudad de cada equipo */
SELECT nombre, ciudad
FROM equipos;

/* Obtenemos el nombre, la ciudad y el pabellón de cada equipo */
SELECT nombre, ciudad, pabellon
FROM equipos;

/* Obtenemos los nombres y apellidos de todos los jugadores */
SELECT nombre, apellido
FROM jugadores;

/* Obtenemos nombres, apellidos y altura de todos los jugadores */
SELECT nombre, apellido, altura
FROM jugadores;

/* Obtenemos el apellido y el salario de todos los jugadores */
SELECT apellido, salario
FROM jugadores;

/* Obtenemos apellidos y altura en cm de todos los jugadores */
SELECT apellido, altura * 100
FROM jugadores;

/* Obtenemos el nombre de cada equipo */
SELECT nombre AS name
FROM equipos;

/* Obtenemos el nombre de cada equipo */
SELECT nombre AS "Nombre del Equipo"
FROM equipos;

/* Obtenemos el nombre de cada equipo junto a la ciudad que representa */
SELECT nombre AS name, ciudad AS city
FROM equipos;

/* Mostramos el resultado de los partidos */
SELECT puntosL, puntosV
FROM partidos;

SELECT puntosL, "-", puntosV
FROM partidos;

/* Renombramos siempre, resta puntos por que el nombre de la consulta sea la operación */
SELECT CONCAT(puntosL,"-",puntosV) AS resultado
FROM partidos;

/* Mostramos el apellido y altura de cada jugador */
SELECT CONCAT(apellido," mide ",altura," metros") AS "Jugador y altura"
FROM jugadores;

/* Deleccionamos los nombres y apellidos de los jugadores ordenados por apellido */
SELECT nombre, apellido
FROM jugadores
ORDER BY apellido;

/* Nombre y altura segun el orden ascendente de altura */
SELECT nombre, altura
FROM jugadores
ORDER BY altura ASC;			/* ASC está puesto por defecto, no hace falta ponerlo */

/* Nombre y altura segun el orden descendente de altura */
SELECT nombre, altura
FROM jugadores
ORDER BY altura DESC;

/* Nombre y altura segun el orden ascendente de altura */
SELECT nombre, altura
FROM jugadores
ORDER BY altura, nombre;

/* nombre y apellidos del jugador más bajo */
SELECT nombre, apellido
FROM jugadores
ORDER BY altura
LIMIT 1;

/* nombre y apellidos del jugador más alto */
SELECT nombre, apellido
FROM jugadores
ORDER BY altura DESC
LIMIT 1;

/* Nombre, apellido y sueldo de los 5 jugadoresque mas cobran */
SELECT nombre, apellido, salario
FROM jugadores
ORDER BY salario DESC
LIMIT 5;

/* Mostrar todas las posiciones de juego */
/* Eliminamos las filas o registros duplicados */
SELECT DISTINCT puesto
FROM jugadores;

/* Calcular salario neto anual a percibir por cada jugador */
/* Suponemos un irpf del 18% */
SELECT nombre, apellido, salario*0.82 AS "Salario neto"
FROM jugadores;

/* Mostrar la fecha actual del sistema */
SELECT CURRENT_DATE() AS Hoy;			/* SOLO FECHA */
SELECT NOW() AS "Fecha actual";			/* FECHA Y HORA */

SELECT year(CURRENT_DATE()) AS "Año";
SELECT month(CURRENT_DATE()) AS "Mes";
SELECT day(NOW()) AS "Día";

SELECT CONCAT(day(NOW()), "/", month(NOW()),"/", year(NOW())) AS Hoy;

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

#-- Nombre de los equipos de los que se desconoce el nombre de su pabellón
SELECT nombre
FROM equipos
WHERE pabellon IS NULL;

#-- Nombre de los equipos de los que si se conozca el nombre de su pabellón
SELECT nombre
FROM equipos
WHERE pabellon IS NOT NULL;

#-- Nombre y puesto de los jugadores que no sean base
SELECT nombre, puesto
FROM jugadores
WHERE puesto!="base";

SELECT nombre, puesto
FROM jugadores
WHERE NOT puesto="base";

#-- Nombre y ouesto de los jugadores que sean base o escolta
SELECT nombre, puesto
FROM jugadores
WHERE puesto="base" OR puesto="escolta";

SELECT nombre, puesto
FROM jugadores
WHERE puesto IN ("base", "escolta");

#-- Nombre y ouesto de los jugadores que NO sean base NI escolta
SELECT nombre, puesto
FROM jugadores
WHERE puesto NOT IN ("base", "escolta");

SELECT nombre, puesto
FROM jugadores
WHERE puesto!="base" AND puesto!="escolta";

SELECT nombre, puesto
FROM jugadores
WHERE NOT (puesto="base" OR puesto="escolta");

#-- Nombre y ouesto de los jugadores que sean alero o escolta
#-- Y midan menos de dos metros
SELECT nombre, puesto
FROM jugadores
WHERE (puesto="alero" OR puesto="escolta") AND altura<2;

#-- Nombre de los jugadores que sean pivots de los equipos 1 y 2
SELECT Nombre
FROM jugadores
WHERE (equipo=1 OR equipo=2) AND puesto="pivot";

#-- IMPORTANTE !!!! No olvides los parentesis para agrupar clausulas OR

SELECT nombre
FROM jugadores
WHERE puesto="pivot" AND equipo IN (1,2);

#-- Datos de los equipos menos los que juegan
#-- en las ciudades de Valencia y Madrid
SELECT *
FROM equipos
WHERE ciudad NOT IN ("Valencia", "Madrid");

#-- Nombre y salario de los jugadores que cobren entre 60.000 y 100.000€
SELECT nombre, salario
FROM jugadores
WHERE salario>=60000 AND salario<=100000;

SELECT nombre, salario
FROM jugadores
WHERE salario BETWEEN 60000 AND 100000;

#-- Nombre y Salario de los jugadores que no cobren entre 60k y 100k
SELECT nombre, salario
FROM jugadores
WHERE salario NOT BETWEEN 60000 AND 100000;

#-- Nombre apellidos y altura de los jugadores que midan entre 1.95 y 2.05
SELECT nombre, apellido, altura
FROM jugadores
WHERE altura BETWEEN 1.95 AND 2.05;

#-- Nombre apellidos y altura de los jugadores que midan entre 1.95 y 2.05
#-- Y que no jueguen como pivots
SELECT nombre, apellido, altura
FROM jugadores
WHERE altura BETWEEN 1.95 AND 2.05 AND puesto!="pivot";

SELECT nombre, apellido, altura
FROM jugadores
WHERE altura BETWEEN 1.95 AND 2.05 AND puesto<>"pivot";

SELECT nombre, apellido, altura
FROM jugadores
WHERE altura BETWEEN 1.95 AND 2.05 AND NOT puesto="pivot";

#-- Resulltado de los partidos que se jugaron en enero de 2018
SELECT CONCAT(puntosL,"-",puntosV) AS Resulltado
FROM partidos
WHERE month(fecha)=1 AND year(fecha)=2018;

#-- Nombre de los jugadores cuyo nombre empiece por A
SELECT nombre
FROM jugadores
WHERE nombre LIKE "A%";

#-- Nombre de los jugadores cuyo nombre termine en O
SELECT nombre
FROM jugadores
WHERE nombre LIKE "%o";

#-- Nombre de los jugadores cuyo nombre empiece por A y termine en O
SELECT nombre
FROM jugadores
WHERE nombre LIKE "A%o";

#-- Apellido de los jugadores cuyo apellido tengan solo 5 letras
SELECT apellido 
FROM jugadores 
WHERE apellido LIKE"_____";

#-- Apellidos de los jugadores cuya penultima letra sea la a 
SELECT DISTINCT apellido
FROM jugadores 
WHERE apellido LIKE "%a_";

#-- Mostrar el total de jugadores registrados en la base de datos
SELECT COUNT(*) AS "Total jugadores"
FROM jugadores;
#-- equivalentes
SELECT COUNT(id_jugadores) AS Total_jugadores
FROM jugadores;

#-- Calcular y mostrar cuántos jugadores miden mas de 2 metros
SELECT COUNT(altura) AS "Jugadores +2m"
FROM jugadores 
WHERE altura>2.0;

#-- Calcular y mostrar cuántos jugadores son pivots
SELECT COUNT(puesto) AS "Nº de pivots"
FROM jugadores 
WHERE puesto="pivot";

#-- Calcular y mostrar cuantas ciudades hay registradas en la base de datos donde jueguen equipos
SELECT COUNT(DISTINCT ciudad) AS "Nº ciudades"
FROM equipos;

#-- Calcular y mostrar la cantidad de jugadores que son capitanes
SELECT COUNT(DISTINCT id_capitan) AS "Nº de capitanes"
FROM jugadores;

#-- Nombre y apellido de los jugadores que son capitanes de sus equipos
SELECT nombre, apellido
FROM jugadores
WHERE id_jugador=id_capitan;

#-- Obtener el salario máximo
SELECT MAX(salario) AS "Sueldo más alto"
FROM jugadores;

#-- Obtener el salario mínimo
SELECT MIN(salario) AS "Sueldo más bajo"
FROM jugadores;

#-- Encontrar el salario más alto, el más bajo y la diferencia entre ambos
SELECT MAX(salario) AS "Sueldo más alto", MIN(salario) AS "Sueldo más bajo", 
       MAX(salario)-MIN(salario) AS Diferencia
FROM jugadores;

#-- Calcular el salario medio de todos los jugadores
SELECT AVG(salario) AS "Salario medio"
FROM jugadores;

#-- Calcular el salario medio de los jugadores del equioo 1
SELECT AVG(salario) AS "Salario medio"
FROM jugadores
WHERE equipo=1;

#-- Calcular el salario total de los jugadores del equioo 1
SELECT SUM(salario) AS "Salario Total"
FROM jugadores
WHERE equipo=1;

#-- Obtener el salario mensual neto de cada jugador suponiendo un IRPF 18%
SELECT SUM(salario)*0.82/12 AS "Salario Neto mensual"
FROM jugadores;

#-- ¿Cuántos jugadores hay de CADA equipo?
SELECT equipo, COUNT(*) AS Total
FROM jugadores 
GROUP BY equipo;

#-- Mostramos la altura media por equipo
SELECT equipo, AVG(altura) AS "Altura Media"
FROM jugadores
GROUP BY equipo;

#-- Mostrar el salario del jugador que mas cobra por equipo
SELECT equipo, MAX(salario) AS "Salario más alto"
FROM jugadores
GROUP BY equipo;

#-- Por orden de mayor a menor
SELECT equipo, MAX(salario) AS "Salario más alto"
FROM jugadores
GROUP BY equipo
ORDER BY MAX(salario) DESC;

#-- Mostrar la mayor altura por posición en orden (ascendente) de altura
SELECT puesto, MAX(altura) AS "Más alto"
FROM jugadores
GROUP BY puesto
ORDER BY MAX(altura);

#-- Mostrar la mayor altura por posición 
#-- pero solo para aquellas posiciones  cuya alt media sea superior a 2m
SELECT puesto, MAX(altura) AS "Más alto"
FROM jugadores
GROUP BY puesto
HAVING AVG(altura)>2.0;
/* Nunca poner una funcion(AVG, MIN, MAX, COUNT, SUM) en un 'WHERE'. Siempre irá detras de un 'GROUP BY' con un 'HAVING' */

#-- Salario medio para cada puesto cuyo salario medio sea superior a 95k
SELECT puesto, AVG(salario) AS "Media salario"
FROM jugadores
GROUP BY puesto
HAVING AVG(salario)>95000;

#-- Mostrar el salario total de cada equipo
#-- Para aquellos equipos con menos de 4 jugadores
SELECT equipo, SUM(salario) AS salario
FROM jugadores
GROUP BY equipo
HAVING COUNT(*)<4;

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--

#--
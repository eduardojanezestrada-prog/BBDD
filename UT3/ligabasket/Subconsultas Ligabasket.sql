#------------------
#-- SUBCONSULTAS --
#------------------

#-- DATOS DE LOS JUGADORES QUE COBREN MAS QUE LLULL

#-- Paso 1: Ver cuanto cobra llull
SELECT salario
FROM Jugadores
WHERE apellido="Llull";

#-- Paso 2: Datos de los jugadores que cobran más de 100k
SELECT *
FROM Jugadores
WHERE salario>100000;

#-- Paso 3: Consulta final
SELECT *
FROM Jugadores
WHERE salario> (SELECT salario
				FROM Jugadores
				WHERE apellido="Llull");
				
#-- Mostrar el nombre apellido y altura de los JUGADORES
#-- que midan lo mismo que alberto diaz
SELECT nombre, apellido, altura
FROM Jugadores 
WHERE altura=( SELECT altura
			   FROM Jugadores 
			   WHERE nombre="Alberto" AND apellido="Diaz");

#-- Nombre apellido y altura de los jugadores que juegen en el mismo puesto que LLULL
SELECT nombre, apellido, altura 
FROM Jugadores
WHERE puesto=(SELECT puesto
			  FROM Jugadores
			  WHERE nombre="Sergio" AND apellido="Llull");

#-- Nombre apellido y altura de los jugadores que juegen en el mismo puesto que LLULL
#-- Sin incluir a LLULL
SELECT nombre, apellido, altura 
FROM Jugadores
WHERE NOT (nombre="Sergio" AND apellido="Llull") AND puesto=(SELECT puesto
															 FROM Jugadores
															 WHERE nombre="Sergio" AND apellido="Llull");
 
#-- Mostrar nombre y apelllido de los compañeros de equipo de rudy
#-- Fernandez sin incluirlo a el
SELECT nombre, apellido
FROM Jugadores 
WHERE NOT(nombre="Rudy" AND apellido="Fernandez") AND equipo=(SELECT equipo
															  FROM Jugadores 
															  WHERE nombre="Rudy" AND apellido="Fernandez");

#-- Obtener nombre apellido y sueldo de los jugadores que cobren menos del salario medio
SELECT nombre, apellido, salario 
FROM Jugadores 
WHERE salario<(SELECT AVG(salario) FROM Jugadores);

#-- Bombre, apellidos y sueldo del jugador que mas cobra de la liga
/* Primera solución */
SELECT nombre, apellido, salario
FROM Jugadores 
ORDER BY salario DESC
LIMIT 1;

/* Segunda solución */  #-- LA MEJOR SOLUCIÓN
SELECT nombre, apellido, salario
FROM Jugadores
WHERE salario=(SELECT MAX(salario) FROM Jugadores);

/* Tercera solución */
SELECT nombre, apellido, salario
FROM Jugadores
WHERE salario>= ALL (SELECT salario FROM Jugadores);

#-- Nombre de los jugadores que ganen mas que todos los del equipo 3
SELECT nombre
FROM Jugadores
WHERE salario> ALL (SELECT salario FROM Jugadores WHERE equipo=3);

SELECT nombre
FROM Jugadores
WHERE salario> (SELECT MAX(salario) FROM Jugadores WHERE equipo=3);

#-- Nombre y salario de los jugadores que ganen mas que alguno del equipo 2
SELECT nombre, salario
FROM Jugadores
WHERE salario> ANY (SELECT salario FROM Jugadores WHERE equipo=2);

SELECT nombre, salario
FROM Jugadores
WHERE salario> (SELECT MIN(salario) FROM Jugadores WHERE equipo=2);

#-- Datos de los jugadores que midan lo mismo que alguno del equipo 6
SELECT *
FROM Jugadores
WHERE altura= ANY(SELECT altura FROM Jugadores WHERE equipo=6);

SELECT *
FROM Jugadores
WHERE altura IN (SELECT altura FROM Jugadores WHERE equipo=6);

#-- Datos de los jugadores que midan lo mismo que alguno del equipo 6
#-- Sin equipo 6
SELECT *
FROM Jugadores
WHERE equipo<>6 AND altura= ANY(SELECT altura FROM Jugadores WHERE equipo=6);

SELECT *
FROM Jugadores
WHERE equipo<>6 AND altura IN(SELECT altura FROM Jugadores WHERE equipo=6);

/*
SELECT ...
FROM ...
WHERE clave ajena IN (SELECT clave primaria FROM...); 
*/

#-- Datos de los jugadores que jueguen en Madrid
SELECT *
FROM Jugadores
WHERE equipo IN(SELECT id_equipo FROM Equipos WHERE ciudad="Madrid");

#-- 1. Datos de los equipos cuya ciudad no empiece por ‘M’.
SELECT *
FROM Equipos 
WHERE ciudad NOT LIKE "M%";

#-- 2. Datos del jugador mejor pagado.
SELECT *
FROM Jugadores 
WHERE salario=(SELECT MAX(salario) FROM Jugadores);

#-- 3. Identificador de equipo y suma de las alturas de sus jugadores.
SELECT equipo, SUM(altura) AS "Altura total"
FROM Jugadores 
GROUP BY equipo;

#-- 4. Obtener el salario total de cada equipo.
SELECT equipo, SUM(salario) AS "Salario total"
FROM Jugadores
GROUP BY equipo;

#-- 5. Mostrar el mayor salario total de entre todos los equipos.
SELECT equipo, SUM(salario) AS "Salario total más alto"
FROM Jugadores
GROUP BY equipo
HAVING SUM(salario)>= ALL  (SELECT SUM(salario)
							FROM Jugadores
							GROUP BY equipo);

SELECT SUM(salario) AS "Mayor Salario total"
FROM Jugadores
GROUP BY equipo
ORDER BY SUM(salario) DESC
LIMIT 1;

#-- 6. Número de partidos que ha jugado el equipo 3 como local.
SELECT COUNT(*) AS "Partidos de local del equipo 3"
FROM Partidos 
WHERE elocal=3;

#-- 7. Número de partidos que ha jugado el Valencia como local.
SELECT COUNT(*) AS "Partidos de local del Valencia"
FROM Partidos 
WHERE elocal=(SELECT id_equipo
			  FROM Equipos
			  WHERE nombre LIKE "%Valencia%");

#-- 8. Nombre y apellido de los jugadores del Madrid.
SELECT nombre, apellido
FROM Jugadores 
WHERE equipo=(SELECT id_equipo
			  FROM Equipos
			  WHERE nombre LIKE "%Madrid%");

#-- 9. Nombre y apellido de los capitanes.
SELECT nombre, apellido
FROM Jugadores 
WHERE id_jugador=id_capitan;

#-- con subconsultas 
SELECT nombre, apellido
FROM Jugadores 
WHERE id_jugador IN (SELECT id_capitan FROM Jugadores);

#-- 10. Identificador de los equipos con más de tres jugadores registrados.
SELECT equipo
FROM Jugadores 
GROUP BY equipo
HAVING COUNT(*)>3;


#-------------------------
#-- PRODUCTO CARTESIANO --
#-------------------------

SELECT *
FROM jugadores, equipos;

#-- Con filtro
SELECT *
FROM jugadores, equipos
WHERE equipo=id_equipo;

#-- Si la clave ajena y primiaria se llamen igual utilizamos un alias para definir cada una
#-- Tambien se puede poner "jugadores AS J" pero muchas veces nos lo podremos ahorrar
SELECT *
FROM jugadores J, equipos E
WHERE J.equipo=E.id_equipo;

#-- Nombre, apellido y puesto de los JUGADORES
#-- junto al nombre del equipo en el que juegan
SELECT J.nombre, apellido, puesto, E.nombre 
FROM jugadores J, equipos E 
WHERE equipo=id_equipo;

#-- Número de jugadores de cada equipo
SELECT E.nombre, COUNT(*) AS TOTAL
FROM jugadores J, equipos E 
WHERE equipo=id_equipo
GROUP BY E.nombre;

#-- Número de jugaodres de equipos cuya ciudad empiece por M
#-- Primera solución: Producto cartesiano.
SELECT COUNT(*) AS TOTAL
FROM jugadores J, equipos E 
WHERE equipo=id_equipo AND ciudad LIKE 'M%';

#-- Segunda solución: Subconsulta IN.
SELECT COUNT(*) AS TOTAL
FROM jugadores
WHERE equipo IN (SELECT id_equipo 
				 FROM equipos 
				 WHERE ciudad LIKE 'M%');

#-- Nombre y apellido de cada jugador junto con el nombre del equipo en que juegan

#-- Solución 1: PRODUCTO CARTESIANO
SELECT CONCAT(J.nombre," ", apellido) AS Jugador, E.nombre AS Equipo
FROM jugadores J, equipos E
WHERE equipo=id_equipo;

#-- Solución 2: INNER JOIN
SELECT CONCAT(jugadores.nombre," ", apellido) AS Player, equipos.nombre AS Team
FROM jugadores INNER JOIN equipos ON equipo=id_equipo;

#-- Nombre da cada equipo junto al número de partidos
#-- que han disputados de local
SELECT nombre, COUNT(*) AS "Partidos de local"
FROM partidos P, equipos E
WHERE id_equipo=elocal
GROUP BY nombre;

#-- Nombre de cada equipo y salario MÁXIMO de entre todos sus jugadores
SELECT E.nombre, MAX(salario) AS "Salario mas alto"
FROM equipos E, jugadores J
WHERE id_equipo=equipo
GROUP BY E.nombre;

#-- Obtener el número de jugadores de equipos de Madrid
/* PRODUCTO CARTESIANO */
SELECT COUNT(*) AS "Jugadores que juegan en Madrid"
FROM equipos E, jugadores J
WHERE id_equipo=equipo AND ciudad='Madrid';

/* INNER JOIN */
SELECT COUNT(*) AS "Jugadores que juegan en Madrid"
FROM equipos INNER JOIN jugadores ON id_equipo=equipo AND ciudad='Madrid';

#-- UNION
(SELECT nombre FROM jugadores WHERE equipo=1)
UNION
(SELECT nombre FROM jugadores WHERE equipo=2);

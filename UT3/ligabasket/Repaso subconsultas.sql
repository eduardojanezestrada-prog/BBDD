#------------------
#-- SUBCONSULTAS --
#------------------

#-- DATOS DE LOS JUGADORES QUE COBREN MAS QUE LLULL

#-- Paso 1: Ver cuanto cobra llull


#-- Paso 2: Datos de los jugadores que cobran más de 100k


#-- Paso 3: Consulta final

				
#-- Mostrar el nombre apellido y altura de los JUGADORES
#-- que midan lo mismo que alberto diaz


#-- Nombre apellido y altura de los jugadores que juegen en el mismo puesto que LLULL


#-- Nombre apellido y altura de los jugadores que juegen en el mismo puesto que LLULL
#-- Sin incluir a LLULL

 
#-- Mostrar nombre y apelllido de los compañeros de equipo de rudy
#-- Fernandez sin incluirlo a el


#-- Obtener nombre apellido y sueldo de los jugadores que cobren menos del salario medio


#-- Bombre, apellidos y sueldo del jugador que mas cobra de la liga
/* Primera solución */


/* Segunda solución */  #-- LA MEJOR SOLUCIÓN


/* Tercera solución */


#-- Nombre de los jugadores que ganen mas que todos los del equipo 3
/*CON ALL*/

/* CON MAX()*/


#-- Nombre y salario de los jugadores que ganen mas que alguno del equipo 2
/*CON ANY*/


/*CON MIN()*/


#-- Datos de los jugadores que midan lo mismo que alguno del equipo 6
/* ANY */


/* IN */


#-- Datos de los jugadores que midan lo mismo que alguno del equipo 6
#-- Sin equipo 6
/* ANY */


/* IN */


/*
SELECT ...
FROM ...
WHERE clave ajena IN (SELECT clave primaria FROM...); 
*/

#-- Datos de los jugadores que jueguen en Madrid

#-- 1. Datos de los equipos cuya ciudad no empiece por ‘M’.


#-- 2. Datos del jugador mejor pagado.


#-- 3. Identificador de equipo y suma de las alturas de sus jugadores.


#-- 4. Obtener el salario total de cada equipo.


#-- 5. Mostrar el mayor salario total de entre todos los equipos.

#-- 6. Número de partidos que ha jugado el equipo 3 como local.


#-- 7. Número de partidos que ha jugado el Valencia como local.


#-- 8. Nombre y apellido de los jugadores del Madrid.


#-- 9. Nombre y apellido de los capitanes.


#-- con subconsultas 


#-- 10. Identificador de los equipos con más de tres jugadores registrados.



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


#-- Número de jugadores de cada equipo


#-- Número de jugaodres de equipos cuya ciudad empiece por M
#-- Primera solución: Producto cartesiano.


#-- Segunda solución: Subconsulta IN.


#-- Nombre y apellido de cada jugador junto con el nombre del equipo en que juegan

#-- Solución 1: PRODUCTO CARTESIANO


#-- Solución 2: INNER JOIN


#-- Nombre da cada equipo junto al número de partidos
#-- que han disputados de local


#-- Nombre de cada equipo y salario MÁXIMO de entre todos sus jugadores


#-- Obtener el número de jugadores de equipos de Madrid
/* PRODUCTO CARTESIANO */


/* INNER JOIN */

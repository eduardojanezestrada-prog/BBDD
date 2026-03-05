#-- Crea un procedimiento para comprobar si un cliente puede ver una película (edad minima). El
#-- procedimiento debe mostrar el nombre del cliente, el título de la película, la edad del cliente, la edad
#-- minima recomendada y un campo "Resultado" con "APTO" o "NO APTO". Parámetros: identificador del
#-- cliente e identificador de la película.
DROP PROCEDURE IF EXISTS puedeVer;

DELIMITER $$

CREATE PROCEDURE puedeVer(clien INT, peli INT)
BEGIN
	#-- Declaracion de variables
	DECLARE eclien, edadmin INT;
	DECLARE resu VARCHAR(10);
	
	#-- Inicialización de variables
	SET resu='APTO';
	SET eclien=(SELECT edad FROM clientes WHERE idCliente=clien);
	SET edadmin=(SELECT edadMinima FROM peliculas WHERE idPelicula=peli);
	
	#-- Actualizamos si es apto o no para ver la pelicula
	IF (eclien<edadmin) THEN
		SET resu='NO APTO';
	END IF;
	
	#-- Hacemos el SELECT
	SELECT C.nombre AS Cliente, eclien AS "Edad Cliente", P.titulo AS "Película", edadmin AS "Edad Minima", resu AS Resultado
	FROM clientes C, peliculas P
	WHERE C.idCliente=clien AND P.idPelicula=peli;
END$$

DELIMITER ;

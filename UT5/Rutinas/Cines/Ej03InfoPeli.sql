#-- Desarrolla un procedimiento que muestre la siguiente información sobre una película: título, genero,
#-- duración, entradas vendidas, recaudación total. Parámetro: identificador de la película.

DROP PROCEDURE IF EXISTS infoPeli;

DELIMITER $$

CREATE PROCEDURE infoPeli(peli INT)
BEGIN
	SELECT P.titulo, P.genero, P.duracion, COUNT(E.idPelicula) AS "Entradas Vendidas", recaudacion(peli) AS "Recaudación Total"
	FROM peliculas P LEFT JOIN entradas E ON P.idPelicula=E.idPelicula
	WHERE P.idPelicula=peli
	GROUP BY P.idPelicula, P.genero, P.duracion;
END$$

DELIMITER ;

CALL infoPeli(6);

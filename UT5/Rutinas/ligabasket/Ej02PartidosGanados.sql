#-- Crea una función que indique el número de partidos que ha ganado un equipo. La función recibirá
#-- como parámetro el identificador del equipo.
DROP FUNCTION IF EXISTS PartidosGanados;

DELIMITER $$

CREATE FUNCTION PartidosGanados(equi INT) RETURNS INT
BEGIN
	DECLARE contar, contar2 INT;
	SET contar=	(SELECT COUNT(*)
				FROM partidos
				WHERE elocal=equi AND puntosL>puntosV);
	SET contar2=(SELECT COUNT(*)
				FROM partidos
				WHERE evisit=equi AND puntosL<puntosV);
	RETURN contar+contar2;
END$$

DELIMITER ;

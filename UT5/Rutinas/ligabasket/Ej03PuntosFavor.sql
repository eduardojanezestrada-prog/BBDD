#-- Crea una función que indique el total de puntos a favor (o anotados) de un equipo. 
#-- La función recibirá como parámetro el identificador del equipo.
DROP FUNCTION IF EXISTS puntos_favor;

DELIMITER $$

CREATE FUNCTION puntos_favor(idEq INT) RETURNS INT
BEGIN
	DECLARE plocal, pvisit INT;
	SET plocal=(SELECT SUM(puntosL)
				FROM partidos
				WHERE elocal=idEq);
	SET pvisit=(SELECT SUM(puntosV)
				FROM partidos
				WHERE evisit=idEq);
	SET plocal=IFNULL(plocal, 0)+IFNULL(pvisit, 0);
	RETURN plocal;
END$$

DELIMITER ;
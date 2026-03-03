#-- Crea una función que indique el total de puntos en contra (o recibidos) de un equipo. 
#-- La función recibirá como parámetro el identificador del equipo.
DROP FUNCTION IF EXISTS pcontra;

DELIMITER $$

CREATE FUNCTION pcontra(idEq INT) RETURNS INT
BEGIN
	DECLARE plocal, pvisit INT;
	SET plocal=(SELECT SUM(puntosV)
				FROM partidos
				WHERE elocal=idEq);
	SET pvisit=(SELECT SUM(puntosL)
				FROM partidos
				WHERE evisit=idEq);
	SET plocal=IFNULL(plocal, 0)+IFNULL(pvisit, 0);
	RETURN plocal;
END$$

DELIMITER ;

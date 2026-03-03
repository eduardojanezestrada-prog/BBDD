#-- Crea un procedimiento que reciba como parámetro el identificador de un equipo y muestre la siguiente
#-- información: nombre del equipo, número de partidos ganados, número de partidos perdidos, total de
#-- puntos a favor y total de puntos en contra.
DROP PROCEDURE IF EXISTS info;

DELIMITER $$

CREATE PROCEDURE info(idEq INT)
BEGIN
	DECLARE nom CHAR(50);
	DECLARE pargan, parpen, favor, contra INT;
	SET nom=(SELECT nombre FROM equipos WHERE id_equipo=idEq);
	SET pargan=(SELECT PartidosGanados(idEq));
	SET parpen=(SELECT COUNT(*)
				FROM partidos
				WHERE (elocal=idEq AND puntosL<puntosV) OR (evisit=idEq AND puntosL>puntosV));
	SET favor= (SELECT puntos_favor(idEq));
	SET contra= (SELECT pcontra(idEq));
	
	SELECT nom AS Nombre, pargan AS PG, IFNULL(parpen, 0) AS PP, favor AS PF, contra AS PC;
END$$

DELIMITER ;

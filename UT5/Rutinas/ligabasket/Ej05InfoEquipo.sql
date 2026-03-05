#-- Crea un procedimiento que reciba como parámetro el identificador de un equipo y muestre la siguiente
#-- información: nombre del equipo, número de partidos ganados, número de partidos perdidos, total de
#-- puntos a favor y total de puntos en contra.
DROP PROCEDURE IF EXISTS info;

DELIMITER $$

CREATE PROCEDURE info(idEq INT)
BEGIN
	DECLARE total, ganados INT;
	SET total=(SELECT COUNT(*) FROM Partidos WHERE elocal=idEq OR evisit=idEq);
	SET ganados=PartidosGanados(idEq);
	SELECT nombre, ganados AS "PG", total-ganados AS "PP", puntos_favor(idEq) AS "PF", pcontra(idEq) AS "PC"
	FROM Equipos
	WHERE id_equipo=idEq;
END$$

DELIMITER ;

#-- Crea un procedimiento que muestre el nombre del equipo ganador de un partido. El procedimiento
#-- recibirá como parámetro el identificador del partido.
DROP PROCEDURE IF EXISTS gan;

DELIMITER $$

CREATE PROCEDURE gan(partido INT)
BEGIN
	DECLARE reslocal,resvisitante, vencedor INT;
	SET reslocal=(SELECT puntosL FROM partidos WHERE id_partido=partido);
	SET resvisitante=(SELECT puntosV FROM partidos WHERE id_partido=partido);
	IF(reslocal>resvisitante) THEN
		SET vencedor=(SELECT elocal FROM partidos WHERE id_partido=partido);
	ELSE
		SET vencedor=(SELECT evisit FROM partidos WHERE id_partido=partido);
	END IF;
	SELECT nombre AS Ganador
	FROM equipos
	WHERE id_equipo=vencedor;
END$$

DELIMITER ;

#-- Crea un procedimiento que muestre el nombre del equipo ganador de un partido. El procedimiento
#-- recibirá como parámetro el identificador del partido.
DROP PROCEDURE IF EXISTS gan;

DELIMITER $$

CREATE PROCEDURE gan(partido INT)
BEGIN
	IF(SELECT puntosL FROM partidos WHERE id_partido=partido)>(SELECT puntosV FROM partidos WHERE id_partido=partido) THEN
		SELECT E.nombre
		FROM equipos E, partidos P
		WHERE partido=P.id_partido AND E.id_equipo=elocal;
	ELSEIF (SELECT puntosL FROM partidos WHERE id_partido=partido)<(SELECT puntosV FROM partidos WHERE id_partido=partido) THEN
		SELECT E.nombre
		FROM equipos E, partidos P
		WHERE partido=P.id_partido AND E.id_equipo=evisit;
	ELSE
		SELECT "Partido empatado";
	END IF;
END$$

DELIMITER ;

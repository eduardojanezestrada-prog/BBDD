#-- Crea una función que indique el número de partidos que ha ganado un equipo. La función recibirá
#-- como parámetro el identificador del equipo.
DROP FUNCTION IF EXISTS PartidosGanados;

DELIMITER $$

CREATE FUNCTION PartidosGanados(equipo INT) RETURNS INT
BEGIN
	DECLARE contar, part INT;
	DECLARE ganador CHAR(50);
	SET contar=0;
	SET part=(SELECT id_partido FROM partidos WHERE id_partido>=ALL(SELECT id_partido FROM partidos));
	WHILE part>0 DO
		SET ganador=CALL gan(part);
		IF (ganador=(SELECT nombre FROM equipos WHERE id_equipo=equipo)) THEN
			SET contar=contar+1;
		END IF;
		 SET part=part-1;
	END WHILE
	RETURN contar;
END$$

DELIMITER ;

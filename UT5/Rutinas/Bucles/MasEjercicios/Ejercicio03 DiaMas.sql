DROP PROCEDURE IF EXISTS DiaMas;

DELIMITER $$

CREATE PROCEDURE DiaMas(dia INT, mes INT, anio INT)
BEGIN
	DECLARE diames INT;
	SET diames=31;
	IF(SELECT FechaCorrecta(dia,mes,anio)) THEN
		IF mes=2 THEN
			SET diames=28;
		ELSEIF mes IN (4,6,9,11) THEN
			SET diames=30;
		END IF;
		SET dia=dia+1;
		IF dia>diames THEN
			SET dia=1;
			SET mes=mes+1;
			IF mes>12 THEN
				SET mes=1;
				SET anio=anio+1;
				IF anio=0 THEN
					SET anio=1;
				END IF;
			END IF;
		END IF;
	END IF;
	SELECT CONCAT('Dia siguiente es: ',dia,'/',mes,'/',anio) AS 'Dia siguiente';
END$$

DELIMITER ;

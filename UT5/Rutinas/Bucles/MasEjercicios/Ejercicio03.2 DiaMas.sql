DROP PROCEDURE IF EXISTS DiaMasV2;

DELIMITER $$

CREATE PROCEDURE DiaMasV2(dia INT, mes INT, anio INT)
BEGIN
	DECLARE diames INT;
	
	IF(FechaCorrecta(dia,mes,anio)=0) THEN
		SELECT CONCAT(dia,'/', mes,'/',anio) AS "Fecha incorrecta";
	ELSE 
		#-- Damos a la variable diames un valor inicial de 31
		SET diames=31;
		
		#-- Cambiamos el valor de diames dependiendo del mes
		IF mes=2 THEN
			SET diames=28;
		ELSEIF mes IN (4,6,9,11) THEN
			SET diames=30;
		END IF;
		
		#-- Sumamos un dia y comprobamos que no se pase del limite
		SET dia=dia+1;
		IF dia>diames THEN
			SET dia=1;
			SET mes=mes+1;
		END IF;
		
		#-- Comprobamos si el mes no se haya pasado de 12
		IF mes>12 THEN
			SET mes=1;
			SET anio=anio+1;
		END IF;		
		
		#-- Comprobamos que el año no sea 0
		IF anio=0 THEN
			SET anio=1;
		END IF;
	END IF;
	#-- Mostramos la nueva Fecha
	SELECT CONCAT('Dia siguiente es: ',dia,'/',mes,'/',anio) AS 'Dia siguiente';
END$$

DELIMITER ;

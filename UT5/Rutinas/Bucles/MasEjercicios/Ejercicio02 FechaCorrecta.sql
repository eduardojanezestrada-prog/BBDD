DROP FUNCTION IF EXISTS FechaCorrecta;

DELIMITER $$

CREATE FUNCTION FechaCorrecta(dia INT, mes INT, anio INT) RETURNS BOOLEAN
BEGIN
	DECLARE diasmes INT;
	
	#-- Comprobamos el año
	IF anio=0 THEN
		RETURN FALSE;
	END IF;
	
	#-- Comprobamos el mes
	IF (mes>12 OR mes<1) THEN
		RETURN FALSE;
	END IF;
	
	#-- Creamos un limite de dias dependiendo del mes
	SET diasmes=31;
	IF mes=2 THEN
		SET diasmes=28;
	END IF;
	
	IF mes IN (4,6,9,11)THEN
		SET diasmes=30;
	END IF;
	
	#-- Comprobamos los dias 
	IF (dia<1 OR dia>diasmes) THEN
		RETURN FALSE;
	END IF;
	RETURN TRUE;
END$$

DELIMITER ;

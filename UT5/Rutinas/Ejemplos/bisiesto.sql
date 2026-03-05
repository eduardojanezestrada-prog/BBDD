#-- Un año es bisiesto si cumple los siguientes criterios
#-- Es divisible entre 4
#-- Si termina en 00, divisible por 400
DROP FUNCTION IF EXISTS bisiesto;

DELIMITER $$

CREATE FUNCTION bisiesto(anho INT) RETURNS BOOLEAN
BEGIN
	IF (anho%4)<>0 THEN
		RETURN FALSE;
	ELSE 
		IF (anho%100)=0 THEN
			IF (anho%400)=0 THEN
				RETURN TRUE;
			ELSE
				RETURN FALSE;
			END IF;
		ELSE 
			RETURN TRUE;
		END IF;
	END IF;
END$$

DELIMITER ;

#-- Función que recibe como parametro una fecha y devuelve el num dias
#-- que han transcurrido desde que empezó el año.
#-- Ejemplos: 1 de enero --> 5 dias
#-- 		  1 de febrero -- 32
#-- No tener en cuenta si el año es bisiesto.
DROP FUNCTION IF EXISTS totalDias;

DELIMITER $$

CREATE FUNCTION totalDias(fecha DATE) RETURNS INT
BEGIN
	DECLARE tot INT;
	SET tot=day(fecha);
	CASE month(fecha)
		WHEN 1 THEN SET tot=0+tot;
		WHEN 2 THEN SET tot=31+tot;
		WHEN 3 THEN SET tot=59+tot;
		WHEN 4 THEN SET tot=90+tot;
		WHEN 5 THEN SET tot=120+tot;
		WHEN 6 THEN SET tot=151+tot;
		WHEN 7 THEN SET tot=181+tot;
		WHEN 8 THEN SET tot=212+tot;
		WHEN 9 THEN SET tot=243+tot;
		WHEN 10 THEN SET tot=273+tot;
		WHEN 11 THEN SET tot=304+tot;
		WHEN 12 THEN SET tot=334+tot;
	END CASE;
	RETURN tot;
END$$

DELIMITER ;

DROP FUNCTION IF EXISTS totalDiasbi2;

DELIMITER $$

CREATE FUNCTION totalDiasbi2(fecha DATE) RETURNS INT
BEGIN
	DECLARE tot INT;
	SET tot=totalDias(fecha);
	IF(bisiesto(year(fecha)) AND month(fecha)>2) THEN
		SET tot=tot+1;
	END IF;
	RETURN tot;
END$$

DELIMITER ;

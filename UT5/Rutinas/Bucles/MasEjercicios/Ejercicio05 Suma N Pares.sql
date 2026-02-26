DROP PROCEDURE IF EXISTS SumaPares;

DELIMITER $$

CREATE PROCEDURE SumaPares(num INT)
BEGIN
	DECLARE suma INT;
	IF num>0 THEN
		SET suma=num*(num+1);
	ELSE
		SET suma=0;
	END IF;
	SELECT suma AS "Suma de los N primeros pares positivos";
END$$

DELIMITER ;
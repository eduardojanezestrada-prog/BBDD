#-- Procedimiento que indique si un número (de tipo entero) pasado como parámetro es positivo, negativo o cero.
DROP PROCEDURE IF EXISTS posNegCero;

DELIMITER $$

CREATE PROCEDURE posNegCero(num INT)
BEGIN
	IF (num>0) THEN
		SELECT CONCAT(num," es positivo") AS Numero;
	ELSEIF (num<0) THEN
		SELECT CONCAT(num," es negativo") AS Numero;
	ELSE
		SELECT "Cero" AS Numero;
	END IF;
END$$

DELIMITER ;

CALL posNegCero(5);

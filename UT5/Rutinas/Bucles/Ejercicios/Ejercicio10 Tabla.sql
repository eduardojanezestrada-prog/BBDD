DROP PROCEDURE IF EXISTS Tabla;

DELIMITER $$

CREATE PROCEDURE Tabla(num INT)
BEGIN
	DECLARE conta INT;
	SET conta=1;
	
	WHILE conta<=10 DO
		SELECT CONCAT(num, 'x', conta, '=', (num*conta)) AS 'Tabla';
		SET conta=conta+1;
	END WHILE;
END$$

DELIMITER ;

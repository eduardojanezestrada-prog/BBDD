DROP PROCEDURE IF EXISTS ContarDesc;

DELIMITER $$

CREATE PROCEDURE ContarDesc(num INT)
BEGIN
	WHILE (num>0) DO
		SELECT num AS 'Cuenta descendente';
		SET num=num-1;
	END WHILE;
END$$

DELIMITER ;

CALL ContarDesc(12);

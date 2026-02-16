DROP PROCEDURE IF EXISTS ContarDescR;

DELIMITER $$

CREATE PROCEDURE ContarDescR(num INT)
BEGIN
	REPEAT
		SELECT num AS 'Cuenta descendente';
		SET num=num-1;
	UNTIL num<=0
	END REPEAT;
END$$

DELIMITER ;

CALL ContarDescR(12);

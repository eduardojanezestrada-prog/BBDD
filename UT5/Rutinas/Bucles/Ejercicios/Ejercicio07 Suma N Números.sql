DROP PROCEDURE IF EXISTS SumaN;

DELIMITER $$

CREATE PROCEDURE SumaN(num INT)
BEGIN
	DECLARE conta INT;
	DECLARE tot INT;
	SET conta=1;
	SET tot=0;
	WHILE conta<=num DO
		SET tot=tot+conta;
		SET conta=conta+1;
	END WHILE;
	SELECT tot;
END$$

DELIMITER ;

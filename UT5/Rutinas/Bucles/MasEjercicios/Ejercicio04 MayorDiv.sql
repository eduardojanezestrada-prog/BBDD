DROP FUNCTION IF EXISTS MayorDiv;

DELIMITER $$

CREATE FUNCTION MayorDiv(num INT) RETURNS INT
BEGIN
	DECLARE divi, conta INT;
	SET conta=2;
	SET divi=1;
	
	IF num<=1 THEN
		RETURN divi;
	END IF;
	
	WHILE (conta<=(num/2)) DO
		IF mod(num, conta)=0 THEN
			SET divi=conta;
		END IF;
		SET conta=conta+1;
	END WHILE;
	
	RETURN divi;
END$$

DELIMITER ;

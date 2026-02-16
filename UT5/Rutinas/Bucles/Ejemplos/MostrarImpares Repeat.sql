DROP PROCEDURE IF EXISTS MostrarimparesR;

DELIMITER $$

CREATE PROCEDURE MostrarimparesR()
BEGIN
	DECLARE num INT;
	SET num=0;
	REPEAT
		SET num=num+1;
		IF MOD(num,2)<>0 THEN
			SELECT num AS 'Numeros impares';
		END IF;
	UNTIL num>=10
	END REPEAT;
END$$

DELIMITER ;

CALL MostrarimparesR();

DROP PROCEDURE IF EXISTS MostrarimparesW;

DELIMITER $$

CREATE PROCEDURE MostrarimparesW()
BEGIN
	DECLARE num INT;
	SET num=0;
	WHILE num<11 DO
		IF MOD(num,2)<>0 THEN
			SELECT num AS 'Numeros impares';
		END IF;
		SET num=num+1;
	END WHILE;
END$$

DELIMITER ;

CALL MostrarimparesW();

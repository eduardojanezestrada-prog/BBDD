DROP PROCEDURE IF EXISTS PrimoSuma;

DELIMITER $$

CREATE PROCEDURE PrimoSuma(limite INT)
BEGIN
	DECLARE conta, c, tot INT;
	SET c=0;
	SET conta=1;
	SET tot=0;
	
	WHILE c<limite DO
		SET conta=conta+1;
		IF((SELECT Primo(conta))=1) THEN
			SET tot=tot+conta;
			SET c=c+1;
		END IF;
	END WHILE;
	SELECT tot;
END$$

DELIMITER ;

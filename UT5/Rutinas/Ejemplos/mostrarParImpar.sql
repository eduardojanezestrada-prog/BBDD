DELIMITER $$

DROP PROCEDURE IF EXISTS mostrarParImpar $$ 

CREATE PROCEDURE mostrarParImpar(IN num INT)
BEGIN
	IF (esPar(num)) THEN
		SELECT CONCAT(num, " es par") AS "Par/Impar";
	ELSE
		SELECT CONCAT(num, " es impar") AS "Par/Impar";
	END IF;
END $$

DELIMITER ;

 CALL mostrarParImpar(5);
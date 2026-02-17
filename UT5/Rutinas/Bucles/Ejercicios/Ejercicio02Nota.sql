DROP PROCEDURE IF EXISTS Nota;

DELIMITER $$

CREATE PROCEDURE Nota(num FLOAT)
BEGIN
	IF (num>=0 AND num<5) THEN 
		SELECT "Insuficiente" AS Nota;
	ELSEIF (num>=5 AND num<6) THEN
		SELECT "Suficiente" AS Nota;
	ELSEIF (num>=6 AND num<7) THEN
		SELECT "Bien" AS Nota;
	ELSEIF (num>=7 AND num<9) THEN
		SELECT "Notable" AS Nota;
	ELSEIF (num>=9 AND num<=10) THEN
		SELECT "Sobresaliente" AS Nota;
	ELSE
		SELECT "Nota no valida" AS Nota;
	END IF;
END$$

DELIMITER ;

CALL Nota(8.5);

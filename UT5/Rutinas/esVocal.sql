DROP PROCEDURE IF EXISTS esVocal;

DELIMITER $$

CREATE PROCEDURE esVocal(letra CHAR)
BEGIN
	IF (UPPER(letra)='A' OR UPPER(letra)='E' OR UPPER(letra)='I' OR UPPER(letra)='O' OR UPPER(letra)='U') THEN
		SELECT CONCAT(letra, " es una vocal") "AS Esvocal";
	ELSE
		SELECT CONCAT(letra, " NO es una vocal") "AS Esvocal";
	END IF;
END $$

DELIMITER ;

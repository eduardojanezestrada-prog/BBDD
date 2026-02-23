DROP PROCEDURE IF EXISTS FechaHoy;

DELIMITER $$

CREATE PROCEDURE FechaHoy()
BEGIN
	DECLARE fecha CHAR(100);
	CASE month(NOW())
		WHEN 1 THEN SET fecha='Enero';
		WHEN 2 THEN SET fecha='Febrero';
		WHEN 3 THEN SET fecha='Marzo';
		WHEN 4 THEN SET fecha='Abril';
		WHEN 5 THEN SET fecha='Mayo';
		WHEN 6 THEN SET fecha='Junio';
		WHEN 7 THEN SET fecha='Jullio';
		WHEN 8 THEN SET fecha='Agosto';
		WHEN 9 THEN SET fecha='Septiembre';
		WHEN 10 THEN SET fecha='Octubre';
		WHEN 11 THEN SET fecha='Noviembre';
		WHEN 12 THEN SET fecha='Diciembre';
	END CASE;
	SELECT CONCAT(day(NOW()),' de ',fecha,' de ',year(NOW())) AS 'fecha ACTUAL';
END$$

DELIMITER ;

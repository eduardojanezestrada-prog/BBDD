DROP FUNCTION IF EXISTS DiaSemana;

DELIMITER $$

CREATE FUNCTION DiaSemana(num INT) RETURNS VARCHAR(100)
BEGIN
	DECLARE dia VARCHAR(100);
	CASE num
		WHEN 1 THEN SET dia='Lunes';
		WHEN 2 THEN SET dia='Martes';
		WHEN 3 THEN SET dia='Miercoles';
		WHEN 4 THEN SET dia='Jueves';
		WHEN 5 THEN SET dia='Viernes';
		WHEN 6 THEN SET dia='Sabado';
		WHEN 7 THEN SET dia='Domingo';
		ELSE SET dia='No es un dia valido';
	END CASE;
	RETURN dia;
END$$

DELIMITER ;

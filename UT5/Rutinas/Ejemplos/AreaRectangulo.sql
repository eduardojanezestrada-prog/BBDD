#-- Función que calcula el area de un rectangulo
#-- Aréa=a*b
DROP FUNCTION IF EXISTS AreaRectangulo;

DELIMITER $$

CREATE FUNCTION AreaRectangulo(a INT, b INT) RETURNS INT
BEGIN
	DECLARE area INT;
	SET area=a*b;
	RETURN area;
END $$

DELIMITER ;

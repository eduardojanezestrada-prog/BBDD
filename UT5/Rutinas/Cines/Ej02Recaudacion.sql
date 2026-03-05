#-- Implementa una función que devuelva la recaudacion total de una película sumando el precio de todas
#-- sus entradas. Parámetro: identificador de la película.

DROP FUNCTION IF EXISTS recaudacion;

DELIMITER $$

CREATE FUNCTION recaudacion(peli INT) RETURNS DECIMAL(5,2)
BEGIN
	DECLARE tot DECIMAL(6,2);
	SET tot=(SELECT SUM(precio) FROM entradas WHERE idPelicula=peli);
	RETURN IFNULL(tot, 0);
END$$

DELIMITER ;

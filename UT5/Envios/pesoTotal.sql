#-- Función que determine el peso total de un envio
#-- La función recibira como parametros el código del proveedor
#-- y el código de la pieza de la que realiza el envio

DROP FUNCTION IF EXISTS pesoTotal;

DELIMITER $$

CREATE FUNCTION pesoTotal(pro VARCHAR(4), pie VARCHAR(4)) RETURNS INT
BEGIN
	DECLARE canti, pes INT;
	
	#-- Obtenemos la cantidad de piezas enviadas por el proveedor
	SET canti=(SELECT cant FROM SP WHERE sn=pro AND pn=pie);
	
	#-- Obtenemos el peso de la pieza del envio
	SET pes=(SELECT peso FROM P WHERE pn=pie);
	
	RETURN IFNULL(canti*pes, 0);
END$$

DELIMITER ;

#-- Llamadas a la función
SELECT pesoTotal("S1","P1");
SELECT pesoTotal("S1","P2");

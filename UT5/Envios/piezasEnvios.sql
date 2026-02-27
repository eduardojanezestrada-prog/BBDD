#-- Procedimiento que muestre el nombre de las piezas que ha enviado un proveedor
#-- El Procedimiento recibirá como parametro el código del proveedor

DROP PROCEDURE IF EXISTS piezasEnvio;

DELIMITER $$

CREATE PROCEDURE piezasEnvio(IN pro VARCHAR(4))
BEGIN
	SELECT pnombre AS Pieza, cant AS Unidades
	FROM SP JOIN P ON SP.pn=P.pn
	WHERE pro=sn;
END$$

DELIMITER ;


#-- Llamadas al Procedimiento
CALL piezasEnvio('S1');
CALL piezasEnvio('S2');
CALL piezasEnvio('S3');
CALL piezasEnvio('S4');
CALL piezasEnvio('S5');
CALL piezasEnvio('S6');

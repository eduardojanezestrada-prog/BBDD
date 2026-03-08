#-- Procedimiento que muestre la siguiente información sobre los envíos realizados por un proveedor:
#-- • Nombre del proveedor
#-- • Número de envíos (cuántas filas tiene en SP)
#-- • Total de unidades enviadas.
#-- El procedimiento recibirá como parámetro el código del proveedor. En caso de que no exista, mostrará un
#-- mensaje indicándolo. .
DROP PROCEDURE IF EXISTS totalEnviosProveedor;

DELIMITER $$

CREATE PROCEDURE totalEnviosProveedor(proveedor VARCHAR(4))
BEGIN
	DECLARE existe INT;
	DECLARE numEnvios INT;
	
	SET existe=(SELECT COUNT(*) FROM S WHERE sn=proveedor);
	
	IF existe=0 THEN
		SELECT CONCAT('Error: proveedor ',proveedor,' inexistente') AS Mensaje;
	ELSE
		SET numEnvios=(SELECT COUNT(*) FROM SP WHERE sn=proveedor);
		
		SELECT snombre AS Proveedor, numEnvios AS "Número de envíos",
		unidadesProveedor(proveedor) AS "Total unidades"
		FROM S
		WHERE sn=provEedor;
	END IF;
END$$

DELIMITER ;

CALL totalEnviosProveedor('S5');

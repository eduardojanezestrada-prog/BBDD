#-- Procedimiento para inserter un nuevo envío con validación. Antes de insertar un nuevo envío (sn, pn,
#-- cant), debe comprobar que:
#-- a) Existe el proveedor en la tabla S.
#-- b) Existe la pieza en la tabla P.
#-- c) No existe ya el par (sn,pn) en la tabla SP.
#-- d) cant > 0.
DROP PROCEDURE IF EXISTS insertarEnvio;

DELIMITER $$

CREATE PROCEDURE insertarEnvio(codprov VARCHAR(4), codpie VARCHAR(4), cantidad INT)
BEGIN
	DECLARE existepro, existepie, existenvio INT;
	
	SET existepro=(SELECT COUNT(*) FROM S WHERE sn=codprov);
	SET existepie=(SELECT COUNT(*) FROM P WHERE pn=codpie);
	SET existenvio=(SELECT COUNT(*) FROM SP WHERE sn=codprov AND pn=codpie);
	
	IF cantidad<=0 OR cantidad IS NULL THEN
		SELECT 'La cantidad del envio no puede ser 0 o menor.';
	ELSE
		IF existepro=0 THEN
			SELECT CONCAT('El proveedor ',codprov,' no existe en nuestra base de datos.') AS Mensaje;
		ELSEIF existepie=0 THEN
			SELECT CONCAT('La pieza ',codpie,' no existe en nuestra base de datos.') AS Mensaje;
		ELSEIF existenvio>0 THEN 
			SELECT CONCAT('El proveedor ',codprov,' ya ha hecho un envio de la pieza ',codpie,'.') AS Mensaje;
		ELSE
			INSERT INTO SP VALUES(codprov, codpie, cantidad);
			SELECT 'Envio insertado correctamente' AS Mensaje;
		END IF;
	END IF;
END$$

DELIMITER ;

CALL insertarEnvio ("S2","P4",150);
CALL insertarEnvio ("S1","P1",250);
CALL insertarEnvio ("S1","P99",350);
CALL insertarEnvio ("S99","P1",450);
CALL insertarEnvio ("S3","P3",0);

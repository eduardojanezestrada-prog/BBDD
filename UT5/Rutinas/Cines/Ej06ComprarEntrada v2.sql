#-- Implementa un procedimiento para comprar una entrada. El procedimiento debe verificar si existen el
#-- cliente y la película, verificar si el cliente es apto por edad minima y, si todo está correcto, insertará un
#-- nuevo registro en la table Entradas. Si no, muestra el motivo y no inserta. Parámetros: identificador del
#-- cliente, identificador de la película, fecha y precio de compra de la entrada.

DROP PROCEDURE IF EXISTS ComprarEntradav2;

DELIMITER $$

CREATE PROCEDURE ComprarEntradav2(clie INT, peli INT, dia DATE, costo DECIMAL(5,2))
BEGIN
	#-- Decalaramos variables
	DECLARE existeClie, existePeli INT;
	
	#-- Inicializamos las variables
	SET existeClie=(SELECT COUNT(*) FROM clientes WHERE idCliente=clie);
	SET existePeli=(SELECT COUNT(*) FROM peliculas WHERE idPelicula=peli);
	
	#-- Hacemos las comprobaciones
	IF existeClie=0 THEN
		SELECT "ERROR: Cliente inexistente" AS Mensaje;
	ELSEIF existePeli=0 THEN
		SELECT "ERROR: Película inexistente" AS Mensaje;
	ELSEIF EdadMin(cliE, peli)=0 THEN
		SELECT "ERROR: El cliente no cumple la edad mínima" AS Mensaje;
		
	#-- Si todo va bien insertamos la entrada y mostramos Mensaje
	ELSE
		INSERT INTO entradas VALUES (0, clie, peli, dia, costo);
		SELECT "OK: Entrada registrada correctamente" AS Mensaje;
	END IF;
END$$

DELIMITER ;

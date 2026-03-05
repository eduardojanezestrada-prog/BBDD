#-- Implementa un procedimiento para comprar una entrada. El procedimiento debe verificar si existen el
#-- cliente y la película, verificar si el cliente es apto por edad minima y, si todo está correcto, insertará un
#-- nuevo registro en la table Entradas. Si no, muestra el motivo y no inserta. Parámetros: identificador del
#-- cliente, identificador de la película, fecha y precio de compra de la entrada.

DROP PROCEDURE IF EXISTS ComprarEntrada;

DELIMITER $$

CREATE PROCEDURE ComprarEntrada(clie INT, peli INT, dia DATE, costo DECIMAL(5,2))
BEGIN
	#-- Comprobamos que el cliente exista en la base de datos
	IF (clie <>ALL(SELECT idCliente FROM clientes)) THEN
		SELECT "ERROR: Cliente inexistente" AS Mensaje;
	#-- Comprobamos que exista la peli
	ELSEIF (peli <>ALL(SELECT idPelicula FROM peliculas)) THEN
		SELECT "ERROR: Película inexistente" AS Mensaje;
	#-- Comprobamos la edad del cliente
	ELSEIF (SELECT EdadMin(cliE, peli))=0 THEN
		SELECT "ERROR: El cliente no cumple la edad mínima" AS Mensaje;
	#-- Si todo va bien insertamos la entrada y mostramos Mensaje
	ELSE
		INSERT INTO entradas VALUES (0, clie, peli, dia, costo);
		SELECT "OK: Entrada registrada correctamente" AS Mensaje;
	END IF;
END$$

DELIMITER ;

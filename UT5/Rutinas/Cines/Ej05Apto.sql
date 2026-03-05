#-- Similar a la anterior, pero con una función. La function devolvera 1 si la edad del cliente es mayor o igual
#-- a la edad minima recomendada de la película, y 0 en caso contrario. Si el cliente o la película no existen,
#-- devuelve 0. Parámetros: identificador del cliente e identificador de la película.
DROP FUNCTION IF EXISTS EdadMin;

DELIMITER $$

CREATE FUNCTION EdadMin(cli INT, peli INT) RETURNS BOOLEAN
BEGIN
	#-- Declaración de varibales
	DECLARE ecli, emin INT;
	
	#-- Inicialización de varibales
	SET ecli=(SELECT edad FROM clientes WHERE cli=idCliente);
	SET emin=(SELECT edadMinima FROM peliculas WHERE peli=idPelicula);
	
	#-- Control de errores
	IF ecli IS NULL OR emin IS NULL THEN
		RETURN FALSE;
	END IF;
	
	#-- Hacemos la comprobación y el RETURN
	IF (ecli>=emin) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END$$

DELIMITER ;

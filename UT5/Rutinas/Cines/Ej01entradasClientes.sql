#-- Crea un procedimiento para mostrar las películas que ha visto un cliente (sus entradas), con fecha y
#-- precio. Parámetro: identificador del cliente.

DROP PROCEDURE IF EXISTS entradasClientes;

DELIMITER $$
CREATE PROCEDURE entradasClientes(cli INT)
BEGIN
	SELECT C.nombre, P.titulo, E.fecha, E.precio
	FROM clientes C JOIN entradas E ON C.idCliente=E.idCliente JOIN peliculas P ON P.idPelicula=E.idPelicula
	WHERE C.idCliente=cli
	ORDER BY E.fecha;
END$$

DELIMITER ;

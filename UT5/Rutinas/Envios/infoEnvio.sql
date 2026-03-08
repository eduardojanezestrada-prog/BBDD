#-- Procedimiento que muestra la siguient información sobre un envio:
#-- 1) Nombre del proveedor
#-- 2) Nombre de la pieza
#-- 3) Peso total del envio

DROP PROCEDURE IF EXISTS infoEnvio;

DELIMITER $$

CREATE PROCEDURE infoEnvio(pro VARCHAR(4), pie VARCHAR(4))
BEGIN
	SELECT snombre AS Proveedor, pnombre AS Pieza, pesoTotal(pro, pie) AS "Peso total"
	FROM S JOIN SP ON S.sn=SP.sn JOIN P ON SP.pn=P.pn
	WHERE SP.sn=pro AND SP.pn=pie;
END$$

DELIMITER ;

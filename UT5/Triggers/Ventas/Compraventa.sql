DROP DATABASE IF EXISTS CompraVenta;
CREATE DATABASE CompraVenta;
USE CompraVenta;

CREATE TABLE Producto(
codPro VARCHAR(4) PRIMARY KEY,
Nombre VARCHAR(15) NOT NULL,
descripcion VARCHAR(40)
);

CREATE TABLE Compra(
codPro VARCHAR(4),
fecha DATE,
cant INT NOT NULL,
coste FLOAT NOT NULL,
PRIMARY KEY (codPro,fecha),
FOREIGN KEY (codPro) REFERENCES Producto(codPro)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Venta(
codPro VARCHAR(4),
fecha DATE,
cant INT NOT NULL,
pvp FLOAT NOT NULL,
PRIMARY KEY (codPro,fecha),
FOREIGN KEY (codPro) REFERENCES Producto(codPro)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

#-- Introdución de datos
INSERT INTO Producto VALUES
('M01','Mesa ARCADE','Mesea madera rectangular'),
('M02','Mesa CIRCLE','Mesea madera circular'),
('S01','Silla AHIGH','Mesea resplado alto'),
('S02','Silla LOW','Mesea respaldo bajo');

#-- Declamos variables
SET @stock=0;
SET @maxVenta=0;

#-- Actualizamos stock
CREATE TRIGGER realizar_compra
AFTER INSERT ON Compra
FOR EACH ROW
SET @stock=@stock+NEW.cant;

INSERT INTO Compra VALUES('M01', NOW(), 15, 115.75);
SELECT @stock;

#-- Variable maxVenta: máximo de importe de todas las ventas
DELIMITER $$

CREATE TRIGGER realizar_venta
AFTER INSERT ON Venta
FOR EACH ROW
BEGIN
SET @stock=@stock-NEW.cant;
IF @maxVenta<NEW.pvp*NEW.cant THEN
	SET @maxVenta=NEW.pvp*NEW.cant;
END IF;
END$$

DELIMITER ;

SELECT @maxVenta;

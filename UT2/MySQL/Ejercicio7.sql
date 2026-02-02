/* Creamos la base de datos */
DROP DATABASE IF EXISTS Banco;
CREATE DATABASE Banco;
USE Banco;

/* Creamos la tabla clientes */
CREATE TABLE clientes (
nombre 			VARCHAR(20) 		NOT NULL,
dni 			VARCHAR(10),
apellidos 		VARCHAR(50) 		NOT NULL,
direccion 		VARCHAR(50) 		NOT NULL,
email 			VARCHAR(20) 		NOT NULL,
PRIMARY KEY(dni),
UNIQUE(email)
);

/* Cromprobamos que se haya creado bien */
SHOW TABLES;
DESCRIBE clientes;

/* Creamos la tabla cuentas */
CREATE TABLE cuentas (
numero 			VARCHAR(25),
saldo 			FLOAT 				NOT NULL,
ulti_mov 		DATE 				NOT NULL,
fech_crea 		DATE 				NOT NULL,
PRIMARY KEY(numero)
);

/* Cromprobamos que se haya creado bien */
SHOW TABLES;
DESCRIBE cuentas;

/* Creamos la tabla creditos */
CREATE TABLE creditos (
idcredito 		VARCHAR(20),
cliente 		VARCHAR(10) 		NOT NULL,
fech_conce 		DATE 				NOT NULL,
cantidad 		FLOAT 				NOT NULL,
interes 		FLOAT 				NOT NULL,
plazos 			INTEGER 			NOT NULL,
amortizacion 	FLOAT 				NOT NULL,
PRIMARY KEY(idcredito),
FOREIGN KEY(cliente) REFERENCES clientes(dni)
		ON UPDATE CASCADE
);

/* Cromprobamos que se haya creado bien */
SHOW TABLES;
DESCRIBE creditos;

/* Creamos la tabla cliente_cuenta */
CREATE TABLE cliente_cuenta (
idcuenta 		VARCHAR(25),
idcliente 		VARCHAR(10),
PRIMARY KEY(idcuenta, idcliente),
FOREIGN KEY(idcuenta) REFERENCES cuentas(numero)
		ON UPDATE CASCADE,
FOREIGN KEY(idcliente) REFERENCES clientes(dni)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/* Cromprobamos que se haya creado bien */
SHOW TABLES;
DESCRIBE cliente_cuenta;

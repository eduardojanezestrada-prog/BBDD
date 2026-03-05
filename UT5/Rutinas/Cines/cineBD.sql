-- =========================================================
-- BD CINE | MySQL 
-- =========================================================

DROP DATABASE IF EXISTS cine;
CREATE DATABASE cine;
USE cine;

-- ---------------------------------------------------------
-- TABLAS: peliculas, clientes, entradas
-- ---------------------------------------------------------
DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
  idPelicula   INT AUTO_INCREMENT,
  titulo       VARCHAR(80) NOT NULL,
  genero       VARCHAR(30) NOT NULL,
  duracion     INT NOT NULL,
  edadMinima   INT NOT NULL,
  PRIMARY KEY(idPelicula),
  CHECK (duracion > 0),
  CHECK (edadMinima >= 0)
);


DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
  idCliente INT AUTO_INCREMENT,
  nombre    VARCHAR(60) NOT NULL,
  edad      INT NOT NULL,
  ciudad    VARCHAR(40) NOT NULL,
  PRIMARY KEY(idCliente),
  CHECK (edad >= 0)
);

DROP TABLE IF EXISTS entradas;

CREATE TABLE entradas (
  idEntrada  INT AUTO_INCREMENT,
  idCliente  INT NOT NULL,
  idPelicula INT NOT NULL,
  fecha      DATE NOT NULL,
  precio     DECIMAL(5,2) NOT NULL,
  PRIMARY KEY(idEntrada),
  CHECK (precio >= 0),
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (idPelicula) REFERENCES peliculas(idPelicula)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- ---------------------------------------------------------
-- DATOS DE EJEMPLO
-- ---------------------------------------------------------
INSERT INTO peliculas (titulo, genero, duracion, edadMinima) VALUES
('Spider-Man: No Way Home', 'Acción', 148, 12),
('Barbie', 'Comedia', 114, 7),
('Oppenheimer', 'Drama', 180, 16),
('Avatar: El camino del agua', 'Ciencia ficción', 166, 12),
('Inside Out', 'Animación', 102, 0),
('Joker', 'Thriller', 122, 18);

INSERT INTO clientes (nombre, edad, ciudad) VALUES
('Ana', 19, 'Murcia'),
('Carlos', 16, 'Alguazas'),
('Lucía', 13, 'Molina de Segura'),
('Jorge', 22, 'Murcia'),
('Elena', 9, 'Ceutí'),
('Sergio', 17, 'Archena');

INSERT INTO entradas (idCliente, idPelicula, fecha, precio) VALUES
(1, 1, '2026-02-28', 8.50),  -- Ana -> Spider-Man
(1, 2, '2026-03-04', 7.00),  -- Ana -> Barbie
(2, 3, '2026-02-28', 8.00),  -- Carlos -> Oppenheimer
(2, 2, '2026-03-04', 7.00),  -- Carlos -> Barbie
(3, 4, '2026-03-06', 7.50),  -- Lucía -> Avatar
(3, 5, '2026-03-01', 6.50),  -- Lucía -> Inside Out
(4, 1, '2026-02-27', 8.50),  -- Jorge -> Spider-Man
(4, 3, '2026-02-28', 8.50),  -- Jorge -> Oppenheimer
(5, 5, '2026-03-01', 6.00),  -- Elena -> Inside Out
(6, 4, '2026-03-06', 8.00),  -- Sergio -> Avatar
(6, 1, '2026-03-05', 7.50);  -- Sergio -> Spider-Man

-- ---------------------------------------------------------
-- COMPROBACIONES (para verificar que todo está OK)
-- ---------------------------------------------------------
SELECT * FROM peliculas;
SELECT * FROM clientes;
SELECT * FROM entradas;

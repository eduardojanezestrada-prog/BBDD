DROP DATABASE IF EXISTS Rutinas;
CREATE DATABASE Rutinas;
USE Rutinas;

#-- PROCEDURE
DROP PROCEDURE holaMundo();

DELIMITER $$

BEGIN
CREATE PROCEDURE holaMundo()
SELECT 'holaMundo' AS "Mi primera rutina";
SELECT "1º DAW" AS "Mi curso";
END $$

DELIMITER ;

CALL holaMundo;
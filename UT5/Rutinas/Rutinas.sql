DROP DATABASE IF EXISTS Rutinas;
CREATE DATABASE Rutinas;
USE Rutinas;

#-- PROCEDURE
DROP PROCEDURE IF EXISTS holaMundo();

DELIMITER $$
CREATE PROCEDURE holaMundo()

BEGIN
	SELECT 'holaMundo' AS "Mi primera rutina";
	SELECT "1º DAW" AS "Mi curso";
END $$

DELIMITER ;

CALL holaMundo;

DROP PROCEDURE IF EXISTS fecha2;

CREATE PROCEDURE fecha2(IN f DATE)
SELECT CONCAT("Día: ", day(f), "\n", " Mes: ", month(f), "\n", " Año: ", year(f));

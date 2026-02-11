DROP PROCEDURE IF EXISTS fecha3;

CREATE PROCEDURE fecha3(IN f DATE)
SELECT CONCAT(day(f), "/", month(f), "/", year(f));

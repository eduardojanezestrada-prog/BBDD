DROP PROCEDURE IF EXISTS incrementa;

CREATE PROCEDURE incrementa(INOUT num INT)
SET num=num+1;


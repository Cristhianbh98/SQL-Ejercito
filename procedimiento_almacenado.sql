/*Realizar un procedimiento almacenado que retorne los nombres de los integrantes de una brigrada ingresada*/

DELIMITER //

CREATE PROCEDURE integrantes_brigadas(IN s_batallon VARCHAR(20))

BEGIN
    DECLARE id INT;
    DECLARE batallon CURSOR FOR SELECT `BATALLON_ID` FROM `batallon` WHERE `BATALLON_ALIAS` = s_batallon;

    OPEN batallon;

    FETCH batallon INTO id;

    SELECT CONCAT(`SOLDADO_NOMBRE`,' ',`SOLDADO_APELLIDO`) AS SOLDADO FROM `soldado` WHERE `BATALLON_ID` = id;

    CLOSE batallon;

END; //


DELIMITER ;
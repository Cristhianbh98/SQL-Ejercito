/*Realizar un cursor que me permita saber las brigadas que han sido castigadas por calificación regular*/

DELIMITER //

CREATE PROCEDURE cursor_brigadas()
BEGIN
    
    DECLARE counter BIGINT DEFAULT 0;
    DECLARE total_calificaciones BIGINT DEFAULT 0;
    DECLARE calificaciones CURSOR FOR SELECT count(*) FROM ejercito.`entrenamiento` WHERE entrenamiento.`CALIFICACION_ID` = 1;

    OPEN calificaciones;


    read_loop: LOOP

        FETCH calificaciones INTO total_calificaciones;

        IF counter>total_calificaciones THEN
            LEAVE read_loop;
        END IF;

        SELECT total_calificaciones;
        SET counter=counter+1;

    END LOOP;

    CLOSE calificaciones;

END; //

DELIMITER ;
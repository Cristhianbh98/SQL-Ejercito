/*Realizar un cursor que me permita saber las brigadas que han sido castigadas por calificación regular*/

DELIMITER //

CREATE PROCEDURE cursor_brigadas()

BEGIN
    declare done int default 0;
    DECLARE batallon VARCHAR(20);
    DECLARE batallones CURSOR FOR SELECT `BATALLON_ALIAS` FROM `entrenamiento`,`BATALLON` WHERE entrenamiento.`CALIFICACION_ID` = 1 AND BATALLON.`BATALLON_ID` = entrenamiento.`BATALLON_ID` GROUP BY BATALLON.`BATALLON_ID`;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN batallones;

    simple_loop: LOOP

        FETCH batallones INTO batallon;
        IF done THEN
            LEAVE simple_loop;
        END IF;

        select batallon;

    END LOOP simple_loop;

    CLOSE batallones;
    
END; //

DELIMITER ;
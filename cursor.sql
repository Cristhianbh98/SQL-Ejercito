/*Realizar un cursor que me permita saber las brigadas que han sido castigadas por calificación regular, cuántas veces han sido castigadas y el total de brigadas castigadas*/

DELIMITER //

CREATE PROCEDURE cursor_brigadas()

BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE count BIGINT DEFAULT 0;
    DECLARE batallon VARCHAR(20);
    DECLARE veces INT;
    DECLARE batallones CURSOR FOR SELECT `BATALLON_ALIAS` AS BATALLON, COUNT(*) AS VECES_CASTIGADAS FROM `entrenamiento`,`BATALLON` WHERE entrenamiento.`CALIFICACION_ID` = 1 AND BATALLON.`BATALLON_ID` = entrenamiento.`BATALLON_ID` GROUP BY BATALLON.`BATALLON_ID`;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN batallones;

    simple_loop: LOOP

        FETCH batallones INTO batallon, veces;

        IF done THEN
            LEAVE simple_loop;
        END IF;

        SELECT batallon AS NOMBRE_BATALLON, veces AS VECES_CASTIGADAS;
        SET count=count+1;

    END LOOP simple_loop;

    SELECT count AS TOTAL_BRIGADAS;

    CLOSE batallones;
    
END; //

DELIMITER ;
/*TABLA CASTIGO*/

CREATE TABLE CASTIGO
(
	CASTIGO_ID serial PRIMARY KEY,
	CASTIGO_F_INCIDENTE date,
	CASTIGO_F_INICIO date,
	CASTIGO_F_TERMINO date,
	CASTIGO_MOTIVO varchar(60),
	SANCIONADO_ID BIGINT UNSIGNED NOT NULL,
	SANCIONADOR_ID BIGINT UNSIGNED NOT NULL,
	CONSTRAINT CASTIGO_SANCIONADO_FK FOREIGN KEY (SANCIONADO_ID) REFERENCES SOLDADO (SOLDADO_ID) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CASTIGO_SANCIONADOR_FK FOREIGN KEY (SANCIONADOR_ID) REFERENCES SOLDADO (SOLDADO_ID) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

/*Insertar Datos Castigo*/

INSERT INTO CASTIGO (CASTIGO_F_INCIDENTE,CASTIGO_F_INICIO,CASTIGO_F_TERMINO,CASTIGO_MOTIVO,SANCIONADO_ID,SANCIONADOR_ID)
VALUES ('2018-05-20','2018-05-21','2018-05-24','CASO OMISO AL COMANDO DE MANDOS',4,1);

INSERT INTO CASTIGO (CASTIGO_F_INCIDENTE,CASTIGO_F_INICIO,CASTIGO_F_TERMINO,CASTIGO_MOTIVO,SANCIONADO_ID,SANCIONADOR_ID)
VALUES ('2004-03-19','2004-04-05','2004-04-05','IZA DE LA BANDERA IRRESPETUOSA',10,1);

INSERT INTO CASTIGO (CASTIGO_F_INCIDENTE,CASTIGO_F_INICIO,CASTIGO_F_TERMINO,CASTIGO_MOTIVO,SANCIONADO_ID,SANCIONADOR_ID)
VALUES ('2012-05-20','2012-06-05','2012-06-10','FALTA DE RESPETO A SUPERIOR',24,13);

INSERT INTO CASTIGO (CASTIGO_F_INCIDENTE,CASTIGO_F_INICIO,CASTIGO_F_TERMINO,CASTIGO_MOTIVO,SANCIONADO_ID,SANCIONADOR_ID)
VALUES ('2006-12-01','2007-01-28','2007-01-30','LLEGAR TARDE A FORMACIÓN',14,1);

INSERT INTO CASTIGO (CASTIGO_F_INCIDENTE,CASTIGO_F_INICIO,CASTIGO_F_TERMINO,CASTIGO_MOTIVO,SANCIONADO_ID,SANCIONADOR_ID)
VALUES ('2008-07-05','2008-07-10','2008-07-15','CUIDADO INDEBIDO DEL FUSIL',17,1);

INSERT INTO CASTIGO (CASTIGO_F_INCIDENTE,CASTIGO_F_INICIO,CASTIGO_F_TERMINO,CASTIGO_MOTIVO,SANCIONADO_ID,SANCIONADOR_ID)
VALUES ('1990-03-19','1990-04-05','1990-04-06','CUIDADO INDEBIDO DEL UNIFORME',21,1);
/*==========CONSULTAS==========*/

/*CONSULTAR LOS ASPIRANTES A ASCENSO QUE FUERON ENCONTRADOS CON TATUAJES*/


SELECT
	CONCAT(SOLDADO.SOLDADO_NOMBRE,' ',SOLDADO.SOLDADO_APELLIDO) AS SOLDADO,
	PETICION_ASCENSO.PETICION_ASCENSO_N_T_ENCONTRADOS AS TATUAJES,
	RANGO.RANGO_ANTERIOR AS RANGO_ACTUAL,
	RANGO.RANGO_NOMBRE AS RANGO_ASCENDER
	
FROM
	PETICION_ASCENSO
	INNER JOIN SOLDADO ON PETICION_ASCENSO.ASPIRANTE_ID = SOLDADO.SOLDADO_ID
	INNER JOIN RANGO ON PETICION_ASCENSO.RANGO_ASCENDER_ID = RANGO.RANGO_ID
WHERE
	PETICION_ASCENSO.PETICION_ASCENSO_N_T_ENCONTRADOS > 0
ORDER BY TATUAJES DESC
	
/*CONSULTAR LOS ASPIRANTES A ASCENSO QUE FUERON CASTIGADOS Y CON QUÉ MOTIVO*/


SELECT
	CONCAT(SOLDADO.SOLDADO_NOMBRE,' ',SOLDADO.SOLDADO_APELLIDO) AS SOLDADO,
	CASTIGO.CASTIGO_MOTIVO,
	RANGO.RANGO_ANTERIOR AS RANGO_ACTUAL,
	RANGO.RANGO_NOMBRE AS RANGO_ASCENDER
FROM
	PETICION_ASCENSO
	INNER JOIN SOLDADO ON PETICION_ASCENSO.ASPIRANTE_ID = SOLDADO.SOLDADO_ID
	INNER JOIN CASTIGO ON PETICION_ASCENSO.ASPIRANTE_ID = CASTIGO.SANCIONADO_ID
	INNER JOIN RANGO ON PETICION_ASCENSO.RANGO_ASCENDER_ID = RANGO.RANGO_ID


/*CONSULTAR LOS ASPIRANTES QUE SÍ RECIBIERON UN ASCENSO*/

SELECT
	CONCAT(SOLDADO.SOLDADO_NOMBRE,' ',SOLDADO.SOLDADO_APELLIDO) AS SOLDADO,
	PETICION_ASCENSO.PETICION_ASCENSO_FECHA AS FECHA_DE_INSCRIPCION,
	ASCENSO.ASCENSO_FECHA AS FECHA_DE_ASCENSO,
	RANGO.RANGO_NOMBRE AS RANGO_ASCENDIDO
FROM	
	ASCENSO
	INNER JOIN PETICION_ASCENSO ON ASCENSO.PETICION_ASCENSO_ID = PETICION_ASCENSO.PETICION_ASCENSO_ID
	INNER JOIN SOLDADO ON PETICION_ASCENSO.ASPIRANTE_ID = SOLDADO.SOLDADO_ID
	INNER JOIN RANGO ON PETICION_ASCENSO.RANGO_ASCENDER_ID = RANGO.RANGO_ID
	
/*CONSULAR EL OFICIAL QUE MÁS VECES HA CASTIGADO Y MOSTRAR EL NÚMERO DE VECES QUE LO HA HECHO*/

SELECT
	CONCAT(SOLDADO.SOLDADO_NOMBRE,' ',SOLDADO.SOLDADO_APELLIDO) AS OFICIAL_CON_MAS_SANCIONES_DADAS,
	COUNT(CASTIGO.SANCIONADOR_ID) AS CANTIDAD_DE_SANCIONES_DADAS
FROM
	CASTIGO
INNER JOIN SOLDADO ON CASTIGO.SANCIONADOR_ID = SOLDADO.SOLDADO_ID
GROUP BY CASTIGO.SANCIONADOR_ID
ORDER BY COUNT(*) DESC
LIMIT 1;
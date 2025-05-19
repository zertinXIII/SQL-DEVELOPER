------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

 Eliminamos la tabla y la creamos:

  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar2(20),
  apellido varchar2(20),
  sueldo number(6,2),
  cantidadhijos number(2,0),
  fechaingreso date,
  primary key(documento)
 );
 
 Ingrese algunos registros:

 insert into empleados values('22222222','Juan','Perez',200,2,'10/10/1980');
 insert into empleados values('22333333','Luis','Lopez',250,0,'01/02/1990');
 insert into empleados values('22444444','Marta','Perez',350,1,'02/05/1995');
 insert into empleados values('22555555','Susana','Garcia',400,2,'15/12/2018');
 insert into empleados values('22666666','Jose Maria','Morales',500,3,'25/08/2015');

1. Cree (o reemplace) el procedimiento almacenado llamado "pa_aumentarsueldo" que aumente los sueldos inferiores al promedio en un 20%

 CREATE OR REPLACE PROCEDURE PA_AUMENTARSUELDO 
 AS 
    BEGIN 
        UPDATE EMPLEADOS 
        SET SUELDO=SUELDO+(SUELDO*0.2)
            WHERE SUELDO<(SELECT AVG(SUELDO)
                                            FROM EMPLEADOS);
    END;
    /

 -------------------------------------------------------------

 CREATE OR REPLACE PROCEDURE pa_aumentarsueldo2
 AS
    v_promedio number(6,2);
 BEGIN
 
  -- Calcular el sueldo promedio
  SELECT AVG(sueldo) INTO v_promedio FROM empleados;
  
  DBMS_OUTPUT.PUT_LINE('Sueldo promedio: ' || v_promedio);
  DBMS_OUTPUT.PUT_LINE('Aumentando sueldos inferiores al promedio en 20%...');
  
  -- Actualizar sueldos inferiores al promedio
  UPDATE empleados 
  SET sueldo = sueldo * 1.20 
  WHERE sueldo < v_promedio;
  
  DBMS_OUTPUT.PUT_LINE('Proceso completado. ' || SQL%ROWCOUNT || ' empleados actualizados.');
  
 END pa_aumentarsueldo2;
 /
    
2. Ejecute el procedimiento creado anteriormente

 EXECUTE PA_AUMENTARSUELDO;

3. Verifique que los sueldos han aumentado

 SELECT *
 FROM EMPLEADOS;

4. Ejecute el procedimiento nuevamente

 EXECUTE pa_aumentarsueldo2;

5. Verifique que los sueldos han aumentado

 SELECT *
 FROM EMPLEADOS;

6. Elimine la tabla "empleados_antiguos"

  DROP TABLE empleados_antiguos;

7. Cree la tabla "empleados_antiguos"

 create table empleados_antiguos(
  documento char(8),
  nombre varchar2(40)
);

8. Cree (o reemplace) un procedimiento almacenado que ingrese en la tabla "empleados_antiguos" el documento, nombre y apellido (concatenados) de todos los empleados de la tabla "empleados" 
que ingresaron a la empresa hace más de 10 años.

 CREATE OR REPLACE PROCEDURE PA_EMPLEADOS_ANTIGUOS
 AS
    BEGIN
        INSERT INTO EMPLEADOS_ANTIGUOS
            SELECT DOCUMENTO,NOMBRE||' '||APELLIDO
            FROM EMPLEADOS
                WHERE (EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM FECHAINGRESO))>10;
    END;
    /

9. Ejecute el procedimiento creado anteriormente

 EXECUTE PA_EMPLEADOS_ANTIGUOS;

10. Verifique que la tabla "empleados_antiguos" ahora tiene registros (3 registros)

 SELECT *
 FROM EMPLEADOS_ANTIGUOS;
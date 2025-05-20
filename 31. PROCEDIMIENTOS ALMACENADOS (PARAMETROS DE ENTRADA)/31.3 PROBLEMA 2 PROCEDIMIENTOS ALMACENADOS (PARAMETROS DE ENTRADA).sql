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
  fechaingreso date
 );

 Ingrese algunos registros:

 insert into empleados values('22222222','Juan','Perez',300,'10/10/1980');
 insert into empleados values('22333333','Luis','Lopez',300,'12/05/1998');
 insert into empleados values('22444444','Marta','Perez',500,'25/08/1990');
 insert into empleados values('22555555','Susana','Garcia',400,'05/05/2000');
 insert into empleados values('22666666','Jose Maria','Morales',400,'24/10/2005');
 
1. Cree un procedimiento almacenado llamado "pa_empleados_aumentarsueldo". Debe incrementar el sueldo de los empleados con cierta cantidad de años en la empresa 
(parámetro "ayear" de tipo numérico) en un porcentaje (parámetro "aporcentaje" de tipo numerico); es decir, recibe 2 parámetros.

 CREATE OR REPLACE PROCEDURE PA_EMPLEADOS_AUMENTARSUELDO (AYEAR IN NUMBER ,APORCENTAJE IN NUMBER)
 AS
    BEGIN
        UPDATE EMPLEADOS SET SUELDO = SUELDO +(SUELDO*APORCENTAJE/100)
            WHERE (EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM FECHAINGRESO))>AYEAR;
    END;
    /

2. Ejecute el procedimiento creado anteriormente.

 EXECUTE PA_EMPLEADOS_AUMENTARSUELDO(10,20);

3. Verifique que los sueldos de los empleados con más de 10 años en la empresa han aumentado un 20%

 SELECT *
 FROM EMPLEADOS;

4. Ejecute el procedimiento creado anteriormente enviando otros valores como parámetros (por ejemplo, 8 y 10)

EXECUTE PA_EMPLEADOS_AUMENTARSUELDO(8,10);

5. Verifique que los sueldos de los empleados con más de 8 años en la empresa han aumentado un 10%

SELECT *
FROM EMPLEADOS;

6. Ejecute el procedimiento almacenado "pa_empleados_aumentarsueldo" sin parámetros

EXECUTE PA_EMPLEADOS_AUMENTARSUELDO;

7. Cree un procedimiento almacenado llamado "pa_empleados_ingresar" que ingrese un empleado en la tabla "empleados", debe recibir valor para el documento, el nombre, apellido
y almacenar valores nulos en los campos "sueldo" y "fechaingreso"

 CREATE OR REPLACE PROCEDURE PA_EMPLEADOS_INGRESAR (ADOCUMENTO IN VARCHAR2,ANOMBRE IN VARCHAR2,AAPELLIDO IN VARCHAR2)
 AS 
    BEGIN
        INSERT INTO EMPLEADOS VALUES (ADOCUMENTO,ANOMBRE,AAPELLIDO, NULL, NULL);
    END;
    /

8. Ejecute el procedimiento creado anteriormente y verifique si se ha ingresado en "empleados" un nuevo registro

 EXECUTE PA_EMPLEADOS_INGRESAR ('30000000','Ana','Acosta');
 
 ---- COMPROBAMOS SI SE HA INTRODUCIDO ----
 
 SELECT *
 FROM EMPLEADOS;

9. Reemplace el procedimiento almacenado llamado "pa_empleados_ingresar" para que ingrese un empleado en la tabla "empleados", 
debe recibir valor para el documento (con valor por defecto nulo) y fechaingreso (con la fecha actual como valor por defecto), los demás campos se llenan con valor nulo


 CREATE OR REPLACE PROCEDURE PA_EMPLEADOS_INGRESAR (ADOCUMENTO IN VARCHAR2 DEFAULT NULL,AFECHA IN DATE DEFAULT CURRENT_DATE)
 AS 
    BEGIN
        INSERT INTO EMPLEADOS VALUES (ADOCUMENTO, NULL, NULL,NULL,AFECHA);
    END;
    /

10. Ejecute el procedimiento creado anteriormente enviándole valores para los 2 parámetros y verifique si se ha ingresado en "empleados" un nuevo registro

 EXECUTE PA_EMPLEADOS_INGRESAR ('32222222','10/10/2007');
 
 ---- COMPROBAMOS SI SE HA INTRODUCIDO ----
 
 SELECT *
 FROM EMPLEADOS;

11. Ejecute el procedimiento creado anteriormente enviando solamente la fecha de ingreso y vea el resultado
Oracle toma el valor enviado como primer argumento e intenta ingresarlo en el campo "documento", muestra un mensaje de error indicando que el valor es muy grande, ya que tal campo admite 8 caracteres.

 EXECUTE  PA_EMPLEADOS_INGRESAR ('15/12/2000');

12. Cree (o reemplace) un procedimiento almacenado que reciba un documento y elimine de la tabla "empleados" el empleado que coincida con dicho documento

 CREATE OR REPLACE PROCEDURE PA_EMPLEADOS_ELIMINAR (ADOCUMENTO IN VARCHAR2)
 AS
    BEGIN 
        DELETE FROM EMPLEADOS WHERE DOCUMENTO=ADOCUMENTO;
    END;
    /

13. Elimine un empleado empleando el procedimiento del punto anterior

 EXECUTE PA_EMPLEADOS_ELIMINAR ('30000000');
 
  14. Verifique la eliminación
 
 SELECT *
 FROM EMPLEADOS;

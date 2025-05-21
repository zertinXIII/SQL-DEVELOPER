------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Trabajamos con la tabla "empleados". Eliminamos la tabla y luego la creamos con la siguiente estructura:

 drop table empleados;

 create table empleados (
  documento char(8),
  nombre varchar(30),
  fechanacimiento date  
 );
 
Ingresamos algunos registros:

 insert into empleados values('20111111','Acosta Ana','10/05/1968');
 insert into empleados values('22222222','Bustos Bernardo','09/07/1970');
 insert into empleados values('22333333','Caseros Carlos','15/10/1971');
 insert into empleados values('23444444','Fuentes Fabiana','25/01/1972');
 insert into empleados values('23555555','Gomez Gaston','28/03/1979');
 insert into empleados values('24666666','Juarez Julieta','18/02/1981');
 insert into empleados values('25777777','Lopez Luis','17/09/1978');
 insert into empleados values('26888888','Morales Marta','22/12/1975');
 
Nos interesa el nombre del mes en el cual cada empleado cumple años. Podemos utilizar la estructura condicional "case".

Para ello crearemos una función que reciba una fecha y retorne una cadena de caracteres indicando el nombre del mes de la fecha enviada como argumento:

 CREATE OR REPLACE FUNCTION F_MES_CUMPLEAÑOS(AFECHANAC DATE)
        RETURN VARCHAR2
    IS
        MES VARCHAR2(20);
    BEGIN
        MES:= 'ENERO';
        CASE EXTRACT (MONTH FROM AFECHANAC)
            WHEN 1 THEN MES:='ENERO';
            WHEN 2 THEN MES:='FEBRERO';
            WHEN 3 THEN MES:='MARZO';
            WHEN 4 THEN MES:='ABRIL';
            WHEN 5 THEN MES:='MAYO';
            WHEN 6 THEN MES:='JUNIO';
            WHEN 7 THEN MES:='JULIO';
            WHEN 8 THEN MES:='AGOSTO';
            WHEN 9 THEN MES:='SEPTIEMBRE';
            WHEN 10 THEN MES:='OCTUBRE';
            WHEN 11 THEN MES:='NOVIEMBRE';
            ELSE MES:='DICIEMBRE';
        END CASE;
        
        RETURN MES;
    END;
    /
            
2. Recuperamos el nombre del empleado y el mes de su cumpleaños realizando un "select":

 SELECT NOMBRE, F_MES_CUMPLEAÑOS(FECHANACIMIENTO) "CUMPLEAÑOS"
 FROM EMPLEADOS;
  
2.1 Podriamos probar la funcion con un select
    
    SELECT F_MES_CUMPLEAÑOS ('10/10/2018')
    FROM DUAL;

3. Realizar una función que reciba una fecha y retorne si se encuentra en el 1º, 2º, 3º ó 4º trimestre del año:

 CREATE OR REPLACE FUNCTION F_TRIMESTRE (AFECHANAC DATE)
        RETURN VARCHAR2
    IS
        MES VARCHAR2(20);
        TRIMESTRE NUMBER;
    BEGIN
        MES:= EXTRACT(MONTH FROM AFECHANAC);
        TRIMESTRE:=4;
        CASE MES
            WHEN 1 THEN TRIMESTRE :=1;
            WHEN 2 THEN TRIMESTRE :=1;
            WHEN 3 THEN TRIMESTRE :=1;
            WHEN 4 THEN TRIMESTRE :=2;
            WHEN 5 THEN TRIMESTRE :=2;
            WHEN 6 THEN TRIMESTRE :=2;
            WHEN 7 THEN TRIMESTRE :=3;
            WHEN 8 THEN TRIMESTRE :=3;
            WHEN 9 THEN TRIMESTRE :=3;
            ELSE TRIMESTRE:=4;
        END CASE;
        
        RETURN TRIMESTRE;
    END;
    /

4. Recuperamos el nombre del empleado y el trimestre de su cumpleaños empleando la función creada anteriormente:

 SELECT NOMBRE, F_TRIMESTRE (FECHANACIMIENTO)
 FROM EMPLEADOS;

5.Vamos a emplear "case" dentro de un "select". Veamos un ejemplo similar a la función anterior:

 select nombre,fechanacimiento,
  case extract(month from fechanacimiento)
   when 1 then 1
   when 2 then 1
   when 3 then 1
   when 4 then 2
   when 5 then 2
   when 6 then 2
   when 7 then 3
   when 8 then 3
   when 9 then 3
  else  4
  end as trimestre
  from empleados
  order by trimestre;
  
------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

Trabajamos con la tabla "empleados".

Elimine la tabla y luego créela con la siguiente estructura:

 drop table empleados;

 create table empleados (
  documento char(8),
  nombre varchar(30),
  fechanacimiento date,
  hijos number(2),
  sueldo number(6,2),
  sexo char(1)  
 );
 
 Ingrese algunos registros:

 insert into empleados values('20000000','Acosta Ana','10/05/1968',0,800,'f');
 insert into empleados values('21111111','Bustos Bernardo','09/07/1970',2,550,'m');
 insert into empleados values('22222222','Caseros Carlos','15/10/1971',3,500,'m');
 insert into empleados values('23333333','Fuentes Fabiana','25/08/1972',0,500,'f');
 insert into empleados values('24444444','Gomez Gaston','28/03/1979',1,850,'m');
 insert into empleados values('25555555','Juarez Javier','18/08/1981',2,600,'m');
 insert into empleados values('26666666','Lopez Luis','17/09/1978',4,690,'m');
 insert into empleados values('27777777','Morales Marta','22/08/1975',2,480,'f');
 insert into empleados values('28888888','Norberto Nores','11/08/1973',3,460,'m');
 insert into empleados values('29999999','Oscar Oviedo','19/07/1976',0,700,'m');
 
1. La empresa tiene por política festejar los cumpleaños de sus empleados cada mes, si es de sexo femenino se le regala un ramo de flores, sino, una lapicera.
Realice un "select" mostrando el nombre del empleado, el día del cumpleaños y una columna extra que muestre "FLORES" o "LAPICERA" según el sexo del empleado (case), 
de todos los empleados que cumplen años en el mes de agosto (where) y ordene por día.

 SELECT NOMBRE, EXTRACT (DAY FROM FECHANACIMIENTO) "DIA",
    CASE SEXO
        WHEN 'f' THEN 'FLORES'
            ELSE 'LAPICERA'
    END "REGALO"
 FROM EMPLEADOS
    WHERE
        EXTRACT (MONTH FROM FECHANACIMIENTO)='08'
    ORDER BY 2;
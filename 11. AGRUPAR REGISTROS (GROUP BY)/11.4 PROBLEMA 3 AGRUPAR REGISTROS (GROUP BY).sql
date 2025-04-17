------------------------------------------------- PROBLEMA 3 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena los datos de sus empleados en una tabla "empleados".

Elimine la tabla y luego créela con la estructura definida a continuación:

 drop table empleados;
 
 create table empleados(
  nombre varchar2(30),
  documento char(8),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(6,2),
  cantidadhijos number(2),
  fechaingreso date,
  primary key(documento)
 );

Ingrese algunos registros:

 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'10/05/1980');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'12/10/1980');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'25/05/1985');
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'25/06/1990');
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'01/05/1996');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'01/05/1996');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'01/05/1996');
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'01/09/2000');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);
  
1. Cuente la cantidad de empleados agrupados por sección 

 SELECT SECCION, COUNT (*)
 FROM EMPLEADOS 
    GROUP BY SECCION;

2. Calcule el promedio de hijos por sección 

 SELECT SECCION, AVG(CANTIDADHIJOS)"PROMEDIO DE HIJOS"
 FROM EMPLEADOS
    GROUP BY SECCION;

3. Cuente la cantidad de empleados agrupados por año de ingreso 

 SELECT TO_CHAR(FECHAINGRESO,'YYYY') "AÑO INGRESO", COUNT (*)"CANTIDAD DE EMPLEADOS"
 FROM EMPLEADOS
    GROUP BY TO_CHAR(FECHAINGRESO,'YYYY');
    
4. Calcule el promedio de sueldo por sección de los empleados con hijos 

 SELECT SECCION,AVG(SUELDO)"PROMEDIO SUELDO"
 FROM EMPLEADOS
 WHERE CANTIDADHIJOS>0 AND CANTIDADHIJOS IS NOT NULL
    GROUP BY SECCION;
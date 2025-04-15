------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

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
 
-- Ingrese algunos registros:

 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'10/10/1980');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'15/08/1998');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,null);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,null);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'26/08/2000');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'25/09/2001');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,null);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'14/12/2000');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,'08/08/1990');
  
  
1.  Muestre la cantidad de empleados usando "count" 

 SELECT COUNT(*)
 FROM EMPLEADOS;

2. Muestre la cantidad de empleados con fecha de ingreso conocida 

 SELECT COUNT(FECHAINGRESO)
 FROM EMPLEADOS;

3.  Muestre la cantidad de empleados con sueldo 

 SELECT COUNT(SUELDO)
 FROM EMPLEADOS;

4.  Muestre la cantidad de empleados con sueldo de la sección "Secretaria"

 SELECT COUNT (SUELDO)
 FROM EMPLEADOS
    WHERE SECCION='Secretaria';

5.  Muestre el sueldo más alto y el más bajo colocando un alias 

 SELECT MAX(SUELDO) "SUELDO MAXIMO", MIN(SUELDO) "SUELDO MINIMO"
 FROM EMPLEADOS;

6.  Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" 

 SELECT MAX(CANTIDADHIJOS)
 FROM EMPLEADOS
    WHERE NOMBRE LIKE '%Perez%';

7.  Muestre la fecha de ingreso más reciente (max) y la más lejana (min) 

 SELECT MAX (FECHAINGRESO), MIN(FECHAINGRESO)
 FROM EMPLEADOS;

8.  Muestre el documento menor 

 SELECT MIN(DOCUMENTO)
 FROM EMPLEADOS;

9.  Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es tenido en cuenta)

 SELECT AVG(SUELDO)
 FROM EMPLEADOS;

10.  Muestre el promedio de sueldos de los empleados de la sección "Secretaría" 

 SELECT AVG(SUELDO)
 FROM EMPLEADOS
    WHERE SECCION='Secretaria';

11.  Muestre el promedio de hijos de todos los empleados de "Sistemas" 

 SELECT AVG (CANTIDADHIJOS)
 FROM EMPLEADOS
    WHERE SECCION='Sistemas';

12.  Muestre la cantidad de empleados, la cantidad de empleados con domicilio conocido, la suma de los hijos, el promedio de los sueldos y los valores mínimo y máximo del campo "fechaingreso" de 
todos los empleados. 

 SELECT COUNT(*),COUNT(DOMICILIO),SUM(CANTIDADHIJOS),AVG(SUELDO),MIN(FECHAINGRESO),MAX(FECHAINGRESO)
 FROM EMPLEADOS;

13.  Realice la misma consulta anterior pero ahora de los empleados de la sección "Recursos". Al no existir tal sección, "count(*)" y "count(domicilio)" retornan 0 (cero) y las demás funciones de grupo 
retornan "null".

 SELECT COUNT(*),COUNT(DOMICILIO),SUM(CANTIDADHIJOS),AVG(SUELDO),MIN(FECHAINGRESO),MAX(FECHAINGRESO)
 FROM EMPLEADOS
    WHERE SECCION='Recursos';
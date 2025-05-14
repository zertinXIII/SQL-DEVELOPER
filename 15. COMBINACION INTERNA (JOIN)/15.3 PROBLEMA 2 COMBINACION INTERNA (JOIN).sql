------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.

 Elimine las tablas "clientes" y "provincias":

   drop table clientes;
   drop table provincias;
   
 Créelas con las siguientes estructuras:

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20)
 );
 
 Ingrese algunos registros para ambas tablas:

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');
 insert into provincias values(null,'La Pampa');

 insert into clientes values (1,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (2,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (3,'Garcia Juan','Rivadavia 333','Villa Maria',null);
 insert into clientes values (4,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (5,'Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values (6,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (7,'Torres Fabiola','Alem 777','Ibera',3);
 insert into clientes values (8,'Garcia Paco','Avellaneda 888','Rawson',5);
 
1. Obtenga los datos de ambas tablas, usando alias.

Note que los registros de "clientes" cuyo valor de "codigoprovincia" que NO encuentran coincidencia con "codigo" de "provincias" no aparecen en el resultado de la consulta; 
caso de "Garcia Juan", que código de provincia nulo y "Garcia Paco", que tiene un código de provincia que no está presente en "provincias".

 SELECT C.NOMBRE, DOMICILIO,CIUDAD,P.NOMBRE
 FROM CLIENTES C
    JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO;

2. Obtenga la misma información anterior pero ordenada por nombre de provincia (join y order by)

 SELECT C.NOMBRE,DOMICILIO,CIUDAD, P.NOMBRE
 FROM CLIENTES C
    JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO
        ORDER BY P.NOMBRE;

3. Recupere todos los datos de los CLIENTES de la provincia "Santa Fe" (join con where) (2 registros devueltos)

 SELECT C.NOMBRE,DOMICILIO,CIUDAD
 FROM CLIENTES C
    JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO
        WHERE P.NOMBRE='Santa Fe';


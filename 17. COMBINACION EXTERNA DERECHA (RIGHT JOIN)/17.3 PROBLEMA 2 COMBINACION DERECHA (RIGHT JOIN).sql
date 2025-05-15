------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.

 Elimine las tablas "clientes" y "provincias" y créelas:

 drop table clientes;
 drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );


Ingrese algunos registros para ambas tablas:

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');

 insert into clientes values (101,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (102,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (103,'Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values (104,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (105,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (106,'Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values (107,'Garcia Luis','Sucre 475','Santa Rosa',5);
 
 
1. Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right join".

 SELECT C.NOMBRE, C.DOMICILIO,C.CIUDAD,P.NOMBRE "PROVINCIA"
 FROM PROVINCIAS P
 RIGHT JOIN CLIENTES C
    ON C.CODIGOPROVINCIA=P.CODIGO;

2. Obtenga la misma salida que la consulta anterior pero empleando un "left join".

 SELECT C.NOMBRE, C.DOMICILIO,C.CIUDAD,P.NOMBRE "PROVINCIA"
 FROM CLIENTES C
 LEFT JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO;

3. Empleando un "right join", muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)

 SELECT C.NOMBRE, C.DOMICILIO,C.CIUDAD,P.NOMBRE "PROVINCIA"
 FROM PROVINCIAS P
 RIGHT JOIN CLIENTES C
    ON C.CODIGOPROVINCIA=P.CODIGO
        WHERE P.NOMBRE IS NOT NULL;

4.  Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por ciudad (2 registros)

 SELECT C.NOMBRE, C.DOMICILIO,C.CIUDAD,P.NOMBRE "PROVINCIA"
 FROM PROVINCIAS P
 RIGHT JOIN CLIENTES C
    ON C.CODIGOPROVINCIA=P.CODIGO
        WHERE P.NOMBRE IS NULL
            ORDER BY C.CIUDAD;
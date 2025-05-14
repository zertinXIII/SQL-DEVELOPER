------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.

Elimine las tablas "clientes" y "provincias", créelas y agregue restricciones únicas para los campos "codigo" de ambas tablas:

   drop table clientes;
   drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(3)
 );

 create table provincias(
  codigo number(3),
  nombre varchar2(20)
 );

 alter table clientes
  add constraints UQ_clientes_codigo
  unique (codigo);

 alter table provincias
  add constraints UQ_provincias_codigo
  unique (codigo);

Ingrese algunos registros para ambas tablas. Incluya valores nulos para el campo "codigo" de "provincias" y valores nulos para el campo "codigoprovincia" de "clientes". Incluya en "clientes" un código de provincia que no exista en "provincias":

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');
 insert into provincias values(4,'Santa Cruz');
 insert into provincias values(null,'Salta');
 insert into provincias values(null,'Jujuy');

 insert into clientes values (100,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (200,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (300,'Garcia Juan','Rivadavia 333','Villa Maria',null);
 insert into clientes values (400,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (500,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (600,'Torres Fabiola','Alem 777','La Plata',5);
 insert into clientes values (700,'Garcia Luis','Sucre 475','Santa Rosa',null);
 
1. Muestre todos los datos de los clientes, incluido el nombre de la provincia

Note que los clientes de "Santa Rosa", "Villa Maria" y "La Plata" se muestran seteados a null en la columna corespondiente al nombre de la provincia porque tienen valores nulos o inexistentes.

 SELECT C.NOMBRE "CLIENTE", C.DOMICILIO,C.CIUDAD, P.NOMBRE "PROVINCIA"
 FROM CLIENTES C
 LEFT JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO;


2. Realice la misma consulta anterior pero alterando el orden de las tablas.

 SELECT C.NOMBRE "CLIENTE", C.DOMICILIO,C.CIUDAD, P.NOMBRE "PROVINCIA"
 FROM PROVINCIAS P
 LEFT JOIN CLIENTES C
    ON C.CODIGOPROVINCIA=P.CODIGO;

3. Muestre solamente los clientes de las provincias que existen en "provincias" (4 registros)

Note que los clientes de "Jujuy", "Salta", "Santa Cruz" y "Corrientes" se muestran seteados a null en los campos pertenecientes a la tabla "clientes" porque tienen valores nulos o inexistentes 
en dicha tabla.

 SELECT C.NOMBRE,DOMICILIO,CIUDAD,P.NOMBRE "PROVINCIA"
 FROM CLIENTES C
 LEFT JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO
        WHERE P.CODIGO IS NOT NULL;

4. Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por nombre del cliente (3 registros)

 SELECT C.NOMBRE,DOMICILIO,CIUDAD,P.NOMBRE "PROVINCIA"
 FROM CLIENTES C
 LEFT JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO
        WHERE P.CODIGO IS NULL
            ORDER BY C.NOMBRE; 

5. Obtenga todos los datos de los clientes de "Cordoba" (2 registros)

 SELECT C.NOMBRE,DOMICILIO,CIUDAD,P.NOMBRE "PROVINCIA"
 FROM CLIENTES C
 LEFT JOIN PROVINCIAS P
    ON C.CODIGOPROVINCIA=P.CODIGO
        WHERE P.NOMBRE='Cordoba';

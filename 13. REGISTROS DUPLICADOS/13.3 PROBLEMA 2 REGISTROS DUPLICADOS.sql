------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
 drop table clientes;

 create table clientes (
  nombre varchar2(30) not null,
  domicilio varchar2(30),
  ciudad varchar2(20),
  provincia varchar2(20)
);

Ingrese algunos registros:

 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');
  
1. Obtenga las provincias sin repetir 

 SELECT DISTINCT PROVINCIA
 FROM CLIENTES;

2.  Cuente las distintas provincias 

 SELECT COUNT (DISTINCT PROVINCIA) "CANTIDAD"
 FROM CLIENTES;

3.  Se necesitan los nombres de las ciudades sin repetir 

 SELECT DISTINCT CIUDAD
 FROM CLIENTES;

4. Obtenga la cantidad de ciudades distintas 

 SELECT COUNT (DISTINCT CIUDAD)
 FROM CLIENTES;

5. Combina con "where" para obtener las distintas ciudades de la provincia de Cordoba 

 SELECT DISTINCT CIUDAD
 FROM CLIENTES 
    WHERE PROVINCIA='Cordoba';

6. Contamos las distintas ciudades de cada provincia empleando "group by" 

 SELECT PROVINCIA, COUNT(DISTINCT CIUDAD)
 FROM CLIENTES
    GROUP BY PROVINCIA;
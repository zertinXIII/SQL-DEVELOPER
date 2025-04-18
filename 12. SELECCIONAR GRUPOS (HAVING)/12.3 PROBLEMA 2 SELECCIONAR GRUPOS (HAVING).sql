------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Elimine la tabla "clientes":

 drop table clientes;

Créela con la siguiente estructura:

 create table clientes (
  nombre varchar2(30) not null,
  domicilio varchar2(30),
  ciudad varchar2(20),
  provincia varchar2(20),
  telefono varchar2(11)
 );

Ingrese algunos registros:

 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');
  
1. Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)

 SELECT CIUDAD,PROVINCIA, COUNT(*)"CANTIDAD"
 FROM CLIENTES
    GROUP BY CIUDAD,PROVINCIA;
    
2. Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes

 SELECT CIUDAD,PROVINCIA,COUNT(*)"CANTIDAD"
 FROM CLIENTES
    GROUP BY CIUDAD,PROVINCIA
    HAVING COUNT(*)>1;

3. Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia (group by), de aquellas ciudades que tengan menos de 2 clientes (having) y omitiendo la fila 
correspondiente a la ciudad de "Cordoba" (having) (2 filas devueltas)

 SELECT PROVINCIA,COUNT(*)"CANTIDAD CLIENTES"
 FROM CLIENTES
 WHERE DOMICILIO LIKE '%San Martin%'  AND CIUDAD<>'Cordoba' -- viven en calle San Martin / omitir ciudad 'Cordoba'
   GROUP BY PROVINCIA, CIUDAD
   HAVING COUNT(*)<2 ;
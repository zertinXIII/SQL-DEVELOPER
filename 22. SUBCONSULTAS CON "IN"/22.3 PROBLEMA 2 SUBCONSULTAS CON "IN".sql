------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "ciudades" donde registra los nombres de las ciudades.

Elimine las tablas "clientes" y "ciudades":

  drop table clientes;
  drop table ciudades;
  
Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, nombre). 
Agregue una restricción "primary key" para el campo "codigo" de ambas tablas y una "foreing key" para validar que el campo "codigociudad" exista en "ciudades" con eliminación en cascada:

 create table ciudades(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );

 create table clientes (
  codigo number(4),
  nombre varchar2(30),
  domicilio varchar2(30),
  codigociudad number(2) not null,
  primary key(codigo),
  constraint FK_clientes_ciudad
   foreign key (codigociudad)
   references ciudades(codigo)
   on delete cascade
 );

 Ingrese algunos registros para ambas tablas:

 insert into ciudades values(1,'Cordoba');
 insert into ciudades values(2,'Cruz del Eje');
 insert into ciudades values(3,'Carlos Paz');
 insert into ciudades values(4,'La Falda');
 insert into ciudades values(5,'Villa Maria');

 insert into clientes values (100,'Lopez Marcos','Colon 111',1);
 insert into clientes values (101,'Lopez Hector','San Martin 222',1);
 insert into clientes values (105,'Perez Ana','San Martin 333',2);
 insert into clientes values (106,'Garcia Juan','Rivadavia 444',3);
 insert into clientes values (107,'Perez Luis','Sarmiento 555',3);
 insert into clientes values (110,'Gomez Ines','San Martin 666',4);
 insert into clientes values (111,'Torres Fabiola','Alem 777',5);
 insert into clientes values (112,'Garcia Luis','Sucre 888',5);
 
1. Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle "San Martin", empleando subconsulta.

-------- SUBSELECT ---------

 SELECT C.NOMBRE
 FROM CIUDADES C
    WHERE CODIGO IN 
        (SELECT CL.CODIGOCIUDAD
        FROM CLIENTES CL
        WHERE CL.DOMICILIO LIKE 'San Martin %');


2. Obtenga la misma salida anterior pero empleando join.

 -------- JOIN ---------

 SELECT C.NOMBRE 
 FROM CIUDADES C
    JOIN CLIENTES CL 
    ON C.CODIGO=CL.CODIGOCIUDAD
    WHERE CL.DOMICILIO LIKE 'San Martin %';
    
3. Obtenga los nombre de las ciudades de los clientes cuyo apellido NO COMIENZA con una letra específica (letra "G"), empleando subconsulta.

 -------- SUBSELECT ---------

 SELECT C.NOMBRE
 FROM CIUDADES C
    WHERE C.CODIGO NOT IN
     (SELECT CL.CODIGOCIUDAD
      FROM CLIENTES CL
        WHERE NOMBRE LIKE 'G%');
        
 -------- JOIN (CON SUBCONSULTA) ---------

 SELECT C.NOMBRE
 FROM CIUDADES C
 LEFT JOIN 
    (SELECT DISTINCT CL.CODIGOCIUDAD
    FROM CLIENTES CL
    WHERE CL.NOMBRE LIKE 'G%') CL
        ON C.CODIGO = CL.CODIGOCIUDAD
        WHERE CL.CODIGOCIUDAD IS NULL;
        
  -------- JOIN (SIN SUBCONSULTA) ---------
 SELECT C.NOMBRE
 FROM CIUDADES C
 LEFT JOIN CLIENTES CL
    ON C.CODIGO=CL.CODIGOCIUDAD AND CL.NOMBRE LIKE 'G%'
        WHERE CL.CODIGOCIUDAD IS NULL;


4. Pruebe la subconsulta del punto 3 separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo.

 SELECT CL.CODIGOCIUDAD
     FROM CLIENTES CL
        WHERE NOMBRE LIKE 'G%'
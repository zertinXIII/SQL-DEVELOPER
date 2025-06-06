------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Trabajamos con la tabla "libros" de una librería.

Eliminamos la tabla:

  drop table libros;
  
Creamos la tabla:

 create table libros(
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(15),
  precio number(5,2),
  cantidad number(3)
 );
 
Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Planeta',35,null);
 insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
 insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta',40,200);
 insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18,null);
 insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120);
 insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
 insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
 insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80);
 insert into libros
  values('PHP de la A a la Z',null,null,110,0);
 insert into libros
  values('Uno','Richard Bach','Planeta',25,null);
  
1. Queremos saber la cantidad de libros agrupados por editorial:

 SELECT EDITORIAL, COUNT (*)
 FROM LIBROS
    GROUP BY EDITORIAL;
    
2. Queremos saber la cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, por ejemplo, los que devuelvan un valor mayor a 2, usamos la siguiente instrucción:

 SELECT EDITORIAL, COUNT (*)
 FROM LIBROS
    GROUP BY EDITORIAL
    HAVING COUNT(*)>2;
    
3. Queremos el promedio de los precios de los libros agrupados por editorial, pero solamente de aquellos grupos cuyo promedio supere los 25 pesos:

 SELECT EDITORIAL, AVG (PRECIO)
 FROM LIBROS
    GROUP BY EDITORIAL
    HAVING AVG(PRECIO)>25;
    
4. Queremos la cantidad de libros, sin considerar los que tienen precio nulo (where), agrupados por editorial (group by), sin considerar la editorial "Planeta" (having):

 SELECT EDITORIAL, COUNT (*)
 FROM LIBROS
 WHERE PRECIO IS NOT NULL
 GROUP BY EDITORIAL
    HAVING EDITORIAL <>'Planeta';

5. Necesitamos el promedio de los precios agrupados por editorial, de aquellas editoriales que tienen más de 2 libros:

 SELECT EDITORIAL, AVG(PRECIO)
 FROM LIBROS
 GROUP BY EDITORIAL
    HAVING COUNT(*)>2;
    
6. Buscamos el mayor valor de los libros agrupados y ordenados por editorial y seleccionamos las filas que tienen un valor menor a 100 y mayor a 30:

 SELECT EDITORIAL, MAX(PRECIO)
 FROM LIBROS
    GROUP BY EDITORIAL
    HAVING MAX(PRECIO)<100 AND MAX(PRECIO)>30
    ORDER BY EDITORIAL;
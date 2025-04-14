------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Eliminamos la tabla:

  drop table libros;

-- Creamos la tabla:

 create table libros(
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar(20),
  precio number(6,2)
 );
 
-- Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Emece',15.90);
 insert into libros
  values('Antología poética',null,'Planeta',null);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
 insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
 insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
 insert into libros
  values('Aprenda PHP',default,'Nuevo siglo',null);
 insert into libros
  values('Uno','Richard Bach','Planeta',20);
  
-- 1. Averiguemos la cantidad de libros usando la función "count()":

SELECT COUNT( * ) 
FROM LIBROS ;

-- 2. Contamos los libros de editorial "Planeta":

SELECT COUNT ( *)
FROM LIBROS 
WHERE EDITORIAL = 'Planeta';

-- 3. Contamos los registros que tienen precio (sin tener en cuenta los que tienen valor nulo), usando la función "count(precio)":

SELECT COUNT (PRECIO)
FROM LIBROS;

-- 4. Contamos los registros que tienen valor diferente de "null" en "editorial": 
    -- Hay que tener en cuena que COUNT ( ) cuenta valores que son diferentes  a null

SELECT COUNT (EDITORIAL)
FROM LIBROS;
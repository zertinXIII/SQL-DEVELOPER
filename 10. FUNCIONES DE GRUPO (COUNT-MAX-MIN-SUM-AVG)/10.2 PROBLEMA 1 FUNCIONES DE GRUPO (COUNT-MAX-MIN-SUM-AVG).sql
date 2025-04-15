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
  
1. Averiguemos la cantidad de libros usando la función "count()":

 SELECT COUNT (*)
 FROM LIBROS;

2. Contamos los libros de editorial "Planeta":

 SELECT SUM (CANTIDAD)
 FROM LIBROS
    WHERE EDITORIAL='Emece';

3. Queremos saber el precio del libro más costoso; usamos la función "max()":

 SELECT MAX (PRECIO)
 FROM LIBROS;

4. Para conocer el precio mínimo de los libros de "Rowling" tipeamos:

 SELECT MIN(PRECIO)
 FROM LIBROS
    WHERE AUTOR LIKE '%Rowling';

5. Queremos saber el promedio del precio de los libros referentes a "PHP":

 SELECT AVG(PRECIO)
 FROM LIBROS
    WHERE TITULO LIKE '%PHP%';

6. Averiguamos el mínimo valor del campo "edicion":

 SELECT MIN(EDICION)
 FROM LIBROS;

7. Necesitamos conocer el mayor valor de "codigo":

 SELECT MAX(CODIGO)
 FROM LIBROS;
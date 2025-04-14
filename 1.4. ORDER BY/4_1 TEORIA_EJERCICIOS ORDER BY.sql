------------------------------------------------- ORDENAR REGISTROS (ORDER BY)  -------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

 -------------------------------------------------  RESUMEN DE COMANDOS -----------------------------------------------------------------------------------------------------------------

 --Es posible ordenar por un campo que no se lista en la selección incluso por columnas calculados.

 -- Se puede emplear "order by" con campos de tipo caracter, numérico y date.

 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
--------------------------------------------------------- EJERCICIOS ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drop table libros;

create table libros(
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  edicion date,
  precio number(6,2)
 );
 
-- Ingresamos algunos registros:

 insert into libros values('El aleph','Borges','Emece','10/10/1980',25.33);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI','05/12/2005',50.65);
 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','29/11/2000',19.95);
 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta','27/11/2004',15);
 
1.  Recuperamos los registros ordenados por el título:

 SELECT * 
 FROM LIBROS 
 ORDER BY TITULO;

2. Ordenamos los registros por el campo "precio", referenciando el campo por su posición en la lista de selección:

  SELECT *
  FROM LIBROS 
  ORDER BY 5;

3. Los ordenamos por "editorial", de mayor a menor empleando "desc":

SELECT *
FROM LIBROS
ORDER BY EDITORIAL DESC;

4. Ordenamos por dos campos:

SELECT *
FROM LIBROS
ORDER BY EDITORIAL, AUTOR;

5. Ordenamos en distintos sentidos:

SELECT *
FROM LIBROS
ORDER BY EDITORIAL ASC, AUTOR DESC;

6. Podemos ordenar por un campo que no se lista en la selección (EJEMPLO:por PRECIO):

SELECT TITULO, AUTOR
FROM LIBROS
ORDER BY PRECIO;

7. Está permitido ordenar por valores calculados, lo hacemos:
-- Seleccionaremos por titulo , editorial y precio con descuento (10%) y ordenamos por editorial.

SELECT TITULO, EDITORIAL, PRECIO+(PRECIO*0.1)"PRECIO CON DESCUENTO"
FROM LIBROS
ORDER BY EDITORIAL;

8. Ordenamos los libros por la fecha de edición:

SELECT  TITULO, EDITORIAL, EDICION 
FROM LIBROS
ORDER BY EDICION;

9. Mostramos el título y año de edición de todos los libros, ordenados por año de edición:

SELECT TITULO,  EXTRACT (YEAR FROM EDICION) "EDICION"
FROM LIBROS
ORDER BY 2; -- el 2 es la referencia de la columna anteriormente mencionada. 

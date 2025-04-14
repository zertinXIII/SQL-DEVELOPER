------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Eliminamos la tabla:

drop table libros;
  
-- Creamos la tabla:

 create table libros(
  titulo varchar2(40),
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  edicion date,
  precio number(6,2)
 );
 
-- Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Emece','12/05/2005',15.90);
 insert into libros
  values('Antología poética','J. L. Borges','Planeta','16/08/2000',null);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,'25/04/2000',19.90);
 insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI','21/12/2006',15);
 insert into libros
  values('Martin Fierro','Jose Hernandez',default,'22/09/2001',40);
 insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo','22/05/1999',56.50);
 insert into libros
  values(null,'Mario Molina','Nuevo siglo',null,45);
  
  
-- 1. Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":

 SELECT TITULO  , AUTOR
 FROM LIBROS 
    WHERE AUTOR LIKE '%Borges%';
    
-- 2. Seleccionamos los libros cuyos títulos comienzan con la letra "M":

 SELECT TITULO
 FROM LIBROS
    WHERE TITULO LIKE 'M%';

-- 3. Seleccionamos todos los títulos que NO comienzan con "M":

 SELECT TITULO
 FROM LIBROS 
    WHERE TITULO NOT LIKE 'M%';

-- 4. Si queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe "Carroll" o "Carrolt", podemos emplear el comodín "_" (guión bajo) y establecer la siguiente condición:

 SELECT *
 FROM LIBROS 
 WHERE AUTOR LIKE '%Carrol_';

-- 5. Recuperamos todos los libros que contengan en el campo "edicion", en la parte correspondiente al mes, la cadena "05":

 SELECT *
 FROM LIBROS
    WHERE EDICION LIKE '__/05%';

-- Especificamos que los 2 primeros caracteres (2 guiones bajos) pueden ser cualquier caracter, luego una barra seguida de "05" y que finalice con cualquier número de caracteres.

-- 6. Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:

 SELECT *
 FROM LIBROS
    WHERE PRECIO LIKE '1_,%';

-- 7. Recuperamos los libros que NO incluyen centavos en sus precios:

 SELECT *
 FROM LIBROS 
    WHERE PRECIO NOT LIKE '%,%';
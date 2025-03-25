drop  table libros;

create table libros(
  codigo number(5),
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  precio number(6,2),
  cantidad number(3)
 ); 
 
  insert into libros
   values(1,'El aleph','Borges','Emece',25,100);
 insert into libros
  values(2,'Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros
  values(3,'Alicia en el pais de las maravillas','Lewis Carroll','Emece',15.50,200);
 insert into libros
  values(4,'el pais de las hadas',default,'Emece',25.50,150);
 
DELETE FROM libros 
WHERE id = 4 
AND titulo = 'el pais de las hadas' 
AND editorial = 'Emece' 
AND precio = 25.50 
AND stock = 150;
 
-- 1. Recuperamos TODOS los registros ORDENADOS POR el título:

 SELECT * 
 FROM LIBROS
 ORDER BY TITULO;

-- 2. Mostramos sólo los 12 primeros caracteres de los títulos de los libros y sus autores, empleando la función "substr":

 SELECT SUBSTR (TITULO , 1 , 12) "TITULO"
 FROM LIBROS;

-- 3. Mostramos sólo los 20 primeros caracteres de los títulos de los libros y rellenando los espacios restantes con "*", empleando la función "rpad":

 SELECT RPAD (TITULO,20, '*') "TITULO FORMATEADO"
 FROM LIBROS;

-- 4. Mostramos los títulos de los libros empleando la función "initcap":
 SELECT INITCAP (TITULO) "TITULO"
 FROM LIBROS;

-- 5. Mostramos los títulos de los libros y sus autores en mayúsculas:
 SELECT UPPER ( TITULO) , UPPER (AUTOR)  "AUTOR"
 FROM LIBROS;

-- 6. Concatenamos título y autor empleando "concat":
 SELECT CONCAT (TITULO, AUTOR)
 FROM LIBROS;

-- 7. Mostramos el título y el precio de todos los libros concatenando el signo "$" a los precios:
 SELECT TITULO, CONCAT ('$', PRECIO) "PRECIO"
 FROM LIBROS;

-- 8. Recuperamos el título y editorial de "libros" reemplazando "Emece" por "Sudamericana":
 SELECT TITULO, REPLACE (EDITORIAL, 'Emece' , 'Sudamericana')
 FROM LIBROS;

-- 9.Recuperamos el autor de todos los libros reemplazando las letras "abc" por "ABC" respectivamente (empleando "translate"):
 SELECT TRANSLATE (AUTOR, 'abc', 'ABC')
 FROM LIBROS;

-- 10. Mostramos la posición de la primera ocurrencia de la cadena "pais" en los títulos de los libros:

 -- como no tenemos  'PAIS' en la tabla principal , INSERTAMOS ESA LINEA. 
    ALTER TABLE libros ADD pais VARCHAR2(30);

 -- PARA INCLUIR LOS PAISES TENEMOS QUE ELIMINAR LOS REGISTROS , Y AHORA INSERTAMOS FILAS CON PAIS 
    DELETE FROM libros;


 INSERT INTO libros
 VALUES (1, 'El aleph', 'Borges', 'Emece', 25, 100, 'Argentina');

 INSERT INTO libros
 VALUES (2, 'Java en 10 minutos', 'Mario Molina', 'Siglo XXI', 50.40, 100, 'México');

 INSERT INTO libros
 VALUES (3, 'Alicia en el pais de las maravillas', 'Lewis Carroll', 'Emece', 15.50, 200, 'Reino Unido');

 INSERT INTO libros
 VALUES (4, 'El pais de las hadas', DEFAULT, 'Emece', 25.50, 150, 'Desconocido');


 -- Mostramos la posición de la primera ocurrencia de la cadena "pais" en los títulos de los libros:

 SELECT CODIGO, TITULO , INSTR (TITULO,'pais') "POSICION"
 FROM LIBROS;
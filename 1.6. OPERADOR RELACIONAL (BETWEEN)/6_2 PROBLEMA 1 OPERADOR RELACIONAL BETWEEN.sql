------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drop table libros;

 create table libros(
  codigo number(5) not null,
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  edicion date,
  precio number(6,2)
 );
 
-- Ingresamos algunos registros:

 insert into libros
  values(1,'El aleph','Borges','Emece','15/01/2000',15.90);
 insert into libros
  values(2,'Cervantes y el quijote','Borges','Paidos',null,null);
 insert into libros
  values(3,'Alicia en el pais de las maravillas','Lewis Carroll',null,'25/03/2000',19.90);
 insert into libros
  values(4,'Martin Fierro','Jose Hernandez','Emece','18/05/2000',25.90);
 insert into libros (codigo,titulo,autor,edicion,precio)
  values(5,'Antología poética','Borges','25/08/2000',32);
 insert into libros (codigo,titulo,autor,edicion,precio)
  values(6,'Java en 10 minutos','Mario Molina','11/02/2007',45.80);
 insert into libros (codigo,titulo,autor,edicion,precio)
  values(7,'Martin Fierro','Jose Hernandez','23/11/2006',40);
 insert into libros (codigo,titulo,autor,edicion,precio)
  values(8,'Aprenda PHP','Mario Molina','01/06/2007',56.50);
  
-- 1. Recuperamos los registros cuyo precio esté entre 20 y 40 empleando "between":
    -- Note que si el campo tiene el valor "null", no aparece en la selección.

 SELECT *
 FROM LIBROS 
    WHERE PRECIO BETWEEN 20 AND 40;

-- 2. Libros cuyo precio NO esté entre un intervalo de valores antecedemos "not" al "between":

 SELECT *
 FROM LIBROS
    WHERE PRECIO NOT BETWEEN 20 AND 40;
    
-- 3. Recuperamos los títulos y edición de los libros cuya fecha de edición se encuentre entre '01/05/2000' y '01/05/2007', ordenados por fecha de edición:

 SELECT TITULO, EDICION
 FROM LIBROS
    WHERE EDICION BETWEEN '01/05/2000' AND '01/05/2007'
 ORDER BY EDICION;
------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
drop table libros;

-- Creamos la tabla:

 create table libros(
  codigo number (5),
  titulo varchar2(40) not null,
  autor varchar2(20),
  editorial varchar2(20),
  precio number(6,2)
 );

-- Ingresamos algunos registros:

 insert into libros
  values(1,'El aleph','Borges','Emece',15.90);
 insert into libros
  values(2,'Cervantes y el quijote','Borges','Paidos',null);
 insert into libros
  values(3,'Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
 insert into libros
  values(4,'Matematica estas ahi','Paenza','Siglo XXI',15);
 insert into libros
  values(5,'Antología poética',default,default,32);
 insert into libros
  values(6,'Martin Fierro','Jose Hernandez',default,40);
 insert into libros
  values(7,'Aprenda PHP','Mario Molina',default,56.50);
  
-- 1. Recuperamos los libros cuyo autor es "Paenza" o "Borges":

 SELECT  TITULO, AUTOR
 FROM LIBROS 
    WHERE AUTOR  IN ('Paenza' , 'Borges');
    
-- 2. Recuperamos los libros cuyo autor NO es "Paenza" ni "Borges":

 SELECT TITULO, AUTOR
 FROM LIBROS 
    WHERE AUTOR NOT IN ('Paenza' , 'Borges');
    
-- 3. Recuperamos los libros cuyo código se encuentre en la siguiente lista de valores (1,3,5,7,9):

 SELECT *
 FROM LIBROS
    WHERE CODIGO IN (1,3,5,7,9);
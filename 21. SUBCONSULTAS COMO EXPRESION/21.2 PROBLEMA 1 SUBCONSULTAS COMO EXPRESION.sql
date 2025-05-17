------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Trabajamos con la tabla "libros" de una librería.

Eliminamos la tabla y la creamos:

 drop table libros;

 create table libros(
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(5,2)
 );
 
Ingresamos los siguientes registros:

 insert into libros values(1,'Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros values(2,'Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros values(3,'Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros values(4,'El aleph','Borges','Emece',10.00);
 insert into libros values(5,'Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros values(6,'Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros values(7,'Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros values(8,'Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros values(9,'Uno','Richard Bach','Planeta',10.00);
 
1. Muéstrame el título, precio y la diferencia entre este precio y el precio más alto de todos los libros, pero solo para el libro que se titula exactamente 'Uno'.
 
 SELECT  TITULO,PRECIO, PRECIO-(SELECT MAX(PRECIO) FROM LIBROS) "DIFERENCIA DE PRECIO"
 FROM LIBROS
    WHERE TITULO='Uno';

2. Muéstrame el título, autor y precio del libro o libros que tienen el precio más alto de todos los libros en la base de datos

 SELECT TITULO, AUTOR , PRECIO
 FROM LIBROS 
    WHERE PRECIO =
        (SELECT MAX(PRECIO) 
            FROM LIBROS);
            
3. Actualiza a 45 el precio de todos los libros que actualmente tienen el precio más alto en la base de datos.

 UPDATE 
 LIBROS SET PRECIO=45
    WHERE PRECIO =
        (SELECT MAX(PRECIO) 
        FROM LIBROS);
 
4.  Elimina de la tabla de libros todos los registros que tienen el precio más bajo actualmente en la base de datos.

 DELETE 
 FROM LIBROS
    WHERE PRECIO = 
        (SELECT MIN(PRECIO)
        FROM LIBROS);
 
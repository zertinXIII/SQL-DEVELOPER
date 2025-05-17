------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Tenemos la tabla "libros" de una librería y queremos crear una tabla llamada "editoriales" que contenga los nombres de las editoriales.

Eliminamos las tablas "libros" y "editoriales":

 drop table libros;
 drop table editoriales;
 
Creamos la tabla "libros":

 create table libros( 
  codigo number(5),
  titulo varchar2(40) not null,
  autor varchar2(30),
  editorial varchar2(20),
  precio number(5,2),
  primary key(codigo)
 ); 
 
Ingresamos algunos registros;

 insert into libros values(1,'Uno','Richard Bach','Planeta',15);
 insert into libros values(2,'El aleph','Borges','Emece',25);
 insert into libros values(3,'Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros values(4,'Aprenda PHP','Mario Molina','Nuevo siglo',45);
 insert into libros values(5,'Ilusiones','Richard Bach','Planeta',14);
 insert into libros values(6,'Java en 10 minutos','Mario Molina','Nuevo siglo',50);
 
1. Crea una lista de todas las editoriales diferentes que existen en la tabla de libros

 REATE TABLE EDITORIALES AS
    (SELECT DISTINCT EDITORIAL "NOMBRE"
    FROM LIBROS);
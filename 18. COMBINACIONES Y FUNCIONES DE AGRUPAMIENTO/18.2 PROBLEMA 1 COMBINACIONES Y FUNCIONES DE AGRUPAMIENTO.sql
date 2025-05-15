------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

Eliminamos ambas tablas y las creamos:

 drop table libros;
 drop table editoriales;

 create table libros(
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30),
  codigoeditorial number(3),
  precio number(5,2),
  primary key(codigo)
 );

 create table editoriales(
  codigo number(3),
  nombre varchar2(20),
  primary key (codigo)
);

Ingresamos algunos registros en ambas tablas:

 insert into editoriales values(1,'Planeta');
 insert into editoriales values(2,'Emece');
 insert into editoriales values(3,'Siglo XXI');

 insert into libros values(100,'El aleph','Borges',1,20);
 insert into libros values(200,'Martin Fierro','Jose Hernandez',1,30);
 insert into libros values(300,'Aprenda PHP','Mario Molina',3,50);
 insert into libros values(400,'Uno','Richard Bach',3,15);
 insert into libros values(500,'Java en 10 minutos',default,4,45);
 
1. Muéstrame el nombre de cada editorial junto con la cantidad de libros que ha publicado, agrupando los resultados por editorial.

 SELECT E.NOMBRE "EDITORIAL", COUNT(L.TITULO)
 FROM EDITORIALES E
 JOIN LIBROS L
    ON E.CODIGO=L.CODIGOEDITORIAL
        GROUP BY E.NOMBRE;

2. Muéstrame el nombre de cada editorial junto con el precio más alto entre todos sus libros, incluyendo también las editoriales que no tienen libros publicados

 SELECT E.NOMBRE "EDITORIAL", MAX(L.PRECIO) "PRECIO MAS ALTO"
 FROM EDITORIALES E
 JOIN LIBROS L
    ON E.CODIGO=L.CODIGOEDITORIAL
        GROUP BY E.NOMBRE;


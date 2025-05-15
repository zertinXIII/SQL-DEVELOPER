------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".
Eliminamos ambas tablas, las creamos y agregamos dos restricciones "primary key" sobre los campos "codigo" de las dos tablas:

 drop table libros;
 drop table editoriales;

 create table libros(
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30),
  codigoeditorial number(3)
 );
 create table editoriales(
  codigo number(3),
  nombre varchar2(20)
);

 alter table libros
  add constraint PK_libros
  primary key(codigo);

 alter table editoriales
  add constraint PK_editoriales
  primary key(codigo);
  
Ingresamos algunos registros en ambas tablas:

 insert into editoriales values(1,'Planeta');
 insert into editoriales values(2,'Emece');
 insert into editoriales values(3,'Siglo XXI');
 insert into editoriales values(4,'Norma');

 insert into libros values(100,'El aleph','Borges',1);
 insert into libros values(101,'Martin Fierro','Jose Hernandez',1);
 insert into libros values(102,'Aprenda PHP','Mario Molina',2);
 insert into libros values(103,'Java en 10 minutos',null,4);
 insert into libros values(104,'El anillo del hechicero','Carol Gaskin',4);
 
1. Muéstrame el título de los libros y el nombre de las editoriales (llamando 'editorial' a esta columna), tomando todos los registros de la tabla de editoriales
(incluso si no tienen libros asociados) y combinándolos con los libros que coincidan en el código de editorial

 SELECT L.TITULO, E.NOMBRE "EDITORIAL"
 FROM LIBROS L
 RIGHT JOIN EDITORIALES E
    ON L.CODIGOEDITORIAL=E.CODIGO;
    
2. Muéstrame el título de los libros y el nombre de las editoriales (llamando 'editorial' a esta columna), tomando todos los registros de la tabla de editoriales (e) y combinándolos con los libros (l) 
que compartan el mismo código de editorial, pero SOLO CUANDO EXISTA un libro asociado a la editorial.

 SELECT L.TITULO, E.NOMBRE "EDITORIAL"
 FROM LIBROS L
 RIGHT JOIN EDITORIALES E
    ON E.CODIGO=L.CODIGOEDITORIAL
        WHERE L.CODIGOEDITORIAL IS NOT NULL;

3. Muéstrame el nombre de las editoriales que NO tienen ningún libro asociado en la tabla de libros.

 SELECT E.NOMBRE
 FROM LIBROS L
 RIGHT JOIN EDITORIALES E
    ON  L.CODIGOEDITORIAL=E.CODIGO
        WHERE L.CODIGOEDITORIAL IS NULL;


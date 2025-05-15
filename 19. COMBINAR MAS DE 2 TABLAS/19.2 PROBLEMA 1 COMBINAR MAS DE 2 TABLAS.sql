------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena la información de sus libros para la venta en tres tablas, "libros", "autores" y "editoriales".

Eliminamos ambas tablas y las creamos:

  drop table libros;
  drop table autores;
  drop table editoriales;

 create table libros(
  codigo number(5),
  titulo varchar2(40),
  codigoautor number(4) not null,
  codigoeditorial number(3),
  primary key(codigo)
 );

 create table autores(
  codigo number(4),
  nombre varchar2(20),
  primary key (codigo)
 );

 create table editoriales(
  codigo number(3),
  nombre varchar2(20),
  primary key (codigo)
 );
 
Ingresamos algunos registros:

 insert into editoriales values(1,'Planeta');
 insert into editoriales values(2,'Emece');
 insert into editoriales values(3,'Siglo XXI');
 insert into editoriales values(4,'Norma');
 
 insert into autores values (1,'Richard Bach');
 insert into autores values (2,'Borges');
 insert into autores values (3,'Jose Hernandez');
 insert into autores values (4,'Mario Molina');
 insert into autores values (5,'Paenza');
 
 insert into libros values(100,'El aleph',2,2);
 insert into libros values(101,'Martin Fierro',3,1);
 insert into libros values(102,'Aprenda PHP',4,3);
 insert into libros values(103,'Uno',1,1);
 insert into libros values(104,'Java en 10 minutos',0,3);
 insert into libros values(105,'Matematica estas ahi',10,null);
 insert into libros values(106,'Java de la A a la Z',4,0);
 
1.  Muéstrame el título (LIBROS) de los libros junto con el nombre de su autor (AUTORES) y el nombre de su editorial (EDITORIAL), combinando información de las tres tablas (libros, autores y editoriales).

 SELECT  L.TITULO, A.NOMBRE "AUTOR", E.NOMBRE "EDITORIAL"
 FROM AUTORES A
  JOIN  LIBROS L
    ON A.CODIGO=L.CODIGOAUTOR
 JOIN EDITORIALES E
    ON L.CODIGOEDITORIAL=E.CODIGO;
    
    
2. Muéstrame todos los libros con su título (LIBROS), el nombre de su autor (si tiene uno asignado) (AUTORES) y el nombre de su editorial (si tiene una asignada) . 
Incluye todos los libros aunque no tengan autor o editorial registrados. (EDITORIAL)

 SELECT  L.TITULO, A.NOMBRE "AUTOR", E.NOMBRE "EDITORIAL"
 FROM AUTORES A
 RIGHT JOIN  LIBROS L
    ON A.CODIGO=L.CODIGOAUTOR
 LEFT JOIN EDITORIALES E
    ON L.CODIGOEDITORIAL=E.CODIGO;

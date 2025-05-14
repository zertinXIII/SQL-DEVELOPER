------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".
Eliminamos ambas tablas:

  drop table libros;
  drop table editoriales;

Creamos las tablas:

 create table libros(
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30),
  codigoeditorial number(3)
 );
 
 create table editoriales(
  codigo number(3),
  nombre varchar2(20),
  direccion varchar2(40),
  primary key (codigo)
);

Ingresamos algunos registros en ambas tablas:

 insert into editoriales values(1,'Planeta','Colon 120');
 insert into editoriales values(2,'Emece','Estrada 356');
 insert into editoriales values(3,'Siglo XXI','General Paz 700');

 insert into libros values(100,'El aleph','Borges',1);
 insert into libros values(200,'Martin Fierro','Jose Hernandez',2);
 insert into libros values(300,'Aprenda PHP','Mario Molina',3);
 insert into libros values(400,'Java en 10 minutos',null,5);
 insert into libros values(500,'Matematica estas ahi','Paenza',null);
 
1. Recuperar los datos de libros:

SELECT *
FROM LIBROS;

Vemos que en el campo "editorial" aparece el código, pero no sabemos el nombre de la editorial y su dirección. Realizamos un join para obtener datos de ambas tablas
(titulo, autor y nombre de la editorial):

SELECT TITULO,AUTOR,NOMBRE,DIRECCION
FROM LIBROS
    JOIN EDITORIALES
    ON CODIGOEDITORIAL=EDITORIALES.CODIGO;

2. Mostrar el código del libro, título, autor, nombre de la editorial y su dirección realizando un join y empleando alias:

SELECT L.CODIGO, TITULO , AUTOR, NOMBRE, DIRECCION
FROM LIBROS L
    JOIN EDITORIALES E
    ON CODIGOEDITORIAL=E.CODIGO;

3. Realizamos la misma consulta anterior y obtener solamente los libros de la editorial "Siglo XXI": ((USAREMOS UN WHERE))

SELECT L.CODIGO, TITULO , AUTOR, NOMBRE, DIRECCION
FROM LIBROS L
    JOIN EDITORIALES E
    ON CODIGOEDITORIAL=E.CODIGO
        WHERE E.NOMBRE='Siglo XXI';

4. Obtener título, autor y nombre de la editorial, esta vez ordenados por título:

SELECT TITULO,AUTOR,NOMBRE
FROM LIBROS L
    JOIN EDITORIALES E
    ON CODIGOEDITORIAL=E.CODIGO
    ORDER BY TITULO;
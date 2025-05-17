------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Trabajamos con las tablas "libros" y "editoriales" de una librería.
Eliminamos las tablas y las creamos:

 drop table libros;
 drop table editoriales;

 create table editoriales(
  codigo number(3),
  nombre varchar2(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30),
  codigoeditorial number(3),
  primary key(codigo),
 constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
 );
 
Ingresamos algunos registros:

 insert into editoriales values(1,'Planeta');
 insert into editoriales values(2,'Emece');
 insert into editoriales values(3,'Paidos');
 insert into editoriales values(4,'Siglo XXI');

 insert into libros values(100,'Uno','Richard Bach',1);
 insert into libros values(101,'Ilusiones','Richard Bach',1);
 insert into libros values(102,'Aprenda PHP','Mario Molina',4);
 insert into libros values(103,'El aleph','Borges',2);
 insert into libros values(104,'Puente al infinito','Richard Bach',2);
 

1. Seleccionar los nombres de las editoriales que han publicado libros cuyo autor es 'Richard Bach'.

 -------- SUBSELECT ---------

 SELECT E.NOMBRE "NOMBRE EDITORIAL"
 FROM EDITORIALES E
    WHERE E.CODIGO IN 
        (SELECT L.CODIGOEDITORIAL
            FROM LIBROS L
                WHERE L.AUTOR='Richard Bach');

 -------- JOIN ---------
 
 SELECT DISTINCT E.NOMBRE "NOMBRE EDITORIAL"
 FROM EDITORIALES E
    JOIN LIBROS L ON
        E.CODIGO= L.CODIGOEDITORIAL
            WHERE L.AUTOR='Richard Bach';

 -------- RIGHT JOIN ---------

 SELECT DISTINCT E.NOMBRE "NOMBRE EDITORIAL"
 FROM LIBROS L
    RIGHT JOIN EDITORIALES E 
    ON L.CODIGOEDITORIAL=E.CODIGO
            WHERE L.AUTOR='Richard Bach';

 -------- LEFT JOIN ---------
 
 SELECT DISTINCT E.NOMBRE "NOMBRE EDITORIAL"
 FROM EDITORIALES E
    LEFT JOIN LIBROS L 
    ON E.CODIGO= L.CODIGOEDITORIAL
            WHERE L.AUTOR='Richard Bach'; 
            
2. Seleccionar los nombres de las editoriales que NO han publicado ningún libro del autor 'Richard Bach'.

 -------- SUBSELECT ---------

 SELECT E.NOMBRE "NOMBRE EDITORIALES"
 FROM EDITORIALES E 
    WHERE CODIGO NOT IN 
        (SELECT L.CODIGOEDITORIAL
         FROM LIBROS L
            WHERE L.AUTOR='Richard Bach');
            
 -------- LEFT JOIN ---------

 SELECT DISTINCT E.NOMBRE "NOMBRE EDITORIALES"
 FROM EDITORIALES E
    LEFT JOIN LIBROS L 
    ON E.CODIGO=L.CODIGOEDITORIAL AND L.AUTOR='Richard Bach' 
             WHERE L.CODIGOEDITORIAL IS NULL;
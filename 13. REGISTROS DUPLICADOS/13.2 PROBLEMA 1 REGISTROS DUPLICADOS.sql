------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Eliminamos la tabla:

  drop table libros;
Creamos la tabla:

 create table libros(
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(15)
 );
 
Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Planeta');
 insert into libros
  values('Martin Fierro','Jose Hernandez','Emece');
 insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros
  values('Antologia poetica','Borges','Planeta');
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros
  values('Aprenda PHP','Lopez','Emece');
 insert into libros
  values('Manual de PHP', 'J. Paez', null);
 insert into libros
  values('Cervantes y el quijote',null,'Paidos');
 insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
 insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
 insert into libros
  values('PHP de la A a la Z',null,null);
 insert into libros
  values('Uno','Richard Bach','Planeta');
  
1. Obtener la lista de autores sin repetición. 

 SELECT DISTINCT AUTOR 
 FROM LIBROS; 

-- aparece "null" como un valor para "autor"

2. aparece "null" como un valor para "autor"

 SELECT DISTINCT AUTOR 
 FROM LIBROS 
    WHERE AUTOR IS NOT NULL;
    
3. CONTAR los distintos autores.

 SELECT COUNT (DISTINCT AUTOR)
 FROM LIBROS;

4. Queremos los nombres de las editoriales sin repetir.

 SELECT DISTINCT EDITORIAL
 FROM LIBROS;

5. Queremos saber la cantidad de editoriales distintas:

 SELECT COUNT (DISTINCT EDITORIAL)
 FROM LIBROS;

4. Obtener los distintos autores de la editorial "Planeta":

 SELECT DISTINCT AUTOR 
 FROM LIBROS 
    WHERE EDITORIAL='Planeta';

5. Contamos los distintos autores que tiene cada editorial empleando "group by":

 SELECT EDITORIAL,COUNT (DISTINCT AUTOR)
 FROM LIBROS
    GROUP BY EDITORIAL;
    
6. Mostramos los títulos y editoriales de los libros sin repetir títulos ni editoriales:

 SELECT DISTINCT TITULO, EDITORIAL
 FROM LIBROS
 ORDER BY TITULO;
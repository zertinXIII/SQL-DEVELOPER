------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".
Eliminamos ambas tablas, las creamos y agregamos a cada una de ellas restricciones únicas para los campos "codigo" de ambas tablas:

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
  nombre varchar2(20),
  direccion varchar2(40)
);
 
 alter table editoriales
  add constraints UQ_editoriales_codigo
  unique (codigo);

 alter table libros
  add constraints UQ_libros_codigo
  unique (codigo);
  
Ingresamos algunos registros en ambas tablas:

 insert into editoriales values(1,'Planeta','Colon 120');
 insert into editoriales values(2,'Emece','Estrada 356');
 insert into editoriales values(3,'Siglo XXI','General Paz 700');
 insert into editoriales values(null,'Sudamericana','Copiapo 343');
 insert into editoriales values(null,'Norma','Bulnes 123');

 insert into libros values(100,'El aleph','Borges',1);
 insert into libros values(200,'Martin Fierro','Jose Hernandez',1);
 insert into libros values(300,'Aprenda PHP','Mario Molina',2);
 insert into libros values(400,'Java en 10 minutos',default,4);
 insert into libros values(500,'El quijote de la mancha','Cervantes',null);
 
 
 
1. Muéstrame todas las editoriales con sus libros correspondientes, incluyendo las editoriales que no tengan libros registrados.
 
 SELECT NOMBRE "EDITORIAL",TITULO 
 FROM EDITORIALES E 
    LEFT JOIN LIBROS L
    ON CODIGOEDITORIAL=E.CODIGO

2.Muéstrame todos los libros con sus editoriales, incluyendo los libros que no tengan editorial registrada.

 SELECT TITULO ,NOMBRE "EDITORIAL"
 FROM LIBROS L
    LEFT JOIN EDITORIALES E
    ON CODIGOEDITORIAL=E.CODIGO;
    
3. Mostrar todos los libros con el nombre de su editorial correspondiente, incluyendo los libros que no tengan editorial asignada.

 SELECT TITULO,NOMBRE  "EDITORIAL"
 FROM EDITORIALES E
    LEFT JOIN LIBROS L
        ON E.CODIGO=CODIGOEDITORIAL
            WHERE CODIGOEDITORIAL IS NOT NULL;

4. Muéstrame el nombre de las editoriales que no tienen ningún libro registrado en la base de datos.

 SELECT NOMBRE "EDITORIALES"
 FROM EDITORIALES E
    LEFT JOIN LIBROS L
    ON E.CODIGO=L.CODIGOEDITORIAL
    WHERE L.CODIGOEDITORIAL IS NOT NULL;
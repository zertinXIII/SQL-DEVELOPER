----------------------------------- PROCEDIMIENTOS ALMACENADOS (VARIABLES) ----------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------- RESUMEN DE COMANDOS ----------------------------------------------------------------

Los procedimientos almacenados pueden contener en su definición, variables locales, que existen durante el procedimiento.

La sintaxis para declarar variables dentro de un procedimiento almacenado es la siguiente:

 create or replace procedure NOMBREPROCEDIMIENTO (PARAMETRO in TIPODEDATO)
  as
   NOMBREVARIABLE TIPO;
  begin
   INSTRUCCIONES; 
  end;
  /
  
Las variables se definen antes del bloque de sentencias; pueden declararse varias.

Creamos un procedimiento que recibe el nombre de un libro, en una variable guardamos el nombre del autor de tal libro, luego buscamos todos los libros de ese autor y los almacenamos en una tabla:

create or replace procedure pa_autorlibro(atitulo in varchar2)
 as
   vautor varchar2(20);
 begin
  select autor into vautor from libros where titulo=atitulo;
  insert into tabla1
   select titulo,precio
   from libros
   where autor=vautor;
 end;
 /
 
Ejecutamos el procedimiento: execute pa_autorlibro('Ilusiones');

Luego de definir un parámetro y su tipo, opcionalmente, se puede especificar un valor por defecto; tal valor es el que asume el procedimiento al ser ejecutado si no recibe parámetros. 
Si no se coloca valor por defecto, un procedimiento definido con parámetros no puede ejecutarse sin valores para ellos.

La tabla1 debe existir cuando llamamos al procedimiento almacenado. La creamos con la siguiente estructura:

 drop table tabla1;
 
 create table tabla1( 
   titulo varchar2(40),
   precio number(6,2)
  );
 
Ingresemos el siguiente lote de comandos en el Oracle SQL Developer:

Eliminamos la tabla libros:

 drop table libros;

Creamos una tabla libros:

 create table libros(
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(5,2)
 );

Eliminamos la tabla tabla1:

 drop table tabla1;
 
Creamos una tabla tabla1:

 create table tabla1( 
   titulo varchar2(40),
   precio number(6,2)
  );


 insert into libros values ('Uno','Richard Bach','Planeta',15);
 insert into libros values ('Ilusiones','Richard Bach','Planeta',12);
 insert into libros values ('El aleph','Borges','Emece',25);
 insert into libros values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
 insert into libros values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros values ('Puente al infinito','Bach Richard','Sudamericana',14);
 insert into libros values ('Antología','J. L. Borges','Paidos',24);
 insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
 insert into libros values ('Cervantes y el quijote','Borges- Casares','Planeta',34);


1. Creamos un procedimiento que recibe el nombre de un libro, en una variable guardamos el nombre del autor de tal libro, luego buscamos todos los libros de ese autor y los almacenamos en una tabla:

 create or replace procedure pa_autorlibro(atitulo in varchar2)
 as
   vautor varchar2(20);
 begin
 --- aqui vamos a buscar al autor del libro que metamos ---
  select autor into vautor 
  from libros 
    where titulo=atitulo;
    
 --- aqui una vez encontrado lo metemos en la tabla y buscamos el resto de titulos de ese mismo autor ---
  insert into tabla1
   select titulo,precio
   from libros
    where autor=vautor;
 end;
 /
 
2. EJECUTAMOS EL  PROCEDIMIENTO metiendo el  titulo de algún libro.

 EXECUTE pa_autorlibro('Uno');

3. Comprobamos que funciona. 

tenemos que tener en cuenta que nuestro  procedimiento funciona en dos partes , el primero busca el autor, y con el autor conocido se introduce para buscar otros libro suyos.

 select * 
 from tabla1;

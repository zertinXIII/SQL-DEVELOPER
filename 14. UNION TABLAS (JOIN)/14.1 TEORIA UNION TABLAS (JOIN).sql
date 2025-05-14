-----------------------------------------------------------UNION TABLAS (JOIN) ------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------- RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

Hasta el momento hemos trabajado con una sola tabla, pero generalmente, se trabaja con más de una.

Para evitar la repetición de datos y ocupar menos espacio, se separa la información en varias tablas. Cada tabla almacena parte de la información que necesitamos registrar.

Por ejemplo, los datos de nuestra tabla "libros" podrían separarse en 2 tablas, una llamada "libros" y otra "editoriales" que guardará la información de las editoriales. 
En nuestra tabla "libros" haremos referencia a la editorial colocando un código que la identifique. Veamos:

 create table libros(
  codigo number(4),
  titulo varchar2(40) not null,
  autor varchar2(30),
  codigoeditorial number(3) not null,
  precio number(5,2),
  primary key (codigo)
 );

 create table editoriales(
  codigo number(3),
  nombre varchar2(20) not null,
  direccion varchar2(40),
  primary key(codigo)
 );
 
De esta manera, evitamos almacenar tantas veces los nombres de las editoriales y su dirección en la tabla "libros" y guardamos el nombre y dirección en la tabla "editoriales"; para indicar la editorial de cada libro agregamos un campo que hace referencia al código de la editorial en la tabla "libros" y en "editoriales".

Al recuperar los datos de los libros con la siguiente instrucción:

 select* 
 from libros;
 
vemos que en el campo "editorial" aparece el código, pero no sabemos el nombre de la editorial. Para obtener los datos de cada libro, incluyendo el nombre de la editorial y su dirección, 
necesitamos consultar ambas tablas, traer información de las dos.

Cuando obtenemos información de más de una tabla decimos que hacemos un "join" (combinación).

Veamos un ejemplo:

 select * 
 from libros
  join editoriales
  on libros.codigoeditorial=editoriales.codigo;
  
Resumiendo: si distribuimos la información en varias tablas evitamos la redundancia de datos y ocupamos menos espacio físico en el disco. Un join es una operación que relaciona dos o más tablas para obtener un resultado que incluya datos (campos y registros) de ambas; las tablas participantes se combinan según los campos comunes a ambas tablas.

Hay tres tipos de combinaciones. En los siguientes capítulos explicamos cada una de ellas.
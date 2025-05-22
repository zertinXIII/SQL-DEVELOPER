------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y en una tabla "ofertas", algunos datos de los libros cuyo precio no supera los $30. 

Además, controla las inserciones que los empleados realizan sobre "ofertas", almacenando en la tabla "control" el nombre del usuario, la fecha y hora,
cada vez que se ingresa un nuevo registro en la tabla "ofertas".

Creamos un desencadenador que se dispara una vez por cada registro ingresado en la tabla "ofertas":

Eliminamos las tres tablas:

 drop table libros;
 drop table ofertas;
 drop table control;
 
Creamos las tablas con las siguientes estructuras:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table ofertas(
  titulo varchar2(40),
  autor varchar2(30),
  precio number(6,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );
 
1. Establecemos el formato de fecha para que muestre "DD/MM/YYYY HH24:MI":

    ALTER SESSION SET NLS_DATE_FORMAT= 'DD/MM/YYYY HH24:MI';
 
2. Creamos un disparador que se dispare una vez por cada registro ingresado en "ofertas"; el trigger debe ingresar en la tabla "control", el nombre del usuario, la fecha y la hora 
en la cual se realizó un "insert" sobre "ofertas":

    CREATE OR REPLACE TRIGGER TR_INGRESAR_OFERTAS
        BEFORE INSERT
        ON OFERTAS
        FOR EACH ROW
    BEGIN
        INSERT INTO CONTROL VALUES (USER,SYSDATE);
    END TR_INGRESAR_OFERTAS;
    /

2.1 Veamos qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado:

    SELECT *
    FROM USER_TRIGGERS
        WHERE TRIGGER_NAME='TR_INGRESAR_OFERTAS';
        
Ingresamos algunos registros en "libros":

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(102,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(105,'El aleph','Borges','Emece',32);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 
3. Ingresamos en "ofertas" los libros de "libros" cuyo precio no superen los $30, utilizando la siguiente sentencia:

    INSERT INTO OFERTAS
    SELECT TITULO,AUTOR,PRECIO
    FROM LIBROS
        WHERE PRECIO<30;
        
Verificamos que el trigger se disparó 2 veces, una por cada fila afectada en la sentencia "insert" anteriormente ejecutada; consultamos la tabla "control":

    SELECT *
    FROM CONTROL;
    
Si el trigger hubiese sido creado a nivel de sentencia, no de fila, el "insert" anterior se hubiese activado una sola vez aun cuando se ingresaron 2 registros.
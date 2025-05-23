------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y controla las acciones que los empleados realizan sobre dicha tabla almacenando en la tabla "control" 
el nombre del usuario y la fecha, cada vez que se modifica un registro en la tabla "libros".

Eliminamos la tabla "libros" y la tabla "control":

 drop table libros;
 drop table control;
 
Creamos la tabla con la siguiente estructura:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );
 
Creamos la tabla "control":

 create table control(
  usuario varchar2(30),
  fecha date
 );
 
Ingresamos algunos registros en "libros":

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 
Establecemos el formato de fecha para que muestre "DD/MM/YYYY HH24:MI":

 alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
 
1. Creamos un disparador a nivel de sentencia, que se dispare cada vez que se actualice un registro en "libros"; el trigger debe ingresar en la tabla "control", el nombre del usuario, 
la fecha y la hora en la cual se realizó un "update" sobre "libros":

    CREATE OR REPLACE TRIGGER TR_ACTUALIZAR_LIBROS
        BEFORE UPDATE
        ON LIBROS
    BEGIN 
        INSERT INTO CONTROL VALUES (USER,SYSDATE);
    END TR_ACTUALIZAR_LIBROS;
    /
    
1.1 Veamos qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado:

    SELECT *
    FROM USER_TRIGGERS 
        WHERE TRIGGER_NAME='TR_ACTUALIZAR_LIBROS';

1.3 Actualizamos un registro en "libros":

    UPDATE 
        LIBROS SET CODIGO=99
            WHERE CODIGO=100;
        
1.4 Veamos si el trigger se disparó consultando la tabla "control":

    SELECT *
    FROM CONTROL;
    
1.5 Actualizamos varios registros de "libros":

    UPDATE 
        LIBROS SET PRECIO=PRECIO+PRECIO*0.1
            WHERE EDITORIAL='Nuevo siglo';

1.6 Veamos si el trigger se disparó consultando la tabla "control":

    SELECT *
    FROM CONTROL;


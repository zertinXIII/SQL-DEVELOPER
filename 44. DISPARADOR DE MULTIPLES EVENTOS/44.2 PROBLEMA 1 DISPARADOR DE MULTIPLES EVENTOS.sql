------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y controla las acciones que los empleados realizan sobre dicha tabla almacenando en la tabla "control"
el nombre del usuario, la fecha, y el tipo de modificación que se realizó sobre la tabla "libros".

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
  fecha date,
  operacion varchar2(20)
 );
 
Ingresamos algunos registros en "libros":

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 
Establecemos el formato de fecha para que muestre "DD/MM/YYYY HH24:MI":

 alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
 
1. Creamos un disparador a nivel de sentencia, que se dispare cada vez que se ingrese, actualice o elimine un registro de la tabla "libros". 
    El trigger ingresa en la tabla "control", el nombre del usuario, la fecha y la hora en la cual se realizó la modificación y el tipo de operación que se realizó:

    - si se realizó una inserción (insert), se almacena "inserción";

    - si se realizó una actualización (update), se almacena "actualización" y

    - si se realizó una eliminación (delete) se almacena "borrado".

    CREATE OR REPLACE TRIGGER TR_CAMBIOS_LIBROS
        BEFORE INSERT OR UPDATE OR DELETE
        ON LIBROS 
        FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            INSERT INTO CONTROL VALUES (USER,SYSDATE,'INSERCION');
        END IF;
        
        IF UPDATING THEN
            INSERT INTO CONTROL VALUES (USER,SYSDATE,'ACTUALIZACION');
        END IF;
        
        IF DELETING THEN
            INSERT INTO CONTROL VALUES (USER,SYSDATE,'BORRADO');
        END IF;
    END TR_CAMBIOS_LIBROS;
    /
        
1.1 Veamos qué nos informa el diccionario "user_triggers" respecto del trigger anteriormente creado:

    SELECT *
    FROM  USER_TRIGGERS
        WHERE TRIGGER_NAME ='TR_CAMBIOS_LIBRO';
        
Ingresamos un registro en "libros":

 insert into libros values(150,'El experto en laberintos','Gaskin','Planeta',23);
 
1.2 Veamos si el trigger se disparó consultando la tabla "control":

    SELECT *
    FROM CONTROL;
    
Vemos que se ingresó un registro que muestra que el usuario "system", el día y hora actual realizó una inserción sobre "libros".

Actualizamos algunos registros de "libros":

     update 
        libros set precio=precio+precio*0.1 
            where editorial='Planeta';

1.3 Veamos si el trigger se disparó consultando la tabla "control":

    SELECT *
    FROM CONTROL;
    
    SELECT *
    FROM LIBROS;
    
Eliminamos un registro de "libros":

     delete 
     from libros 
        where codigo='145';
        
 
1.4 Veamos si el trigger se disparó consultando la tabla "control":

    SELECT *
    FROM CONTROL;

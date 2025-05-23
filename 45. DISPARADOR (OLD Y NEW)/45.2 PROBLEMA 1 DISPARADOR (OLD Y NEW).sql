------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Un comercio almacena los datos de sus artículos para la venta en una tabla denominada "articulos" y controla las operaciones que se realizan en ella guardando ciertos datos en otra tabla denominada "control".

1- Elimine las tablas:

 drop table control;
 drop table articulos;
 
2- Cree las tablas con las siguientes estructuras:

 create table articulos(
  codigo number(6),
  descripcion varchar2(40),
  precio number (6,2),
  stock number(4)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  codigo number(6)
 );
 
3- Ingrese algunos registros en "articulos":

 insert into articulos values(100,'regla 20 cm.',5.4,100);
 insert into articulos values(102,'regla 40 cm.',15,80);
 insert into articulos values(109,'lapices color x12',6,150);
 insert into articulos values(130,'lapices color x6',4.5,100);
 insert into articulos values(200,'compas metal',21.8,50);
 
 
4- Cree un trigger a nivel de fila que se dispara "antes" que se ejecute un "insert" sobre la tabla "articulos". 
En el cuerpo del disparador se debe ingresar en la tabla "control", el nombre del usuario que realizó la inserción, la fecha y el código del articulo que se ha ingresado

    CREATE OR REPLACE TRIGGER TR_INGRESAR_ARTICULO
        BEFORE INSERT
        ON ARTICULOS
        FOR EACH ROW
        BEGIN
            INSERT INTO CONTROL VALUES (USER,SYSDATE, :NEW.CODIGO);
        END TR_INGRESAR_ARTICULO;
        /
        

5- Ingrese un nuevo registro en "articulos"

     insert into articulos values(200,'compas plastico',18.3,50);

6- Vea qué se almacenó en "control"

    SELECT *
    FROM CONTROL;

7- Cree un disparador que calcule el código cada vez que se inserte un nuevo registro

  CREATE OR REPLACE TRIGGER TR_INGRESAR_ARTICULO
        BEFORE INSERT
        ON ARTICULOS
        FOR EACH ROW
        BEGIN
            SELECT MAX(CODIGO)+1 INTO :NEW.CODIGO
                FROM ARTICULOS;
            IF :NEW.CODIGO IS NULL THEN
               :NEW.CODIGO:=1;
            END IF;
        END TR_CODIGO;
        /

8- Ingrese un nuevo registro en "articulos"

 insert into articulos values(200,'cuaderno rayado x12',6,200);

9- Vea qué se almacenó en "articulos".
Note que ignora el valor de código ingresado y calcula el siguiente valor a partir del máximo existente.

    SELECT *
    FROM ARTICULOS;

10- Vea qué se almacenó en "control"

    SELECT *
    FROM CONTROL;
    
11- Ingrese un nuevo artículo sin especificar código

     insert into articulos (descripcion,precio,stock) values('cuaderno liso x12',5.5,200);


12- Vea qué se almacenó en "articulos"

    SELECT *
    FROM ARTICULOS;

13- Vea qué se almacenó en "control"

    SELECT *
    FROM CONTROL;

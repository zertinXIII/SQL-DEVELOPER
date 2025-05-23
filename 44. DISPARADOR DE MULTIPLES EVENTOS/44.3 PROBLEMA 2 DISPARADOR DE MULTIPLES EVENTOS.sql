------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y controla las acciones que los empleados realizan sobre dicha tabla almacenando en la tabla "control" el nombre del usuario y la fecha, cada vez que se modifica el precio o la editorial de un libro.

1- Elimine las tablas:

 drop table control;
 drop table libros;
 
2- Cree las tablas con las siguientes estructuras:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  operacion varchar2(20)
 );
 
3- Ingrese algunos registros en "libros":

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 
4- El gerente permite:

- ingresar o borrar libros de la tabla "libros" unicamente los sábados de 8 a 12 hs.

- actualizar los precios de los libros de lunes a viernes de 8 a 18 hs. y sábados entre la 8 y 12 hs.

Cree un disparador para los tres eventos que controle la hora en que se realizan las operaciones sobre "libros". 
Si se intenta eliminar, ingresar o actualizar registros de "libros" fuera de los días y horarios permitidos, debe aparecer un mensaje de error. 
Si la operación de ingreso, borrado o actualización de registros se realiza, se debe almacenar en "control", el nombre del usuario, la fecha y el tipo de operación ejecutada

    CREATE OR REPLACE TRIGGER TR_CAMBIOS_LIBROS
        BEFORE INSERT OR UPDATE OR DELETE
        ON LIBROS 
        FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF ((TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=SPANISH') IN ('SAB')) AND
                (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) BETWEEN 8 AND 11)) THEN
                INSERT INTO CONTROL VALUES (USER,SYSDATE,'INGRESO');
            ELSE
                RAISE_APPLICATION_ERROR(-20000, 'LOS INGRESOS SOLO  LOS SAB. DE 8 A 12 HRS,');
            END IF;
        END IF;
        
        IF DELETING THEN
            IF ((TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=SPANISH') IN ('SAB')) AND
                (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) BETWEEN 8 AND 11)) THEN
                INSERT INTO CONTROL VALUES (USER,SYSDATE,'BORRADO');
            ELSE
                RAISE_APPLICATION_ERROR(-20001, 'LAS ELIMINACIONES SOLO  LOS SAB. DE 8 A 12 HRS,');
            END IF;
        END IF;
        
        IF UPDATING THEN
            IF ((TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=SPANISH') IN ('SAB')) AND
                (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) BETWEEN 8 AND 11)) THEN
                INSERT INTO CONTROL VALUES (USER,SYSDATE,'ACTUALIZACION');
            ELSE
                RAISE_APPLICATION_ERROR(-20002, 'LAS ACTUALIZACIONES SOLO DE L A V DE 8 A 20 o S DE 8 A 12HRS.');
            END IF;
        END IF;
    END TR_CAMBIOS_LIBROS;
    /


5- Cambie la fecha y hora del sistema a "domingo 19 hs.". Intente ingresar un libro
Mensaje de error.



6- Cambie la fecha y hora del sistema a "lunes 10 hs.". Intente ingresar un libro.
Mensaje de error.

7- Cambie la fecha y hora del sistema a "sabado 8 hs.". Ingrese un libro

8- Realice un "select" sobre "libros" y sobre "control" para verificar que se han cargado los datos correspondientes/
Aparece el nuevo libro en "libros" y una fila de "ingreso" en "control".

9- Cambie la fecha y hora del sistema a "domingo 18 hs.". Intente modificar el precio de un libro.
Mensaje de error.

10- Cambie la fecha y hora del sistema a "sabado 15 hs.". Intente modificar el precio de un libro.
Mensaje de error.

11- Cambie la fecha y hora del sistema a "sabado 9 hs.". Actualice el precio de un libro

12- Realice un "select" sobre "libros" y sobre "control" para verificar que se han cargado los datos correspondientes.
Aparece el nuevo precio en "libros" y una nueva fila de "actualización" en "control".

13- Cambie la fecha y hora del sistema a "martes 11:30 hs.". Actualice el precio de un libro

14- Realice un "select" sobre "libros" y sobre "control" para verificar que se han cargado los datos correspondientes.
Aparece el nuevo precio en "libros" y una nueva fila de "actualización" en "control".

15- Cambie la fecha y hora del sistema a "domingo 18:30 hs.". Intente borrar un libro.
Mensaje de error.

16- Cambie la fecha y hora del sistema a "miercoles 15 hs.". Intente borrar un libro.
Mensaje de error.

17- Cambie la fecha y hora del sistema a "sábado 11:55 hs.". Borre un libro

18- Realice un "select" sobre "libros" y sobre "control" para verificar que se han cargado los datos correspondientes.
Se ha eliminado el registro en "libros" y se ha cargado una nueva fila de "borrado" en "control".
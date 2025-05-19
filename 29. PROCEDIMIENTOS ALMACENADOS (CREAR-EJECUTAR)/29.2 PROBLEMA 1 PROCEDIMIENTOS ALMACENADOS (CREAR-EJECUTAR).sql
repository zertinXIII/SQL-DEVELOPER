------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros".

Eliminamos "libros", creamos la tabla y luego ingresamos algunos registros:

 drop table libros;
 
 create table libros(
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(5,2)
 );

insert into libros values('Uno','Richard Bach','Planeta',15);
insert into libros values('Ilusiones','Richard Bach','Planeta',18);
insert into libros values('El aleph','Borges','Emece',25);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45);
insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',12);
insert into libros values('Java en 10 minutos','Mario Molina','Paidos',35);
 
1. La librería, frecuentemente, aumenta los precios de los libros en un 10%. 
 Necesitamos un procedimiento almacenado que actualice los precios de los libros aumentándolos en un 10%:
 
 CREATE OR REPLACE PROCEDURE PA_LIBROS_AUMENTAR10 AS
    BEGIN
        UPDATE LIBROS SET PRECIO=PRECIO+(PRECIO*0.1);
    END;
    /

2. EJECUTA EL PROCEDIMIENTO

 EXECUTE PA_LIBROS_AUMENTAR10;

3. Verificar que los precios han aumentado. 

 SELECT *
 FROM LIBROS;
 
4.  Volvemos a ejecutar el procedimiento:

 EXECUTE PA_LIBROS_AUMENTAR10;

5. Verificamos que los precios han aumentado nuevamente:

 SELECT *
 FROM LIBROS;
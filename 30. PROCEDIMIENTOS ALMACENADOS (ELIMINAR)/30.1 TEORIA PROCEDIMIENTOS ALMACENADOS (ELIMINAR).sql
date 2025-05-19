--------------------------------------------- PROCEDIMIENTOS ALMACENADOS (ELIMINAR) ----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------

Los procedimientos almacenados se eliminan con "drop procedure". Sintaxis:

 drop procedure NOMBREPROCEDIMIENTO;
Eliminamos el procedimiento almacenado llamado "pa_libros_aumentar10":

 drop procedure pa_libros_aumentar10;
Si el procedimiento que queremos eliminar no existe, aparece un mensaje de error indicando tal situación.

Podemos eliminar una tabla referenciada en un procedimiento almacenado, Oracle lo permite, pero luego, al ejecutar el procedimiento, aparecerá un mensaje de error porque la tabla referenciada no existe.

Si al crear un procedimiento almacenado colocamos "create or replace procedure...", el nuevo procedimiento reemplaza al anterior.

Ingresemos el siguiente lote de comandos en el Oracle SQL Developer:
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

-- La librería, frecuentemente, aumenta los precios de los libros en un 10%.
-- Necesitamos un procedimiento almacenado que actualice los precios de los
-- libros aumentándolos en un 10%:

 create or replace procedure pa_libros_aumentar10
  as
  begin
   update libros set precio=precio+(precio*0.1);
  end;
  /

-- Lo ejecutamos:
 execute pa_libros_aumentar10;

-- Verificamos que los precios han aumentado:
 select * from libros;

-- Eliminamos el procedimiento almacenado que acabamos de crear
 drop procedure pa_libros_aumentar10;
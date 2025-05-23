------------------------------- DISPARADOR DE ACTUALIZACIONA A NIVEL DE SENTENCIA (UPDATE TRIGGER) -----------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------- RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------

Dijimos que un disparador está asociado a una tabla y a una operación específica (inserción, actualización o borrado).

A continuación veremos la creación de un disparador para el evento de actualización: "update trigger".

La siguiente es la sintaxis para crear un trigger de actualización a nivel de sentencia, que se dispare cada vez que se ejecute una sentencia "update" sobre la tabla especificada,
es decir, cada vez que se intenten modificar datos en la tabla:

 create or replace trigger NOMBREDISPARADOR
  MOMENTO update
  on NOMBRETABLA
  statement
  begin
   CUERPO DEL TRIGGER;
  end NOMBREDISPARADOR;
  /
Luego de la instrucción "create trigger" se coloca el nombre del disparador. Si agregamos "or replace" al momento de crearlo y ya existe un trigger con el mismo nombre, 
tal disparador será borrado y vuelto a crear.

"MOMENTO" indica cuando se disparará el trigger en relación al evento, puede ser BEFORE (antes) o AFTER (después). Se especifica el evento que causa que el trigger se dispare,
en este caso "update", ya que el trigger se activará cada vez que se ejecute la sentencia "update" sobre la tabla especificada luego de "on".

"statement" significa que es un trigger a nivel de sentencia, es decir, se dispara una sola vez por cada sentencia "update", aunque la sentencia modifique varios registros; 
como en cualquier trigger, es el valor por defecto si no se especifica.

Finalmente se coloca el cuerpo del tigger dentro del bloque "begin.. end".

Las siguientes sentencias disparan un trigger de inserción:

 update TABLA set CAMPO=NUEVOVALOR;
 update TABLA set CAMPO=NUEVOVALOR where CONDICION;
 
Ejemplo: Creamos un desencadenador que se dispara cada vez que se ejecuta un "update" sobre la tabla "libros":

 create or replace trigger tr_actualizar_libros
  before update
  on libros
 begin
  insert into control values(user,sysdate);
 end tr_actualizar_libros;
 /
 
Al ocurrir el evento de actualización sobre "libros", se ingresa en la tabla "control" el nombre del usuario que alteró la tabla "libros" (obtenida mediante la función "user") 
y la fecha en que lo hizo (mediante la función "sysdate").
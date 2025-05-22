------------------------------- DISPARADOR DE INSERCION A NIVEL DE SENTENCIA ------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------- RESUMEN DE COMANDOS ---------------------------------------------------------------

Dijimos que un disparador está asociado a una tabla y a una operación específica (inserción, actualización o borrado).

A continuación veremos la creación de un disparador para el evento de inserción: "insert trigger".

La siguiente es la sintaxis para crear un trigger de inserción que se dispare cada vez que se ejecute una sentencia "insert" sobre la tabla especificada, es decir, 
cada vez que se intenten ingresar datos en la tabla:

 create or replace trigger NOMBREDISPARADOR
  MOMENTO insert
  on NOMBRETABLA
  begin
   CUERPO DEL TRIGGER;
  end NOMBREDISPARADOR;
  /

Analizamos la sintaxis:

Luego de la instrucción "create trigger" se coloca el nombre del disparador. Si se agrega "or replace" al momento de crearlo y ya existe un trigger con el mismo nombre, 
tal disparador será borrado y vuelto a crear.

"MOMENTO" indica cuando se disparará el trigger en relación al evento, puede se BEFORE (antes) o AFTER (después). 
Se especifica el evento que causa que el trigger se dispare, en este caso "insert", ya que el trigger se activará cada vez que se ejecute la sentencia "insert" sobre la tabla especificada luego de "on".

Es un trigger a nivel de sentencia, es decir, se dispara una sola vez por cada sentencia "insert", aunque la sentencia ingrese varios registros. Es el valor por defecto si no se especifica.

Finalmente se coloca el cuerpo del trigger dentro del bloque "begin.. end".

Las siguientes sentencias disparan un trigger de inserción:

 insert into TABLA values ...;
 insert into TABLA select ... from...;
 
Ejemplo: Creamos un desencadenador que se dispara cada vez que se ejecuta un "insert" sobre la tabla "libros":

 create or replace trigger tr_ingresar_libros
  before insert
  on libros
 begin
  insert into Control values(user,sysdate);
 end tr_ingresar_libros;
 /
 
Analizamos el trigger anterior:

"create or replace trigger" junto al nombre del disparador que tiene un prefijo "tr" para reconocer que es un trigger, referencia el evento que lo disparará y la tabla asociada.

Para identificar fácilmente los disparadores de otros objetos se recomienda usar un prefijo y darles el nombre de la tabla para la cual se crean junto al tipo de acción.

El disparador se activará antes ("before") del evento "insert" sobre la tabla "libros", es decir, se disparará ANTES que se realice una inserción en "libros".
El trigger está definido a nivel de sentencia, se activa una vez por cada instrucción "insert" sobre "libros". El cuerpo del disparador se delimita con "begin... end", allí se especifican 
las acciones que se realizarán al ocurrir el evento de inserción, en este caso, ingresar en la tabla "control" el nombre del usuario que alteró la tabla "libros" (obtenida mediante la función "user") 
y la fecha en que lo hizo (mediante la función "sysdate").
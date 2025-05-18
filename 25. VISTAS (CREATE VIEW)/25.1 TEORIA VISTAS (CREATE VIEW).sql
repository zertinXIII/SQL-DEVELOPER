---------------------------------------------------------------------------------- VISTAS (CREATE VIEW) ----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS -------------------------------------------------------------------------------------------------------------

Una vista es un objeto. Una vista es una alternativa para mostrar datos de varias tablas; es como una tabla virtual que almacena una consulta. 
Los datos accesibles a través de la vista no están almacenados en la base de datos, en la base de datos se guarda la definición de la vista y no el resultado de ella.

Entonces, una vista almacena una consulta como un objeto para utilizarse posteriormente. Las tablas consultadas en una vista se llaman tablas base. 
En general, se puede dar un nombre a cualquier consulta y almacenarla como una vista.

Una vista suele llamarse también tabla virtual porque los resultados que retorna y la manera de referenciarlas es la misma que para una tabla.

Las vistas permiten:

- simplificar la administración de los permisos de usuario: se pueden dar al usuario permisos para que solamente pueda acceder a los datos a través de vistas, 
en lugar de concederle permisos para acceder a ciertos campos, así se protegen las tablas base de cambios en su estructura.

- mejorar el rendimiento: se puede evitar tipear instrucciones repetidamente almacenando en una vista el resultado de una consulta compleja que incluya información de varias tablas.

Podemos crear vistas con: un subconjunto de registros y campos de una tabla; una unión de varias tablas; una combinación de varias tablas; un subconjunto de otra vista, 
combinación de vistas y tablas.

Una vista se define usando un "create view".

La sintaxis básica para crear una vista es la siguiente:

 create view NOMBREVISTA as
  SUBCONSULTA;
El contenido de una vista se muestra con un "select":

 select *from NOMBREVISTA;
En el siguiente ejemplo creamos la vista "vista_empleados", que es resultado de una combinación en la cual se muestran 4 campos:

 create view vista_empleados as
  select (apellido||' '||e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados e
   join secciones s
   on codigo=seccion;
Para ver la información contenida en la vista creada anteriormente tipeamos:

 select *from vista_empleados;
Podemos realizar consultas a una vista como si se tratara de una tabla:

 select seccion,count(*) as cantidad
  from vista_empleados
  group by seccion;
Los nombres para vistas deben seguir las mismas reglas que cualquier identificador. Para distinguir una tabla de una vista podemos fijar una convención para darle nombres,
por ejemplo, colocar el sufijo “vista” y luego el nombre de las tablas consultadas en ellas.

Los campos y expresiones de la consulta que define una vista DEBEN tener un nombre. Se debe colocar nombre de campo cuando es un campo calculado o 
si hay 2 campos con el mismo nombre. Note que en el ejemplo, al concatenar los campos "apellido" y "nombre" colocamos un alias; si no lo hubiésemos hecho aparecería 
un mensaje de error porque dicha expresión DEBE tener un encabezado, Oracle no lo coloca por defecto.

Los nombres de los campos y expresiones de la consulta que define una vista DEBEN ser únicos (no puede haber dos campos o encabezados con igual nombre). 
Note que en la vista definida en el ejemplo, al campo "s.nombre" le colocamos un alias porque ya había un encabezado (el alias de la concatenación) llamado "nombre" y no pueden repetirse, si sucediera, aparecería un mensaje de error.

Otra sintaxis es la siguiente:

 create view NOMBREVISTA (NOMBRESDEENCABEZADOS)
  as
  SUBCONSULTA;
Creamos otra vista de "empleados" denominada "vista_empleados_ingreso" que almacena la cantidad de empleados por año:

 create view vista_empleados_ingreso (fecha,cantidad)
  as
  select extract(year from fechaingreso),count(*)
   from empleados
   group by extract(year from fechaingreso);
   
La diferencia es que se colocan entre paréntesis los encabezados de las columnas que aparecerán en la vista. Si no los colocamos y empleamos la sintaxis vista anteriormente, 
se emplean los nombres de los campos o alias (que en este caso habría que agregar) colocados en el "select" que define la vista. 
Los nombres que se colocan entre paréntesis deben ser tantos como los campos o expresiones que se definen en la vista.

Las vistas se crean en la base de datos activa.

Al crear una vista, Oracle verifica que existan las tablas a las que se hacen referencia en ella; no se puede crear una vista que referencie tablas inexistentes. 
No se puede crear una vista si existe un objeto con ese nombre.

Se aconseja probar la sentencia "select" con la cual definiremos la vista antes de crearla para asegurarnos que el resultado que retorna es el imaginado.

Una vista siempre está actualizada; si modificamos las tablas base (a las cuales referencia la vista), la vista mostrará los cambios.

Se pueden construir vistas sobre otras vistas.
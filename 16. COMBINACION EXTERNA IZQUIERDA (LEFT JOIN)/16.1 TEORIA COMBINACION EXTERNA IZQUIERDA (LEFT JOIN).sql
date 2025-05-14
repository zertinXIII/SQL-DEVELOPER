--------------------------------------------------------------------- COMBINACION EXTERNA IZQUIERDA (LEFT JOIN) -----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

Vimos que una combinación interna (join) encuentra registros de la primera tabla que se correspondan con los registros de la segunda, es decir, que cumplan la condición del "on" y si un 
valor de la primera tabla no se encuentra en la segunda tabla, el registro no aparece.

Si queremos saber qué registros de una tabla NO encuentran correspondencia en la otra, es decir, no existe valor coincidente en la segunda, necesitamos otro tipo de combinación, 
"outer join" (combinación externa).

Las combinaciones externas combinan registros de DOS TABLAS que cumplen la condición, más los registros de la SEGUNDA TABLA que no la cumplen; es decir, muestran todos los registros de 
las tablas relacionadas, aún cuando no haya valores coincidentes entre ellas.

Este tipo de combinación se emplea cuando se necesita una lista completa de los datos de una de las tablas y la información que cumple con la condición. 

Las combinaciones externas se realizan solamente entre 2 tablas.

Hay tres tipos de combinaciones externas: "left outer join", "right outer join" y "full outer join"; se pueden abreviar con "left join", "right join" y "full join" respectivamente.
Vamos a estudiar las primeras.

Se emplea una combinación externa izquierda para mostrar todos los registros de la tabla de la izquierda. 

Si no encuentra coincidencia con la tabla de la derecha, el registro muestra los campos de la segunda tabla seteados a "null".

En el siguiente ejemplo solicitamos el título y nombre de la editorial de los libros:

 select titulo,nombre
  from editoriales e
  left join libros l
  on codigoeditorial = e.codigo;
  
El resultado mostrará el título y nombre de la editorial; las editoriales de las cuales no hay libros, es decir, cuyo código de editorial no está presente en "libros" aparece en el resultado, pero con el valor "null" en el campo "titulo".

Es importante la posición en que se colocan las tablas en un "left join", la tabla de la izquierda es la que se usa para localizar registros en la tabla de la derecha.

Entonces, un "left join" se usa para hacer coincidir registros en una tabla (izquierda) con otra tabla (derecha); si un valor de la tabla de la izquierda no encuentra coincidencia en la tabla de la derecha, se genera una fila extra (una por cada valor no encontrado) con todos los campos correspondientes a la tabla derecha seteados a "null". La sintaxis básica es la siguiente:

 select CAMPOS
  from TABLAIZQUIERDA
  left join TABLADERECHA
  on CONDICION;
  
En el siguiente ejemplo solicitamos el título y el nombre la editorial, la sentencia es similar a la anterior, la diferencia está en el orden de las tablas:

  select titulo,nombre
  from libros l
  left join editoriales e
  on codigoeditorial = e.codigo;
  
El resultado mostrará el título del libro y el nombre de la editorial; los títulos cuyo código de editorial no está presente en "editoriales" aparecen en el resultado, 
pero con el valor "null" en el campo "nombre".

Un "left join" puede tener clausula "where" que restringa el resultado de la consulta considerando solamente los registros que encuentran coincidencia en la tabla de la derecha, es decir, 
cuyo valor de código está presente en "libros":

 select titulo,nombre
  from editoriales e
  left join libros l
  on e.codigo=codigoeditorial
  where codigoeditorial is not null;
También podemos mostrar las editoriales que NO están presentes en "libros", es decir, que NO encuentran coincidencia en la tabla de la derecha:

 select titulo,nombre
  from editoriales e
  left join libros l
  on e.codigo=codigoeditorial
  where codigoeditorial is null;
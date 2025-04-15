------------------------------------------------- FUNCIONES DE GRUPO ( COUNT - MAX - MIN - SUM - AVG) ----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

Las funciones de grupo operan sobre un conjunto de valores (registros) y retornan un solo valor.

Se pueden usar en una instrucción "select" y combinarlas con la cláusula "group by" (la veremos posteriormente).

Todas estas funciones retornan "null" si ningún registro cumple con la condicion del "where" (excepto "count" que en tal caso retorna cero).

El tipo de dato del campo determina las funciones que se pueden emplear con ellas.

Las relaciones entre las funciones de agrupamiento y los tipos de datos es la siguiente:

- count: se puede emplear con cualquier tipo de dato.

- min y max: con cualquier tipo de dato.

- sum y avg: sólo en campos de tipo numérico.

La función "sum()" retorna la suma de los valores que contiene el campo especificado. 

1. Si queremos saber la cantidad total de libros que tenemos disponibles para la venta, debemos sumar todos los valores del campo "cantidad":

 select sum(cantidad)
 from libros;
  
Para averiguar el valor máximo o mínimo de un campo usamos las funciones "max()" y "min()" respectivamente. 

2. Queremos saber cuál es el mayor precio de todos los libros:

 select max(precio)
 from libros;
  
Entonces, dentro del paréntesis de la función colocamos el nombre del campo del cuál queremos el máximo valor.

La función "avg()" retorna el valor promedio de los valores del campo especificado. 

3. Queremos saber el promedio del precio de los libros referentes a "PHP":

 select avg(precio)
 from libros
  where titulo like '%PHP%';
  
Ahora podemos entender porque estas funciones se denominan "funciones de grupo", porque operan sobre conjuntos de registros, no con datos individuales.

Tratamiento de los valores nulos:

Si realiza una consulta con la función "count" incluyendo entre paréntesis un campo y la tabla contiene 18 registros, 2 de los cuales contienen valor nulo en "precio", el resultado devuelve un total de 16 filas porque no considera aquellos con valor nulo.

Todas las funciones de grupo, excepto "count(*)", excluye los valores nulos de los campos;

"count(*)" cuenta todos los registros, incluidos los que contienen "null".
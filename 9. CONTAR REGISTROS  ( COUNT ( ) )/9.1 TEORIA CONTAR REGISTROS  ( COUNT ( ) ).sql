------------------------------------------------- CONTAR REGISTROS  ( COUNT ( ) ) ----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------------------------------------------------
-- Existen en Oracle funciones que nos permiten contar registros, calcular sumas, promedios, obtener valores máximos y mínimos. 

-- Estas funciones se denominan funciones de grupo y operan sobre un conjunto de valores (registros), no con datos individuales y devuelven un único valor.

-- Imaginemos que nuestra tabla "libros" contiene muchos registros. Para averiguar la cantidad sin necesidad de contarlos manualmente usamos la función "count()":

 select count(*)
  from libros;

-- La función "count()" cuenta la cantidad de registros de una tabla, incluyendo los que tienen valor nulo.

-- También podemos utilizar esta función junto con la clausula "where" para una consulta más específica. 

-- 1. Queremos saber la cantidad de libros de la editorial "Planeta":

 select count(*)
  from libros
  where editorial='Planeta';

-- 2. contar los registros que tienen precio (sin tener en cuenta los que tienen valor nulo), usamos la función "count()" y en los paréntesis colocamos el nombre del campo que necesitamos contar:

 select count(precio)
  from libros;
  
-- Note que "count(*)" retorna la cantidad de registros de una tabla (incluyendo los que tienen valor "null") mientras que "count(precio)" retorna la cantidad de registros en los cuales el campo "precio" no es nulo. 
-- No es lo mismo. "count(*)" cuenta registros, si en lugar de un asterisco colocamos como argumento el nombre de un campo, se contabilizan los registros cuyo valor en ese campo NO es nulo.
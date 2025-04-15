--------------------------------------------------------------------------- AGRUPAR REGISTROS (GROUP BY) -------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

Las funciones de grupo "solas" producen un valor de resumen para todos los registros de un campo.

Podemos generar valores de resumen para un solo campo, combinando las funciones de agregado con la cláusula "group by", que agrupa registros para consultas detalladas.

1. Queremos saber la cantidad de libros de cada editorial, podemos tipear la siguiente sentencia:

 select count(*) 
 from libros
  where editorial='Planeta';
  
y repetirla con cada valor de "editorial":

 select count(*) 
 from libros
  where editorial='Emece';
 
 select count(*) 
 from libros
  where editorial='Paidos';
 ...
Pero hay otra manera, utilizando la cláusula "group by":

1.1 Queremos saber la cantidad de libros de cada editorial 

 select editorial, count(*)
  from libros
  group by editorial;
  
La instrucción anterior solicita que muestre el nombre de la editorial y cuente la cantidad agrupando los registros por el campo "editorial". Como resultado aparecen los nombres de las editoriales y la 
cantidad de registros para cada valor del campo.

Entonces, para saber la cantidad de libros que tenemos de cada editorial, utilizamos la función "count()", agregamos "group by" (que agrupa registros) y el campo por el que deseamos que se realice el
agrupamiento, también colocamos el nombre del campo a recuperar; 

La sintaxis básica es la siguiente:

 select CAMPO, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO;
  
También se puede agrupar por más de un campo, en tal caso, luego del "group by" se listan los campos, separados por comas. Todos los campos que se especifican en la cláusula "group by" deben estar
en la lista de selección.

 select CAMPO1, CAMPO2, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO1,CAMPO2;
  
Para obtener la cantidad libros con precio no nulo, de cada editorial utilizamos la función "count()" enviándole como argumento el campo "precio", agregamos "group by" y el campo por el que deseamos 
que se realice el agrupamiento (editorial):

 select editorial, count(precio)
  from libros
  group by editorial;

La instrucción anterior solicita que muestre el nombre de la editorial y cuente la cantidad agrupando los registros por el campo "editorial". Como resultado aparecen los nombres de las editoriales y la 
cantidad de registros para cada valor del campo.

Entonces, para saber la cantidad de libros que tenemos de cada editorial, utilizamos la función "count()", agregamos "group by" (que agrupa registros) y el campo por el que deseamos que se realice el
agrupamiento, también colocamos el nombre del campo a recuperar; 

La sintaxis básica es la siguiente:

 select CAMPO, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO;
  
También se puede agrupar por más de un campo, en tal caso, luego del "group by" se listan los campos, separados por comas. Todos los campos que se especifican en la cláusula "group by" deben estar
en la lista de selección.

 select CAMPO1, CAMPO2, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO1,CAMPO2;
  
Para obtener la cantidad libros con precio no nulo, de cada editorial utilizamos la función "count()" enviándole como argumento el campo "precio", agregamos "group by" y el campo por el que deseamos 
que se realice el agrupamiento (editorial):

 select editorial, count(precio)
  from libros
  group by editorial;
  
Como resultado aparecen los nombres de las editoriales y la cantidad de registros de cada una, sin contar los que tienen precio nulo.

Recuerde la diferencia de los valores que retorna la función "count()" cuando enviamos como argumento un asterisco o el nombre de un campo:

1º- en el primer caso cuenta todos los registros incluyendo los que tienen valor nulo.
2º- en el segundo, los registros en los cuales el campo especificado es no nulo.


3. Para conocer el total de libros agrupados por editorial:

 select editorial, sum(cantidad)
  from libros
  group by editorial;
  
4. Para saber el máximo y mínimo valor de los libros agrupados por editorial:

 select editorial,max(precio) as mayor,min(precio) as menor
  from libros
  group by editorial;
  
  
5. Para calcular el promedio del valor de los libros agrupados por editorial:

 select editorial, avg(precio)
  from libros
  group by editorial;
  
Es posible limitar la consulta con "where".

Si incluye una cláusula "where", sólo se agrupan los registros que cumplen las condiciones.

6. Vamos a contar y agrupar por editorial considerando solamente los libros cuyo precio sea menor a 30 pesos:

 select editorial, count(*)
  from libros
  where precio<30
  group by editorial;
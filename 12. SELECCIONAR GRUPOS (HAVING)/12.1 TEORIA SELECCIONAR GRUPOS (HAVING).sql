------------------------------------------------------------------------------ SELECCION GRUPOS (HAVING) ----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

1. queremos saber la cantidad de libros agrupados por editorial usamos la siguiente instrucción ya aprendida:

 select editorial, count(*)
 from libros
  group by editorial;
  
2. queremos saber la cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, por ejemplo, los que devuelvan un valor mayor a 2, usamos la siguiente instrucción:

 select editorial, count(*) 
 from libros
  group by editorial
  having count(*)>2;
  
Se utiliza "having", seguido de la condición de búsqueda, para seleccionar ciertas filas retornadas por la cláusula "group by".

Veamos otros ejemplos. 

3. Queremos el promedio de los precios agrupados por editorial, pero solamente de aquellos grupos cuyo promedio supere los 25 pesos:

 select editorial, avg(precio) 
 from libros
  group by editorial
  having avg(precio)>25;
  
En algunos casos es posible confundir las cláusulas "where" y "having".  No debemos confundir la cláusula "where" con la cláusula "having";  

4. Queremos contar los registros agrupados por editorial sin tener en cuenta a la editorial "Planeta".

Analicemos las siguientes sentencias:
Ambas devuelven el mismo resultado, pero son diferentes. 

La primera, selecciona todos los registros rechazando los de editorial "Planeta" y luego los agrupa para contarlos
La primera establece condiciones para la selección de registros de un "select"

 select editorial, count(*) 
 from libros
  where editorial<>'Planeta'
  group by editorial;
  
La segunda, selecciona todos los registros, los agrupa para contarlos y finalmente rechaza fila con la cuenta correspondiente a la editorial "Planeta".
La segunda establece condiciones para la selección de registros de una salida "group by".
  
 select editorial, count(*) 
 from libros
  group by editorial
  having editorial<>'Planeta';
  

Veamos otros ejemplos combinando "where" y "having". 

5. Queremos la cantidad de libros, sin considerar los que tienen precio nulo, agrupados por editorial, sin considerar la editorial "Planeta":

 select editorial, count(*) 
 from libros
  where precio is not null
  group by editorial
  having editorial<>'Planeta';
  
Aquí, selecciona los registros rechazando los que no cumplan con la condición dada en "where", luego los agrupa por "editorial" y finalmente rechaza los grupos que no cumplan con la condición dada en el "having".

Se emplea la cláusula "having" con funciones de grupo, esto no puede hacerlo la cláusula "where". 

6. Queremos el promedio de los precios agrupados por editorial, de aquellas editoriales que tienen más de 2 libros:

 select editorial, avg(precio) 
 from libros
  group by editorial
  having count(*) > 2; 
  
En una cláusula "having" puede haber varias condiciones. Cuando utilice varias condiciones, tiene que combinarlas con operadores lógicos (and, or, not).

7. Podemos encontrar el mayor valor de los libros agrupados y ordenados por editorial y seleccionar las filas que tengan un valor menor a 100 y mayor a 30:

 select editorial, max(precio) as mayor
  from libros
  group by editorial
  having min(precio)<100 and min(precio)>30
  order by editorial; 
 
Entonces, usamos la clausula "having" para restringir las filas que devuelve una salida "group by". Va siempre después de la cláusula "group by" y antes de la cláusula "order by" si la hubiere.

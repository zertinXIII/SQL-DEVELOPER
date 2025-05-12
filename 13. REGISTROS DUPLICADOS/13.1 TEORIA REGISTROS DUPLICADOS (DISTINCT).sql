-------------------------------------------------------------------------- REGISTROS DUPLICADOS (DISTINCT) -----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

Con la cláusula "distinct" se especifica que los registros con ciertos datos duplicados sean obviadas en el resultado. 

Por ejemplo, queremos conocer todos los autores de los cuales tenemos libros, si utilizamos esta sentencia:

 select autor 
 from libros;
 
Aparecen repetidos. 

Para obtener la lista de autores sin repetición usamos:

 select distinct autor 
 from libros;
 
También podemos tipear:

 select autor 
 from libros
  group by autor;
Note que en los tres casos anteriores aparece "null" como un valor para "autor"· 

Si sólo queremos la lista de autores conocidos, es decir, no queremos incluir "null" en la lista, podemos utilizar la sentencia siguiente:

 select distinct autor 
 from libros
  where autor is not null;
  
  
Para contar los distintos autores, sin considerar el valor "null" usamos:

 select count(distinct autor)
  from libros;
  
  
Note que si contamos los autores sin "distinct", no incluirá los valores "null" pero si los repetidos:

 select count(autor)
  from libros;
Esta sentencia cuenta los registros que tienen autor.

Podemos combinarla con "where". Por ejemplo, queremos conocer los distintos autores de la editorial "Planeta":

 select distinct autor 
 from libros
  where editorial='Planeta';
También puede utilizarse con "group by" para contar los diferentes autores por editorial:

 select editorial, count(distinct autor)
  from libros
  group by editorial;
  
La cláusula "distinct" afecta a todos los campos presentados. 
Para mostrar los títulos y editoriales de los libros sin repetir títulos ni editoriales, usamos:

 select distinct titulo,editorial
  from libros
  order by titulo;
Note que los registros no están duplicados, aparecen títulos iguales pero con editorial diferente, cada registro es diferente.

Entonces, "distinct" elimina registros duplicados.
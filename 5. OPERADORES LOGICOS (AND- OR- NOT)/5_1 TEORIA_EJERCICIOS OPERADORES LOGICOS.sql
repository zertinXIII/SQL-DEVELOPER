------------------------------------------------- OPERADORES LÓGICOS (and - or - not)  -------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

 -------------------------------------------------  RESUMEN DE COMANDOS -----------------------------------------------------------------------------------------------------------------

 -- Podemos establecer más de una condición con la cláusula "where", para ello aprenderemos los operadores lógicos.

 -- Son los siguientes:

 -- and, significa "y",
 -- or, significa "y/o",
 -- not, significa "no", invierte el resultado
 -- op- (), paréntesis

 -- Los operadores lógicos se usan para combinar condiciones.

 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------- EJERCICIOS ----------------------------------------------------------------------------------

 create table libros(
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  edicion date,
  precio number(6,2)
  );
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------

1. recuperar todos los libros cuyo autor sea igual a "Borges" y cuyo precio  supere los 20 pesos, necesitamos 2 condiciones:
 
 SELECT *
 FROM LIBROS 
    WHERE (AUTOR = 'Borges') AND (PRECIO >=20);
 
2. Queremos ver los libros cuyo autor sea "Borges" y/o cuya editorial sea "Planeta":

 SELECT * 
 FROM LIBROS
    WHERE  (AUTOR = 'Borges') OR (EDITORIAL = 'Planeta');
    
3. Queremos recuperar los libros que NO cumplan la condición dada, por ejemplo, aquellos cuya editorial NO sea "Planeta":

 SELECT *
 FROM LIBROS
    WHERE NOT EDITORIAL='Planeta';

Los paréntesis se usan para encerrar condiciones, para que se evalúen como una sola expresión.

Cuando explicitamos varias condiciones con diferentes operadores lógicos (combinamos "and", "or") permite establecer el orden de prioridad de la evaluación; además permite diferenciar las expresiones más claramente.

Por ejemplo, las siguientes expresiones devuelven un resultado diferente:
-- 4. Obtener todos los libros cuyo autor sea 'Borges' o aquellos que pertenezcan a la editorial 'Paidos' y tengan un precio menor a 20.
 SELECT *
 FROM libros
    WHERE(AUTOR='Borges') OR
    (EDITORIAL='Paidos' AND PRECIO<20);

-- 5. Obtener todos los libros cuyo autor sea 'Borges' o cuya editorial sea 'Paidos', siempre y cuando su precio sea menor a 20.
 SELECT *
 FROM libros
 WHERE (AUTOR='Borges' OR EDITORIAL='Paidos') AND
  (PRECIO<20);
 
 

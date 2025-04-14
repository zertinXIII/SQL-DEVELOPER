------------------------------------------------- OPERADORES RELACIONALES (IN) -------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------------------------------------------------

 -- Se utiliza "in" para averiguar si el valor de un campo está incluido en una lista de valores especificada.

 -- En la siguiente sentencia usamos "in" para averiguar si el valor del campo autor está incluido en la lista de valores especificada (en este caso, 2 cadenas).
 
 -- EJ1. recuperar los libros cuyo autor sea 'Paenza' o 'Borges' usábamos 2 condiciones:

 select *
 from libros
  where autor='Borges' or autor='Paenza';

 -- Podemos usar "in" y simplificar la consulta:

 select *
 from libros
  where autor in('Borges','Paenza');

 -- Para recuperar los libros cuyo autor no sea 'Paenza' ni 'Borges' usábamos:

 select *
 from libros
  where autor<>'Borges' and autor<>'Paenza';

 -- También podemos usar "in" anteponiendo "not":

 select *
 from libros
  where autor not in ('Borges','Paenza');

 -- Empleando "in" averiguamos si el valor del campo está incluido en la lista de valores especificada; con "not" antecediendo la condición, invertimos el resultado, es decir, recuperamos los valores que no se encuentran (no coinciden) con la lista de valores.

 -- Los valores "null" no se consideran.
 
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 
------------------------------------------------- OPERADORES RELACIONALES (BETWEEN) -------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------

 -- Hemos visto los operadores relacionales: = (igual), <> (distinto), > (mayor), < (menor), >= (mayor o igual), <= (menor o igual), is null/is not null (si un valor es NULL o no).

 -- Otro operador relacional es 'BETWEEN', trabajan con intervalos de valores.

 -- Hasta ahora, para recuperar de la tabla "libros" los libros con precio mayor o igual a 20 y menor o igual a 40, usamos 2 condiciones unidas por el operador lógico "and":

 select *from libros
  where precio>=20 and precio<=40;

 -- Podemos usar "between" y así simplificar la consulta:

 select *from libros
  where precio between 20 and 40;
  
 -- Otro ejemplo, recuperamos los libros cuyo precio NO se encuentre entre 20 y 30, es decir, los menores a 20 y mayores a 30:

 select *from libros
  where precio not between 20 and 30;

 -- TAMBIÉN Podemos especificar un intervalo de valores de tipo fecha con "between":

 select *from libros
  where edicion between '01/05/2000' and '01/05/2007';

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ̣
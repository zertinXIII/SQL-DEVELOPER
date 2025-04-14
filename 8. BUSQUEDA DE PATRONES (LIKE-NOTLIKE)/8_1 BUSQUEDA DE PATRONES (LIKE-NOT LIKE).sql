------------------------------------------------ BUSQUEDA DE PATRONES (LIKE-NOT LIKE) ----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------  RESUMEN DE COMANDOS --------------------------------------------------------------------------------------------------------------------------------------------------------
-- Existe un operador relacional que se usa para realizar comparaciones exclusivamente de cadenas, "like" y "not like".

-- Hemos realizado consultas utilizando operadores relacionales para comparar cadenas. 

-- Sabemos recuperar los libros cuyo autor sea igual a la cadena "Borges":

select *
from libros
 where autor='Borges';

-- El operador igual ("=") nos permite comparar cadenas de caracteres, pero al realizar la comparación, busca coincidencias de cadenas completas, realiza una búsqueda exacta.

-- Imaginemos que tenemos registrados estos 2 libros:

"El Aleph", "Borges";
"Antologia poetica", "J.L. Borges";

-- 1. Si queremos recuperar todos los libros de "Borges" y especificamos la siguiente condición:

select *
from libros
where autor='Borges';

-- sólo aparecerá el primer registro, ya que la cadena "Borges" no es igual a la cadena "J.L. Borges".

-- Esto sucede porque el operador "=" (igual), también el operador "<>" (distinto) comparan CADENAS DE CARACTERES COMPLETAS. 

-- Para COMPARAR PORCIONES de cadenas utilizamos los operadores "like" y "not like".

-- 2. Recuperar todos los registros cuyo autor contenga la cadena "Borges" debemos :

select *
from libros
 where autor like "%Borges%";

-- El símbolo "%" (porcentaje) reemplaza cualquier cantidad de caracteres (incluyendo ningún caracter). Es un caracter comodín. 

-- "like" y "not like" son operadores de comparación que señalan igualdad o diferencia.

-- 3. seleccionar todos los libros que comiencen con "M":

select *
from libros
 where titulo like 'M%';

Note que el símbolo "%" ya no está al comienzo, con esto indicamos que el título debe tener como primera letra la "M" y luego, cualquier cantidad de caracteres.

-- 4. seleccionar todos los libros que NO comiencen con "M":

select *
from libros
 where titulo not like 'M%';
 
-- 5. queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe "Carroll" o "Carrolt", entonces tipeamos esta condición:

select *
from libros
 where autor like "%Carrol_";

-- "like" se emplea con tipos de datos caracter y date. Si empleamos "like" con tipos de datos que no son caracteres, Oracle convierte (si es posible) el tipo de dato a caracter. 

-- 6. queremos buscar todos los libros cuyo precio se encuentre entre 10.00 y 19.99:

select titulo,precio 
from libros
 where precio like '1_,%';

-- 7. Queremos los libros que NO incluyen centavos en sus precios:

select titulo,precio from libros
 where precio not like '%,%';
 
-----------------------  RESUMEN DE COMANDOS ----------------------- 

-- La tabla DUAL es una tabla especial de una sola columna presente de manera predeterminada en todas las instalaciones de bases de datos de Oracle. 
-- Se utiliza cuando queremos hacer un select que no necesita consultar tablas. La tabla tiene una sola columna VARCHAR2(1) llamada DUMMY que tiene un valor de 'X'

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

1. CONCATENAR ' concat(cadena1,cadena2) ' -- concatena dos cadenas de caracteres; es equivalente al operador ||. 

 -- Ejemplo:
 select concat('Buenas',' tardes') 
 from dual;--retorna 'Buenas tardes'.

2. PRIMERA LETRA EN MAYUSCULA ' initcap(cadena) ' -- retorna la cadena enviada como argumento con la primera letra (letra capital) de cada palabra en mayúscula. 

 --Ejemplo:
 select initcap('buenas tardes alumno') 
 from dual;--retorna 'Buenas Tardes Alumno'.

3. TODAS LETRAS MINUSCULA ' lower(cadena) ' -- retorna la cadena enviada como argumento en minúsculas. "lower" significa reducir en inglés. 

 --Ejemplo:
 select lower('Buenas tardes ALUMNO') 
 from dual;--retorna "buenas tardes alumno".
 
4. TODAS LETRAS MAYUSCULA ' upper(cadena) ' -- retorna la cadena con todos los caracteres en mayúsculas. 
 
 --Ejemplo:
 select upper('www.oracle.com') 
 from dual;-- 'WWW.ORACLE.COM'
 
5. COMPLETAR AL_PRINCIPIO ' lpad(cadena,longitud,cadenarelleno)' -- retorna la cantidad de caracteres especificados por el argumento "longitud", de la cadena enviada como primer argumento (comenzando 
 -- desde el primer caracter); si "longitud" es mayor que el tamaño de la cadena enviada, rellena los espacios restantes con la cadena enviada como tercer argumento 
 -- (en caso de omitir el tercer argumento rellena con espacios); el relleno comienza desde la izquierda. 
 
 --Ejemplos:

 select lpad('alumno',10,'xyz') 
 from dual;-- retorna 'xyzxalumno'
 
 select lpad('alumno',4,'xyz') 
 from dual;-- retorna 'alum'

6. COMPLETAR AL_FINAL ' rpad(cadena,longitud,cadenarelleno) ' -- retorna la cantidad de caracteres especificados por el argumento "longitud", de la cadena enviada como primer argumento
 -- (comenzando desde el primer caracter); si "longitud" es mayor que el tamaño de la cadena enviada, rellena los espacios restantes con la cadena enviada como tercer argumento 
 --(en caso de omitir el tercer argumento rellena con espacios); el relleno comienza desde la derecha (último caracter). Ejemplos:

 select rpad('alumno',10,'xyz') 
 from dual;-- retorna 'alumnoxyzx'
 
 select rpad('alumno',4,'xyz') 
 from dual;-- retorna 'alum'

7. BORRAR OCURRENCIAS DESDE LA IZQUIERDA ' ltrim(cadena1,cadena2) ' -- borra todas las ocurrencias de "cadena2" en "cadena1", si se encuentran al comienzo; si se omite el segundo argumento, 
 --se eliminan los espacios. 

 --Ejemplo:

 select ltrim('la casa de la cuadra','la') 
 from dual;-- ' casa de la cuadra'
 
 select ltrim(' es la casa de la cuadra','la') 
 from dual;-- no elimina ningún caracter
 
 select ltrim('  la casa') 
 from dual;-- 'la casa'
 
8. BORRAR OCURRENCIAS DESDE LA DERECHA  'rtrim(cadena1,cadena2)'  -- borra todas las ocurrencias de "cadena2" en "cadena1", si se encuentran por la derecha (al final de la cadena); 
 -- si se omite el segundo argumento, se borran los espacios. 
 
 --Ejemplo:
 select rtrim('la casa lila','la') 
 from dual;-- 'la casa li'
 
 select rtrim('la casa lila ','la') 
 from dual;-- no borra ningún caracter
 
 select rtrim('la casa lila    ') 
 from dual; --'la casa lila'
 
9. ELIMINAR ESPACIOS ' trim(cadena)' -- retorna la cadena con los espacios de la izquierda y derecha eliminados. "Trim" significa recortar. 
 
 --Ejemplo:
 select trim('   oracle     ') 
 from dual;--'oracle'

10. REEMPLAZAR SUBCADENAS -'replace(cadena,subcade1,subcade2)' -- retorna la cadena con todas las ocurrencias de la subcadena de reemplazo (subcade2) por la subcadena a reemplazar (subcae1). 

 --Ejemplo:
 select replace('xxx.oracle.com','x','w') 
 from dual; -- retorna "www.oracle.com'.
 
11. REEMPLAZAR 'translate () ' -- reemplaza cada ocurrencia de una serie de caracteres con otra serie de caracteres. 
 -- La diferencia con "replace" es que aquella trabaja con cadenas de caracteres y reemplaza una cadena completa por otra, en cambio "translate" trabaja con caracteres simples y reemplaza variostrans

 select translate ('JORGE LUIS BORGES ','OSG','056') from dual;

12. MOSTRAR DE UNA CADENA 'EL TROZO' QUE QUERAMOS 'substr(cadena,inicio,longitud)' -- devuelve una parte de la cadena especificada como primer argumento, empezando desde la
 -- posición especificada por el segundo argumento y de tantos caracteres de longitud como indica el tercer argumento. 

 -- Ejemplo:
 select substr('www.oracle.com',1,10) 
 from dual;-- 'www.oracle'

 select substr('www.oracle.com',5,6) 
 from dual;-- 'oracle'

13. ¿LONGITUD DE LA CADENA? ' length(cadena) ' -- retorna la longitud de la cadena enviada como argumento. "lenght" significa longitud en inglés. Ejemplo:

 select length('www.oracle.com') 
 from dual;-- devuelve 14.
 
14. POSICION  'instr (cadena,subcadena)' -- devuelve la posición de comienzo (de la primera ocurrencia) de la subcadena especificada en la cadena enviada como primer argumento. 
 -- Si no la encuentra retorna 0. 
 
 -- Ejemplos:
 select instr('Jorge Luis Borges','or') 
 from dual;-- 2
 
 select instr('Jorge Luis Borges','ar') 
 from dual;-- 0, no se encuentra
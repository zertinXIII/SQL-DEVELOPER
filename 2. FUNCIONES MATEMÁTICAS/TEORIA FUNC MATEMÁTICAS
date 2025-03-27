------------------------------------------------  RESUMEN DE COMANDOS -----------------------------------------------------------------------------------------------------------------

-- Las funciones matemáticas realizan operaciones con expresiones numéricas y retornan un resultado, operan con tipos de datos numéricos.

-- Las funciones numéricas aceptan parámetros de entrada de tipo numérico y retornan valores numéricos.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
1. RETORNAR VALOR ABSOLUTO ' abs(x) ' 
 
  select abs (-20) 
  from dual
  
2. REDONDEAR HACIA ARRIBA  'ceil (x)' -- te redondea a un entero.
  
  select ceil (12.34) 
  from dual
  
3. REDONDEAR HACIA ABAJO  'floor (x)' -- te redondea a un entero.
  
  select floor (12.34) 
  from dual
  
4. DEVOLVER EL RESTO DE UNA DIVISION (X/Y) ' mod (x,y) '

 select mod (10,3)
 from dual;
 
 select mod (10,2)
 from dual;
 
5. RETORNA EL VALOR DE " X" elevado a "Y"  ' power (x,y) '
 
 select power (2,3)
 from dual;
 
6. RETORNAR "n" REDONDEANDO  "d" DECIMALES ' round (n,d)' --  en el caso que se omita el segundo argumento , se redondeara todos los decimales , Si el 2º argumento es POSITIVO 
 -- el número de decimales es redondeado según "d"; si es NEGATIVO, el número es redondeado desde la parte entera según el valor de "d"

 select round(123.456,2) 
 from dual; -- 123.46 (te redondea con dos decimales)

 select round(123.456,1) 
 from dual; -- 123.5 (te redondea con 1 decimal)

 select round(123.456,-1) 
 from dual; -- 120 (te redondea a la baja al primer numero desde la parte entera)

 select round(123.456,-2) 
 from dual; -- 100

 select round(123.456) 
 from dual;  -- 123

7. TRUNCAR UN NUMERO ' trunc(n,d) '-- DEPENDIENDO DE LA CANTIDAD DE DECIMALES ESPECIFICADAS  POR EL 2º ARGUMENTO

 select trunc(1234.5678,2) 
 from dual;--retorna 1234.56
 
 select trunc(1234.5678,-2) 
 from dual;--retorna 1200
 
 select trunc(1234.5678,-1) 
 from dual;--retorna 1230
 
 select trunc(1234.5678) 
 from dual;--retorna 1234
 
8. DEVOLVER RAIZ CUADRADA  ' sqrt (9) ' 
 select sqrt (9)
 from dual; -- retorna 3
 
9.  POTENCIA DE UN NUMERO. 'power (num, potencia)'

 -- Mostramos el resultado de "2 elevado a la potencia 5" ("power"):

 SELECT POWER (2,5)
 FROM DUAL; -- 32

10. RAIZ CUADRADA. 'sqrt (num) ' 

 -- CALCULAMOS LA RAIZ CUADRADA DE 81. 

 SELECT SQRT (81)
 FROM DUAL; -- 9
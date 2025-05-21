------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Mostramos la tabla del 3.

En primer lugar activamos el paquete que contiene los procedimientos necesarios para la salida de datos por pantalla (set serveroutput on) y habilitamos las llamadas a tales 
procedimientos.

Declaramos dos variables, "resultado" almacenará el resultado de las multiplicaciones (le asignamos el valor cero) y "multiplicador" será la que contenga los diferentes valores
por los cuales multiplicaremos 3 (asignándole el valor cero).

En el ciclo repetitivo se almacena en "resultado" el primer valor ("multiplicador" contiene 0 así que el resultado es cero), luego se imprime, se incrementa la variable "multiplicador" 
(ahora contiene 1) y se evalúa la condición, dado que "multiplicador" no es mayor a 5, el ciclo se repite.

Cuando la condición resulta cierta, es decir, cuando "multiplicador" sea igual a 6, el ciclo acabará:

 set serveroutput on;

 execute dbms_output.enable (1000000);

 declare
  resultado number;
  multiplicador number:=0;
 begin
   loop
    resultado:=3*multiplicador;
    dbms_output.put_line('3x'||to_char(multiplicador)||'='||to_char(resultado));
    multiplicador:=multiplicador+1;
    exit when multiplicador>5;
   end loop;
 end;

En el siguiente ejemplo se muestra la tabla del 4. Se almacena en una variable "resultado" el resultado de la multiplicación, se chequea la condición, 
se imprime el resultado y se va incrementando la variable "multiplicador"; el ciclo se repite hasta que la variable "resultado" llega o supera el valor 50:

 declare
  resultado number;
  multiplicador number:=0;
 begin
   loop
    resultado:=4*multiplicador;
    exit when resultado>=50;
    dbms_output.put_line('4x'||to_char(multiplicador)||'='||to_char(resultado));
    multiplicador:=multiplicador+1;
  end loop;
 end;
 /
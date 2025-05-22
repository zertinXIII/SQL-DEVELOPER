----------------------------------------- CONTROL DE FLUJO (WHILE...LOOP) --------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------- RESUMEN DE COMANDOS ---------------------------------------------------------------

Ya estudiamos dos de las tres estructuras repetitivas. Continuamos con "while".

Vimos que las sentencias repetitivas permiten ejecutar una secuencia de sentencias varias veces.

Se coloca la palabra "while" antes de las sentencias y al final "end loop".

"while...loop" (mientras) ejecuta repetidamente una instrucción (o bloque de instrucciones) siempre que la condición sea verdadera.

Sintaxis básica:

 while CONDICION loop
  SENTENCIAS
 end loop;
La diferencia entre "while...loop" y "for...loop" es que en la segunda se puede establecer la cantidad de repeticiones del bucle con el valor inicial y final. 
Además, el segundo siempre se ejecuta, al menos una vez, en cambio el primero puede no ejecutarse nunca, caso en el cual al evaluar la condicion por primera vez resulte falsa.

En el siguiente ejemplo se muestra la tabla del 3 hasta el 5:

 set serveroutput on;
 execute dbms_output.enable (20000);
declare
 numero number:=0;
 resultado number;
begin
  while numero<=5 loop
   resultado:=3*numero;
   dbms_output.put_line('3*'||to_char(numero)||'='||to_char(resultado));
   numero:=numero+1;
  end loop;
end;
/
La condición establece que se multiplique la variable "numero" por 3 mientras "numero" sea menor o igual a 5. 
En el bloque de sentencias se almacena en "resultado" la multiplicación, luego se escribe tal valor y finalmente se incrementa la variable "numero" en 1.

Hacemos el seguimiento: 
cuando se inicia el bucle, la variable "numero" tiene el valor 0, se ejecuta la primer linea de sentencias y "resultado" almacena el valor 0, se imprime (0) 
y se incrementa la variable "numero", ahora contiene el valor 1; se vuelve a la condición, como la condición es verdadera (1 es menor que 5), se vuelven a ejecutar las sentencias 
(resultado almacena 3, se imprime (3), se guarda en numero el valor 2), se vuelve a evaluar la condición, como resulta cierta (2 es menor que 5), se vuelven a ejecutar las sentencias 
(resultado almacena 6, se imprime, se guarda en numero el valor 3), se vuelve a evaluar la condición, como resulta cierta (3 es menor que 5), se vuelven a ejecutar las sentencias 
(resultado almacena 9, se imprime, se guarda en numero el valor 4), se vuelve a evaluar la condición, como resulta cierta (4 es menor que 5), se vuelven a ejecutar las sentencias 
(resultado almacena 12, se imprime, se guarda en numero el valor 5), se vuelve a evaluar la condición, como resulta cierta (5 es menor o igual a 5), se vuelven a ejecutar las sentencias
(resultado almacena 15, se imprime, se guarda en numero el valor 6), se vuelve a evaluar la condición, como resulta falsa (6 NO es menor ni igual a 5), se sale de la estructura.
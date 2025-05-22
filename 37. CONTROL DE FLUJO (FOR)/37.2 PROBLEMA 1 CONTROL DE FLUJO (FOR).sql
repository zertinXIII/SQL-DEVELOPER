------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

En el siguiente ejemplo se muestra la tabla del 3. La variable "f" comienza en cero (límite inferior del for) y se va incrementando de a uno; el ciclo se repite hasta que "f" llega a 5 
(límite superior del for), cuando llega a 6, el bucle finaliza.

 set serveroutput on;
 execute dbms_output.enable(20000);
 begin
  for f in 0..5 loop
   dbms_output.put_line('3x'||to_char(f)||'='||to_char(f*3));
  end loop;
 end;
 /
 
Para que el contador "f" se decremente en cada repetición, colocamos "reverse"; el contador comenzará por el valor del límite superior (5) y finalizará al llegar al límite inferior (0) 
decrementando de a uno. En este ejemplo mostramos la tabla del 3 desde el 5 hasta el 0:

 begin
  for f in reverse 0..5 loop
   dbms_output.put_line('3*'||to_char(f)||'='||to_char(f*3));
  end loop;
 end;
 /

Se pueden colocar "for" dentro de otro "for". Por ejemplo, con las siguientes líneas imprimimos las tablas del 2 y del 3 del 1 al 9:

 begin
  for f in 2..3 loop
   dbms_output.put_line('tabla del '||to_char(f));
   for g in 1..9 loop
     dbms_output.put_line(to_char(f)||'x'||to_char(g)||'='||to_char(f*g));
   end loop;--fin del for g
  end loop;--fin del for f
 end;
 /
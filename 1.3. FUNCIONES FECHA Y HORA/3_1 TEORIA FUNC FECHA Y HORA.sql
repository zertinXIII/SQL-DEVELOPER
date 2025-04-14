------------------------------------------------- FUNCIONES FECHAS Y HORAS  -------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------  RESUMEN DE COMANDOS ------------------------------------------------------------------

--Las funciones de FECHAS Y HORAS operan con tipos de datos "date". 

-----------------------------------------------------------------------------------------------------------------------------------------

1. AÑADIR o RESTAR MESES a una fecha dada 'add_months (fecha, n.meses) '
 
  select add_months('10/06/2020',5) 
  from dual; --retorna "10/11/20"
 
  select add_months('10/06/2020',-5) 
  from dual; --retorna "10/01/20"
 
 select add_months('31/01/2021',1) 
 from dual;-- retorna "29/02/20" ya que es el último día de ese mes.
 
2. RETORNAR ULTIMO DIA (MES) ' last_day (fecha)'
 
  select last_day('10/02/2020') 
  from dual;-- "29/02/20"
  
 select last_day('10/08/2020') 
 from dual;-- "31/08/20"
 
3. RETORNAR NUMERO/S MESES ENTRE DOS FECHAS 'months_between (fecha 1 , fecha 2 )' -- Devuelve un entero. 

 select months_between('19/05/2020','21/06/20') 
 from dual;-- retorna  -1,06451613 

 -- Si quieres solo un digito.
 select ROUND (months_between('19/05/2020','21/06/20'))
 from dual;-- retorna  -1
 
4. RETORNAR EL SIGUIENTE DIA A LA FECHA DE UN DIA DE LA SEMANA SOLICITADO 'next_day (fecha , dia.semana)' 

 select next_day ('27/03/2025' , 'lunes')
 from dual;

5. RETORNAR FECHA ACTUAL 'current_date'

 select current_date
 from dual;

6. RETORNAR FECHA y HORA ACTUAL 'current_timestamp'

 select current_timestamp 
 from dual;

7. RETORNAR FECHA Y HORA ACTUAL EN EL SERVIDOR ORACLE. 
    'sysdate'  -- Dia actual
    'systimestamp' -- Dia y fecha actual
    
 select sysdate
 from dual;

 select systimestamp
 from dual; 

8. CONVERTIR UNA CADENA a TIPO DATO 'to_Date'

  select to_date ('05-SEP-2019 10:00 AM','DD-MON-YYYY HH:MI AM') 
  from dual;
  
9. CONVERTIR FECHA -> CADENA DE CARACTERES 'to_char'
 
 select to_char ('27/03/2025')
 from dual;

10. RETORNAR LA PARTE ESPECIFICADA en el PRIMER ARGUMENTO DE UNA FECHA EXACTA. 'extract (parte, fecha)' -- Puede extraer el año, mes , dia ,  hora , minuto , segundo...

 select extract (month from sysdate)
 from dual; -- 3
 
 -- Extraer el año de una fecha exacta
 SELECT EXTRACT(YEAR FROM DATE '2024-03-27') 
 FROM dual;

 -- Extraer el día de una fecha específica 'YYYY-MM-DD '
 
 SELECT EXTRACT(DAY FROM DATE '2024-03-27') 
 FROM dual;
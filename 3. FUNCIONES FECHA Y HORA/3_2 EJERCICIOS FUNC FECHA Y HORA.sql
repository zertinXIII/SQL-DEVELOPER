------------------------------------------------- PROBLEMAS ----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
 drop table libros;

-- Creamos la tabla:

 create table libros(
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  edicion date,
  precio number(6,2)
 );

-- Ingresamos algunos registros:

 insert into libros values('El aleph','Borges','Emece','10/10/1980',25.33);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI','05/05/2000',50.65);
 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','08/09/2000',19.95);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI','02/04/2000',45);

-- 1. Mostramos el título del libro y el año de edición:

 SELECT TITULO, EXTRACT(YEAR FROM EDICION)
 FROM LIBROS;

-- 2. Mostramos el título del libro y el mes de edición:

 SELECT TITULO , EXTRACT(MONTH FROM EDICION)
 FROM LIBROS;

-- 3. Mostramos el título del libro y los años que tienen de editados (ES DECIR: la diferencia que hay entre la fecha de edición y la fecha actual) :

 SELECT TITULO , EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM EDICION) "AÑOS QUE LLEVA EDITADO"
 FROM LIBROS;

-- 4. Mostramos los títulos de los libros que se editaron en el año 2000:

 SELECT TITULO 
 FROM LIBROS
    WHERE EXTRACT (YEAR FROM EDICION)=2000;

-- 5. Calcule 3 meses luego de la fecha actual empleando "add_months":

 SELECT ADD_MONTHS(SYSDATE,3)
 FROM DUAL;

-- 6. Muestre la fecha del primer martes desde la fecha actual:

 SELECT NEXT_DAY(SYSDATE,'MARTES')
 FROM DUAL;
 
-- 7. Muestre la fecha que será 15 días después de "24/08/2018" empleando el operador "+":

 SELECT TO_DATE('24/08/2018')+15
 FROM DUAL;

-- 8. Muestre la fecha que 20 días antes del "12/08/2018" empleando el operador "-":

 SELECT TO_DATE('12/08/2018')-20
 FROM DUAL;
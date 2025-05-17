------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un profesor almacena el documento, nombre y la nota final de cada alumno de su clase en una tabla llamada "alumnos".

Elimine la tabla:

 drop table alumnos;
 
Créela con los campos necesarios. Agregue una restricción "primary key" para el campo "documento" y una "check" para validar que el campo "nota" se encuentre entre los valores 0 y 10:

 create table alumnos(
  documento char(8),
  nombre varchar2(30),
  nota number(4,2),
  primary key(documento),
  constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10)
 );
 
Ingrese algunos registros:

 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);
 
1. Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta

 SELECT *
 FROM ALUMNOS
    WHERE NOTA=
        (SELECT MAX(NOTA)
        FROM ALUMNOS);


2. Muestre los alumnos que tienen (1) una nota menor al promedio, (2) su nota, y (3) la diferencia con el promedio.

 SELECT NOMBRE "ALUMNO", NOTA "NOTA", ROUND( (SELECT AVG(NOTA)
                                              FROM ALUMNOS),2) "PROMEDIO" , ROUND((SELECT AVG(NOTA)
                                                                                   FROM ALUMNOS) - NOTA,2) "DIFERENCIA CON EL PROMEDIO"
 FROM ALUMNOS
    WHERE NOTA <
        (SELECT AVG(NOTA)
        FROM ALUMNOS)
        ORDER BY NOTA DESC;



4. Cambie la nota del alumno que tiene la menor nota por 4.

 UPDATE ALUMNOS SET NOTA=4
    WHERE NOTA=
        (SELECT MIN(NOTA)
        FROM ALUMNOS);


8- Elimine los alumnos cuya nota es menor al promedio.

 DELETE 
 FROM ALUMNOS
    WHERE NOTA< 
        (SELECT AVG(NOTA)
        FROM ALUMNOS);
------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drop table peliculas;

create table peliculas(
  codigo number(4),
  titulo varchar2(40) not null,
  actor varchar2(20),
  duracion number(3),
  primary key (codigo)
 );

-- Ingrese algunos registros:

 insert into peliculas
  values(1020,'Mision imposible','Tom Cruise',120);
 insert into peliculas
  values(1021,'Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas
  values(1022,'Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values(1200,'Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values(1234,'Mujer bonita','Richard Gere',120);
 insert into peliculas
  values(900,'Tootsie','D. Hoffman',90);
 insert into peliculas
  values(1300,'Un oso rojo','Julio Chavez',100);
 insert into peliculas
  values(1301,'Elsa y Fred','China Zorrilla',110);
  
-- 1. Recupere los registros cuyo actor sea "Tom Cruise" o "Richard Gere" (3 registros)

 SELECT *
 FROM PELICULAS 
    WHERE ACTOR='Tom Cruise' OR ACTOR='Richard Gere';

-- 2. Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas condiciones)

 SELECT *
 FROM PELICULAS
    WHERE ACTOR='Tom Cruise' AND DURACION<100;

-- 3. Recupere los nombres de las películas cuya duración se encuentre entre 100 y 120 minutos(5 registros)

 SELECT TITULO
 FROM PELICULAS 
    WHERE DURACION>=100 AND DURACION<=120;

-- 4. Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 registro afectado)

 UPDATE PELICULAS SET DURACION=200
    WHERE ACTOR='Daniel R.' AND DURACION=180;

-- 5. Recupere todos los registros para verificar la actualización anterior

 SELECT *
 FROM PELICULAS;

-- 6. Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea menor o igual a 100 (2 registros eliminados)

 DELETE 
 FROM PELICULAS
    WHERE NOT ACTOR='Tom Cruise' AND DURACION<=100;
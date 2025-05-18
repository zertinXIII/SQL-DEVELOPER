------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un club dicta cursos de distintos deportes. Almacena la información en varias tablas. El director no quiere que los empleados de administración conozcan la estructura 
de las tablas ni algunos datos de los profesores y socios, por ello se crean vistas a las cuales tendrán acceso.

1- Elimine las tablas y créelas nuevamente:

 drop table inscriptos;
 drop table cursos;
 drop table socios;
 drop table profesores; 

 create table socios(
  documento char(8) not null,
  nombre varchar2(40),
  domicilio varchar2(30),
  primary key (documento)
 );

 create table profesores(
  documento char(8) not null,
  nombre varchar2(40),
  domicilio varchar2(30),
  primary key (documento)
 );

 create table cursos(
  numero number(2),
  deporte varchar2(20),
  dia varchar2(15),
  documentoprofesor char(8),
  constraint CK_inscriptos_dia
    check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
  constraint FK_documentoprofesor 
   foreign key (documentoprofesor)
   references profesores(documento),
   primary key (numero)
 );

 create table inscriptos(
  documentosocio char(8) not null,
  numero number(2) not null,
  matricula char(1),
  constraint CK_inscriptos_matricula check (matricula in('s','n')),
  constraint FK_documentosocio 
   foreign key (documentosocio)
   references socios(documento),
  constraint FK_numerocurso 
   foreign key (numero)
   references cursos(numero),
  primary key (documentosocio,numero)
 );
 
 Ingrese algunos registros para todas las tablas:

 insert into socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into socios values('31111111','Gaston Garcia','Guemes 65');
 insert into socios values('32222222','Hector Huerta','Sucre 534');
 insert into socios values('33333333','Ines Irala','Bulnes 345');

 insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
 insert into profesores values('23333333','Carlos Caseres','Colon 245');
 insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
 insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

 insert into cursos values(1,'tenis','lunes','22222222');
 insert into cursos values(2,'tenis','martes','22222222');
 insert into cursos values(3,'natacion','miercoles','22222222');
 insert into cursos values(4,'natacion','jueves','23333333');
 insert into cursos values(5,'natacion','viernes','23333333');
 insert into cursos values(6,'futbol','sabado','24444444');
 insert into cursos values(7,'futbol','lunes','24444444');
 insert into cursos values(8,'basquet','martes','24444444');

 insert into inscriptos values('30000000',1,'s');
 insert into inscriptos values('30000000',3,'n');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'s');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',8,'s');
 
  Elimine la vista "vista_club":
  
  DROP VIEW VISTA_CLUB_2;

1. Cree una vista en la que aparezca el nombre del socio, el deporte, el día, el nombre del profesor y el estado de la matrícula (deben incluirse los socios que no están inscriptos en ningún deporte, 
los cursos para los cuales no hay inscriptos y los profesores que no tienen designado deporte también)

 CREATE VIEW VISTA_CLUB_1 AS
    SELECT S.NOMBRE "SOCIO" , C.DEPORTE "DEPORTE", P.NOMBRE "PROFESOR",I.MATRICULA "ESTADO MATRICULA" 
    FROM SOCIOS S
        FULL JOIN INSCRIPTOS I
            ON S.DOCUMENTO=I.DOCUMENTOSOCIO
        FULL JOIN CURSOS C
            ON I.NUMERO=C.NUMERO
        FULL JOIN PROFESORES P
            ON C.DOCUMENTOPROFESOR=P.DOCUMENTO;

-------------------------------------------------------------------------------------------------------------------------------------------------------

 CREATE VIEW VISTA_CLUB_2 AS
    SELECT S.NOMBRE "SOCIO" , C.DEPORTE "DEPORTE", P.NOMBRE "PROFESOR",I.MATRICULA "ESTADOMATRICULA" , C.DIA "DIA"
    FROM SOCIOS S
        FULL JOIN INSCRIPTOS I
            ON S.DOCUMENTO=I.DOCUMENTOSOCIO
        FULL JOIN CURSOS C
            ON I.NUMERO=C.NUMERO
        FULL JOIN PROFESORES P
            ON C.DOCUMENTOPROFESOR=P.DOCUMENTO;


2. Muestre la información contenida en la vista (11 registros)

 SELECT *
 FROM VISTA_CLUB;

3. Realice una consulta a la vista donde muestre la cantidad de socios (COUNT) inscriptos en cada deporte (agrupe por deporte y día) ordenados por cantidad

----- Opción 1: Modificando la vista 2 e incluyendo 'dia' -----

 SELECT DEPORTE,DIA, COUNT(SOCIO) "CANTIDAD"
 FROM VISTA_CLUB_2
    WHERE DEPORTE IS NOT NULL
    GROUP BY DEPORTE,DIA
    ORDER BY CANTIDAD;
     
----- Opción 2: Consultar directamente las tablas sin usar la vista -----
     
 SELECT C.DEPORTE, C.DIA, COUNT(S.NOMBRE) "CANTIDAD_SOCIOS"
 FROM SOCIOS S
    JOIN INSCRIPTOS I 
        ON S.DOCUMENTO=I.DOCUMENTOSOCIO
    JOIN CURSOS C 
        ON I.NUMERO=C.NUMERO
 WHERE S.NOMBRE IS NOT NULL
 GROUP BY C.DEPORTE, C.DIA
 ORDER BY CANTIDAD_SOCIOS DESC;
     
4. Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay inscriptos (3 registros)

 SELECT DEPORTE, DIA
 FROM VISTA_CLUB_2
    WHERE SOCIO IS NULL
    AND DEPORTE IS NOT NULL;

5. Muestre los nombres de los socios que no se han inscripto en ningún curso (consultando la vista) (1 registro)

 SELECT SOCIO
 FROM VISTA_CLUB_2
    WHERE DEPORTE IS NULL 
    AND SOCIO IS NOT NULL;

6. Muestre (consultando la vista) los profesores que no tienen asignado ningún deporte aún (1 registro)

 SELECT PROFESOR
 FROM VISTA_CLUB_2
    WHERE DEPORTE IS NULL
    AND PROFESOR IS NOT NULL;
    
7. Muestre (consultando la vista) el nombre de los socios que deben matrículas (1 registro)

 SELECT SOCIO
 FROM VISTA_CLUB_2
    WHERE DEPORTE IS NOT NULL
    AND ESTADOMATRICULA <> 's';
    
8.Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para dictar sus clases (9 registros)

 SELECT DISTINCT PROFESOR,DIA
 FROM VISTA_CLUB_2
    WHERE PROFESOR IS NOT NULL;

9. Muestre la misma información anterior pero ordenada por día

 SELECT DISTINCT PROFESOR,DIA
 FROM VISTA_CLUB_2
    WHERE PROFESOR IS NOT NULL
    ORDER BY DIA;

10. Muestre todos los socios que son compañeros en tenis los lunes (2 registros)

 SELECT SOCIO
 FROM VISTA_CLUB_2
    WHERE DEPORTE='tenis' 
    AND  DIA='lunes';

11. Intente crear una vista denominada "vista_inscriptos" que muestre la cantidad de inscriptos por curso, incluyendo el número del curso, el nombre del deporte y el día

 CREATE VIEW VISTA_INSCRIPTOS AS 
    SELECT DEPORTE,DIA, (SELECT COUNT (*)
                         FROM INSCRIPTOS I
                            WHERE I.NUMERO=C.NUMERO)"CANTIDAD_INSCRIPTOS"
    FROM CURSOS C;

12. Elimine la vista "vista_inscriptos" y créela para que muestre la cantidad de inscriptos por curso, incluyendo el número del curso, el nombre del deporte y el día

    DROP VIEW VISTA_INSCRIPTOS;

13. Consulte la vista (9 registros)

 SELECT *
 FROM VISTA_INSCRIPTOS;
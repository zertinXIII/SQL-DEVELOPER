------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un club dicta cursos de distintos deportes. Almacena la información en varias tablas.

 Elimine las tabla "inscriptos", "socios" y "cursos":

 drop table inscriptos;
 drop table socios;
 drop table cursos;
 
 Cree las tablas:

 create table socios(
  documento char(8) not null,
  nombre varchar2(40),
  domicilio varchar2(30),
  constraint PK_socios_documento
   primary key (documento)
 );

 create table cursos(
  numero number(2),
  deporte varchar2(20),
  dia varchar2(15),
  constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
  profesor varchar2(20),
  constraint PK_cursos_numero
   primary key (numero)
 );

 create table inscriptos(
  documentosocio char(8) not null,
  numero number(2) not null,
  matricula char(1),
  constraint PK_inscriptos_documento_numero
   primary key (documentosocio,numero),
  constraint FK_inscriptos_documento
   foreign key (documentosocio)
   references socios(documento),
  constraint FK_inscriptos_numero
   foreign key (numero)
   references cursos(numero)
  );
  
 Ingrese algunos registros para todas las tablas:

 insert into socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into socios values('31111111','Gaston Garcia','Guemes 65');
 insert into socios values('32222222','Hector Huerta','Sucre 534');
 insert into socios values('33333333','Ines Irala','Bulnes 345');

 insert into cursos values(1,'tenis','lunes','Ana Acosta');
 insert into cursos values(2,'tenis','martes','Ana Acosta');
 insert into cursos values(3,'natacion','miercoles','Ana Acosta');
 insert into cursos values(4,'natacion','jueves','Carlos Caseres');
 insert into cursos values(5,'futbol','sabado','Pedro Perez');
 insert into cursos values(6,'futbol','lunes','Pedro Perez');
 insert into cursos values(7,'basquet','viernes','Pedro Perez');

 insert into inscriptos values('30000000',1,'s');
 insert into inscriptos values('30000000',3,'n');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'s');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',1,'s');
 insert into inscriptos values('32222222',7,'s');
 
1. Realice un join para mostrar todos los datos de todas las tablas, sin repetirlos (7 registros)
 
 SELECT S.DOCUMENTO,S.NOMBRE,S.DOMICILIO,C.NUMERO,C.DEPORTE,C.DIA,C.PROFESOR,I.MATRICULA
 FROM SOCIOS S
 JOIN INSCRIPTOS I 
    ON S.DOCUMENTO=I.DOCUMENTOSOCIO
 JOIN CURSOS C
    ON I.NUMERO=C.NUMERO;

2. Elimine la vista "vista_cursos"

 DROP VIEW VISTA_CURSOS;

3. Cree la vista "vista_cursos" que muestre el número, deporte y día de todos los cursos.

 CREATE VIEW VISTA_CURSOS AS
  SELECT NUMERO, DEPORTE , DIA
  FROM CURSOS;

4. Consulte la vista ordenada por deporte (7 registros)

 SELECT *
 FROM VISTA_CURSOS
    ORDER BY DEPORTE;

5. INGRESE un registro mediante la vista "vista_cursos" y vea si afectó a "cursos"

  INSERT INTO VISTA_CURSOS
  VALUES (8,'futbol','martes');
  
 ----- VEMOS SI SE HA INCLUIDO -----
 
  SELECT *
  FROM CURSOS;

6. ACTUALICE un registro sobre la vista y vea si afectó a la tabla "cursos"

 UPDATE VISTA_CURSOS
 SET DIA='miercoles' 
 WHERE NUMERO=8;
 
 ----- VEMOS SI SE HA INCLUIDO -----
 
  SELECT *
  FROM CURSOS;

7. Elimine un registro de la vista para el cual no haya inscriptos y vea si afectó a "cursos"

 DELETE
 FROM VISTA_CURSOS 
    WHERE NUMERO=8;

 ----- VEMOS SI SE HA INCLUIDO -----
 
  SELECT *
  FROM CURSOS;    

8. Intente eliminar un registro de la vista para el cual haya inscriptos

 DELETE 
 FROM VISTA_CURSOS
 WHERE NUMERO=1

9. Elimine la vista "vista_inscriptos" y créela para que muestre el documento y nombre del socio, el numero de curso, el deporte y día de los cursos en los cuales está inscripto

 DROP VIEW VISTA_INSCRIPTOS;
 
 ---- CREAR VISTA_INSCRIPTOS ----
 
 CREATE VIEW VISTA_INSCRIPTOS AS
 SELECT I.DOCUMENTOSOCIO,S.NOMBRE, I.NUMERO,C.DEPORTE,C.DIA
 FROM SOCIOS S 
 JOIN INSCRIPTOS I
    ON S.DOCUMENTO=I.DOCUMENTOSOCIO
 JOIN CURSOS C
    ON I.NUMERO=C.NUMERO;
    
    SELECT *
    FROM VISTA_INSCRIPTOS;
 
10. Intente ingresar un registro en la vista:

 insert into vista_inscriptos values('32222222','Hector Huerta',6,'futbol','lunes');
 
 No lo permite porque la modificación afecta a más de una tabla base.

11. Intente actualizar el documento de un socio (no lo permite)
 
 UPDATE VISTA_INSCRIPTOS 
 SET  DOCUMENTOSOCIO='30000111'
 WHERE DOCUMENTOSOCIO='30000000';

12. Elimine un registro mediante la vista

 DELETE FROM VISTA_INSCRIPTOS 
 WHERE DOCUMENTOSOCIO='30000000' 
 AND DEPORTE='tenis';
 
13. Verifique que el registro se ha eliminado de "inscriptos"

 SELECT *
 FROM INSCRIPTOS;
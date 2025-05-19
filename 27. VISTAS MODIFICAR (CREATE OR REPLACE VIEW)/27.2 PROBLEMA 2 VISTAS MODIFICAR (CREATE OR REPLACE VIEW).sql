------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un club dicta cursos de distintos deportes. Almacena la información en varias tablas.

Elimine las tablas "inscriptos", "socios" y "cursos":

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
 insert into inscriptos values('30000000',3,'s');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'n');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',1,'n');
 insert into inscriptos values('32222222',7,'n');

1. Cree o reemplace la vista "vista_deudores" que muestre el documento y nombre del socio, el deporte, el día y la matrícula, de todas las inscripciones 'no pagadas'

 CREATE OR REPLACE VIEW VISTA_DEUDORES AS 
    SELECT S.DOCUMENTO "DOCUMENTO_SOCIO", S.NOMBRE "NOMBRE_SOCIO",C.DEPORTE "DEPORTE", C.DIA "DIA", I.MATRICULA "MATRICULA"
    FROM SOCIOS S
        JOIN INSCRIPTOS I
            ON S.DOCUMENTO=I.DOCUMENTOSOCIO
        JOIN CURSOS C
            ON I.NUMERO=C.NUMERO
        WHERE MATRICULA='n';

2. Consulte la vista

 SELECT *
 FROM VISTA_DEUDORES;

3. Veamos el texto de la vista

 SELECT VIEW_NAME, TEXT 
 FROM USER_VIEWS
    WHERE VIEW_NAME='VISTA_DEUDORES';

4. Modifique la vista para que muestre el domicilio

 CREATE OR REPLACE VIEW VISTA_DEUDORES AS 
    SELECT S.DOCUMENTO "DOCUMENTO_SOCIO", S.NOMBRE "NOMBRE_SOCIO",S.DOMICILIO "DOMICILIO",C.DEPORTE "DEPORTE", C.DIA "DIA", I.MATRICULA "MATRICULA"
    FROM SOCIOS S
        JOIN INSCRIPTOS I
            ON S.DOCUMENTO=I.DOCUMENTOSOCIO
        JOIN CURSOS C
            ON I.NUMERO=C.NUMERO
        WHERE MATRICULA='n'; 

5. Consulte la vista para ver si se modificó

 SELECT *
 FROM VISTA_DEUDORES;

6. Vea el texto de la vista

 SELECT VIEW_NAME, TEXT 
 FROM USER_VIEWS
    WHERE VIEW_NAME='VISTA_DEUDORES';
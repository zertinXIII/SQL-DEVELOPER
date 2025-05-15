------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los socios, en una tabla llamada "deportes" la información referente a los diferentes deportes que se dictan 
y en una tabla denominada "inscriptos", las inscripciones de los socios a los distintos deportes.

Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el mismo deporte el mismo año. Distintos socios se inscriben en un mismo deporte en el mismo año.

Elimine las tablas:

 drop table socios;
 drop table deportes;
 drop table inscriptos;

Cree las tablas con las siguientes estructuras:

 create table socios(
  documento char(8) not null, 
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(documento)
 );
 
 create table deportes(
  codigo number(2),
  nombre varchar2(20),
  profesor varchar2(15),
  primary key(codigo)
 );
 
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte number(2) not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año)
 );
 
 Ingrese algunos registros en "socios":

 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
 
 Ingrese algunos registros en "deportes":

 insert into deportes values(1,'basquet','Juan Juarez');
 insert into deportes values(2,'futbol','Pedro Perez');
 insert into deportes values(3,'natacion','Marina Morales');
 insert into deportes values(4,'tenis','Marina Morales');
 
 Inscriba a varios socios en el mismo deporte en el mismo año:

 insert into inscriptos values ('22222222',3,'2016','s');
 insert into inscriptos values ('23333333',3,'2016','s');
 insert into inscriptos values ('24444444',3,'2016','n');
 
 Inscriba a un mismo socio en el mismo deporte en distintos años:

 insert into inscriptos values ('22222222',3,'2015','s');
 insert into inscriptos values ('22222222',3,'2017','n');
 
 Inscriba a un mismo socio en distintos deportes el mismo año:

 insert into inscriptos values ('24444444',1,'2016','s');
 insert into inscriptos values ('24444444',2,'2016','s');
 
  Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no exista en "socios":

 insert into inscriptos values ('26666666',0,'2016','s');
 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
1. Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando diferentes tipos de join (8 filas):

 SELECT S.NOMBRE, D.NOMBRE, I.AÑO
 FROM DEPORTES D
 RIGHT JOIN INSCRIPTOS I
    ON D.CODIGO= I.CODIGODEPORTE
 LEFT JOIN SOCIOS S
    ON I.DOCUMENTO=S.DOCUMENTO;

2.  Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas inscripciones cuyo código de deporte no existe en "deportes" 
y cuyo documento de socio no se encuentra en "socios" (10 filas)

 SELECT S.NOMBRE "SOCIO", D.NOMBRE "TIPO DEPORTE" ,I.AÑO,I.MATRICULA, D.PROFESOR
 FROM SOCIOS S
 FULL JOIN INSCRIPTOS I
    ON I.DOCUMENTO=S.DOCUMENTO
 FULL JOIN DEPORTES D
    ON D.CODIGO=I.CODIGODEPORTE;
 

3. Muestre todas las inscripciones del socio con documento "22222222" (3 filas)

 SELECT S.NOMBRE "SOCIO", D.NOMBRE "TIPO DE DEPORTE", I.AÑO, I.MATRICULA, D.PROFESOR
 FROM DEPORTES D
 JOIN INSCRIPTOS I
    ON D.CODIGO=I.CODIGODEPORTE
 JOIN SOCIOS S
    ON I.DOCUMENTO=S.DOCUMENTO
        WHERE S.DOCUMENTO='22222222';
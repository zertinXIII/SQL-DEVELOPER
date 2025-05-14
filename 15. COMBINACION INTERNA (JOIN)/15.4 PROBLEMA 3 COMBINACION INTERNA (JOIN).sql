------------------------------------------------------- PROBLEMA 3 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "inscriptos" que incluye el documento, el nombre, el deporte y si la matricula esta paga o no y una tabla llamada "inasistencias" que incluye el documento, el deporte y la fecha de la inasistencia.

Elimine las tablas y créelas:

 drop table inscriptos;
 drop table inasistencias;

 create table inscriptos(
  nombre varchar2(30),
  documento char(8),
  deporte varchar2(15),
  matricula char(1), --'s'=paga; 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar2(15),
  fecha date
 );

Ingrese algunos registros para ambas tablas:

 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','01/12/2006');
 insert into inasistencias values('22222222','tenis','08/12/2006');
 insert into inasistencias values('23333333','tenis','01/12/2006');
 insert into inasistencias values('24444444','tenis','08/12/2006');
 insert into inasistencias values('22222222','natacion','02/12/2006');
 insert into inasistencias values('23333333','natacion','02/12/2006');
 
1. Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.

Note que la condición es compuesta porque para identificar los registros de la tabla "inasistencias" necesitamos ambos campos.
Note que la persona con documento '25555555' no aparece en la consulta porque no está presente en "inasistencias".

 SELECT NOMBRE,INSC.DEPORTE,INA.FECHA
 FROM INSCRIPTOS INSC
    JOIN INASISTENCIAS INA 
        ON INSC.DOCUMENTO=INA.DOCUMENTO AND INSC.DEPORTE=INA.DEPORTE
            ORDER BY NOMBRE,INSC.DEPORTE;
            
2. Obtenga el nombre, deporte y las fechas de inasistencias de un DETERMINADO INSCRITO en un determinado deporte.

 SELECT NOMBRE, INSC.DEPORTE, INA.FECHA
 FROM INSCRIPTOS INSC
    JOIN INASISTENCIAS INA
        ON INSC.DOCUMENTO=INA.DOCUMENTO AND INSC.DEPORTE=INA.DEPORTE
            WHERE INSC.DOCUMENTO='22222222';


3. Obtenga el nombre, deporte y las fechas de inasistencias de todos los inscriptos que pagaron la matrícula 

 SELECT NOMBRE, INSC.DEPORTE, INA.FECHA
 FROM INSCRIPTOS INSC
    JOIN INASISTENCIAS INA
        ON INSC.DOCUMENTO=INA.DOCUMENTO AND INSC.DEPORTE=INA.DEPORTE
            WHERE INSC.MATRICULA='s';
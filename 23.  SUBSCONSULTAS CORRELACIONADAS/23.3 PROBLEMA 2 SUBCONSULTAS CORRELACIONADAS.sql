------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual 
se inscribe y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla denominada "socios" en la que guarda los datos personales de cada socio.

 Elimine las tablas:

 drop table inscriptos;
 drop table socios;
 
 Cree las tablas:

 create table socios(
  numero number(4),
  documento char(8),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio number(4) not null,
  deporte varchar(20) not null,
  cuotas number(2) default 0,
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10),
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on delete cascade
 );
 
 Ingrese algunos registros:

 insert into socios values(1,'23333333','Alberto Paredes','Colon 111');
 insert into socios values(2,'24444444','Carlos Conte','Sarmiento 755');
 insert into socios values(3,'25555555','Fabian Fuentes','Caseros 987');
 insert into socios values(4,'26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);
 
1. Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de deportes a los cuales se ha inscripto, empleando subconsulta.

 SELECT S.NOMBRE, S.DOMICILIO, (SELECT COUNT(*)
                                FROM INSCRIPTOS I
                                    WHERE S.NUMERO=I.NUMEROSOCIO)"CANTIDAD DE DEPORTES"
 FROM SOCIOS S;

2.  Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada deporte) y el total de cuotas pagadas, empleando subconsulta.
 
 SELECT S.NOMBRE , (SELECT (COUNT(I.CUOTAS)*10)
                    FROM INSCRIPTOS I
                        WHERE S.NUMERO=I.NUMEROSOCIO) "TOTAL DE CUOTAS", (SELECT SUM(I.CUOTAS)
                                                                          FROM INSCRIPTOS I
                                                                            WHERE S.NUMERO=I.NUMEROSOCIO) "TOTAL CUOTAS PAGADAS"
  FROM SOCIOS S;

3. Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada deporte) y el total de cuotas pagadas, empleando join.

 SELECT S.NOMBRE, COUNT (I.CUOTAS)*10 "TOTAL DE CUOTAS" , SUM(I.CUOTAS) "TOTAL CUOTAS PAGADAS"
 FROM SOCIOS S
    LEFT JOIN INSCRIPTOS I
    ON S.NUMERO=I.NUMEROSOCIO
    GROUP BY S.NOMBRE;
 

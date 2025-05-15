------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos y en otra tabla llamada "ciudades" los nombres de las ciudades.

Elimine las tablas:

 drop table visitantes;
 drop table ciudades;
 
 Cree las tablas:

 create table visitantes(
  nombre varchar2(30),
  edad number(2),
  sexo char(1) default 'f',
  domicilio varchar2(30),
  codigociudad number(2),
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo number(2),
  nombre varchar(20)
 );
 
 Ingrese algunos registros:

 insert into ciudades values(1,'Cordoba');
 insert into ciudades values(2,'Carlos Paz');
 insert into ciudades values(3,'La Falda');
 insert into ciudades values(4,'Cruz del Eje');

 insert into visitantes values ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values ('Mariana Juarez',33,'f',null,2,null,90);
 
 
1. Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)

 SELECT C.NOMBRE, COUNT(*) "CANTIDAD VISITAS"
 FROM CIUDADES C
 JOIN VISITANTES V
    ON C.CODIGO=V.CODIGOCIUDAD
        GROUP BY C.NOMBRE;
    
    
2.  Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)

 SELECT C.NOMBRE, V.SEXO, AVG(V.MONTOCOMPRA) "PROMEDIO GASTOS"
 FROM CIUDADES C
 JOIN VISITANTES V
    ON C.CODIGO=V.CODIGOCIUDAD
        GROUP BY C.NOMBRE ,V.SEXO;

3. Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)

 SELECT C.NOMBRE, COUNT(V.MAIL) "MAIL"
 FROM CIUDADES C
 JOIN VISITANTES V
    ON C.CODIGO=V.CODIGOCIUDAD
        GROUP BY C.NOMBRE;
        
4. Obtenga el monto de compra más alto de cada ciudad (3 filas)

 SELECT C.NOMBRE, MAX(MONTOCOMPRA) "COMPRA MAS ALTA"
 FROM CIUDADES C
 JOIN VISITANTES V
    ON C.CODIGO=V.CODIGOCIUDAD
        GROUP BY C.NOMBRE;

5. Obtenga el monto de compra más alto (de VISITANTES) de cada ciudad con "left join" (4 filas)

Note que aparece el monto "95,4" con valor nulo en el campo correspondiente a la ciudad, ya que ese registro tiene un valor inexistente en "ciudades".

  SELECT C.NOMBRE, MAX(MONTOCOMPRA) "COMPRA MAS ALTA"
  FROM VISITANTES V
  LEFT JOIN CIUDADES C
    ON V.CODIGOCIUDAD=C.CODIGO
        GROUP BY C.NOMBRE;
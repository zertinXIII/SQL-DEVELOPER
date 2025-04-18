------------------------------------------------- PROBLEMA 3 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

Elimine la tabla "visitantes":

  drop table visitantes;

Créela con la siguiente estructura:

 create table visitantes(
  nombre varchar2(30),
  edad number(2),
  sexo char(1),
  domicilio varchar2(30),
  ciudad varchar2(20),
  telefono varchar2(11),
  montocompra number(6,2) not null
 );

Ingrese algunos registros:

 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);
  
1. Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un valor superior a 50 

SELECT CIUDAD, SEXO, SUM(MONTOCOMPRA)"TOTAL"
FROM VISITANTES
    GROUP BY CIUDAD, SEXO
    HAVING SUM(MONTOCOMPRA)>50;
    
2. Obtenga el total de las compras agrupados por ciudad y sexo (group by), considerando sólo los montos de compra superiores a 50 (where), los visitantes con teléfono (where), 
sin considerar la ciudad de "Cordoba" (having), ordenados por ciudad (order by) (2 filas)

SELECT CIUDAD,SEXO, SUM(MONTOCOMPRA)"TOTAL"
FROM VISITANTES
WHERE MONTOCOMPRA>50 AND TELEFONO IS NOT NULL
    GROUP BY CIUDAD,SEXO
    HAVING CIUDAD<>'Cordoba'
    ORDER BY CIUDAD;
    
3. Muestre el monto mayor de compra agrupado por ciudad, siempre que dicho valor supere los 50 pesos (having), considerando sólo los visitantes de sexo femenino y domicilio conocido (where) (2 filas)

SELECT CIUDAD, MAX(MONTOCOMPRA) "MONTO MAXIMO"
FROM VISITANTES
WHERE DOMICILIO IS NOT NULL AND SEXO='f'
GROUP BY CIUDAD
HAVING MAX(MONTOCOMPRA)>50;

4. Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras y el promedio de compras, ordenado por la suma total y 
considerando las filas con promedio superior a 30 (3 filas)

SELECT CIUDAD,SEXO, COUNT(*)"TOTAL DE VISITANTES", SUM(MONTOCOMPRA)"SUMA COMPRA",AVG(MONTOCOMPRA)"PROMEDIO DE COMPRAS"
FROM VISITANTES
    GROUP BY CIUDAD,SEXO
    HAVING AVG(MONTOCOMPRA)>3
    ORDER BY "SUMA COMPRA";
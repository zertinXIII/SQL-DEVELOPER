------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Elimine la tabla "visitantes"  :

 drop table visitantes;

-- Creamos tabla:

 create table visitantes(
  nombre varchar2(30),
  edad number(2),
  sexo char(1) default 'f',
  domicilio varchar2(30),
  ciudad varchar2(20) default 'Cordoba',
  telefono varchar2(11),
  mail varchar2(30) default 'no tiene',
  montocompra number(6,2)
 );
 
-- Ingresamos algunos registros:

 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);
  
1. Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" 

 SELECT CIUDAD, COUNT (*)
 FROM VISITANTES
    GROUP BY CIUDAD;

2. Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad 

 SELECT CIUDAD, COUNT (TELEFONO)
 FROM VISITANTES
    GROUP BY CIUDAD;

3. Necesitamos el total del monto de las compras agrupadas por sexo
Note que los registros con valor nulo en el campo "sexo" se procesan como un grupo diferente.

 SELECT SEXO, SUM(MONTOCOMPRA)
 FROM VISITANTES
    GROUP BY SEXO;

4. Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad 

 SELECT SEXO, CIUDAD, MAX(MONTOCOMPRA)"MAYOR",MIN(MONTOCOMPRA)"MENOR"
 FROM VISITANTES
    GROUP BY SEXO,CIUDAD;

5. Calcule el promedio del valor de compra agrupados por ciudad 

 SELECT CIUDAD, AVG (MONTOCOMPRA) "PROMEDIO DE COMPRAS"
 FROM VISITANTES
    GROUP BY CIUDAD;

6. Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas)

 SELECT CIUDAD, COUNT (*)"GENTE CON EMAIL"
 FROM VISITANTES
 WHERE MAIL IS NOT NULL AND MAIL <> 'no tiene'
    GROUP BY CIUDAD;    
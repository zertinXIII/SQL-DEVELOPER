------------------------------------------------- PROBLEMAS ----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
drop table empleados;

-- Creamos la tabla EMPLEADOS
 create table empleados(
  legajo number(5),
  documento char(8) not null,
  nombre varchar2(30) not null,
  domicilio varchar2(30),
  sueldo number(6,2),
  hijos number(2),
  primary key (legajo)
 );

-- Ingresamos algunos registros:

 insert into empleados
  values(1,'22333444','Ana Acosta','Avellaneda 213',870.79,2);
 insert into empleados
  values(20,'27888999','Betina Bustos','Bulnes 345',950.85,1);
 insert into empleados
  values(31,'30111222','Carlos Caseres','Caseros 985',1190,0);
 insert into empleados
  values(39,'33444555','Daniel Duarte','Dominicana 345',1250.56,3);


-- 1. Vamos a mostrar los SUELDOS de los empleados redondeando el valor hacia abajo y luego hacia arriba (empleamos "floor" y "ceil"):

SELECT FLOOR (SUELDO) "SUELDO HACIA ABAJO" , CEIL (SUELDO) "SUELDO HACIA ARRIBA"
FROM EMPLEADOS;

-- 2. Mostramos los nombre de cada empleado, su respectivo sueldo, y el sueldo redondeando el valor a entero ("round") y truncado a entero ("trunc"):

SELECT NOMBRE, SUELDO , ROUND (SUELDO) "SUELDO REDONDEADO", TRUNC (SUELDO) "SUELDO TRUNCADO"
FROM EMPLEADOS;
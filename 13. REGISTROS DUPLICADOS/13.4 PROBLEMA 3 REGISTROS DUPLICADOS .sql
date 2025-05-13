------------------------------------------------- PROBLEMA 3 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

La provincia almacena en una tabla llamada "inmuebles" los siguientes datos de los inmuebles y sus propietarios para cobrar impuestos:

 Elimine la tabla:

  drop table inmuebles;
  
 Créela con la siguiente estructura:

 create table inmuebles (
  documento varchar2(8) not null,
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(20),
  barrio varchar2(20),
  ciudad varchar2(20),
  tipo char(1),--b=baldio, e: edificado
  superficie number(8,2)
 );
 
 Ingrese algunos registros:

 insert into inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);
  
1.  Muestre los distintos apellidos de los propietarios, sin repetir 

 SELECT DISTINCT APELLIDO
 FROM INMUEBLES;

2.  Recupere los distintos documentos de los propietarios y luego muestre los distintos documentos de los propietarios, sin repetir y vea la diferencia 

 SELECT DOCUMENTO, NOMBRE , APELLIDO
 FROM INMUEBLES;

 SELECT DISTINCT DOCUMENTO, NOMBRE, APELLIDO
 FROM INMUEBLES;

3.  Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)

 SELECT COUNT( DISTINCT DOCUMENTO)
 FROM INMUEBLES
    WHERE CIUDAD='Cordoba';
      
4. Cuente la cantidad de inmuebles con domicilio en 'San Martin' (3)

 SELECT COUNT ( CIUDAD)
 FROM INMUEBLES
    WHERE DOMICILIO LIKE 'San Martin %';

5. Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad . Compare con la sentencia anterior.

 SELECT COUNT(DISTINCT CIUDAD)
 FROM INMUEBLES
    WHERE DOMICILIO LIKE 'San Martin %';

6. Muestre los apellidos y nombres de todos los registros(9 registros)

 SELECT APELLIDO, NOMBRE
 FROM INMUEBLES;

7. Muestre los apellidos y nombres, sin repetir 
Note que si hay 2 personas con igual nombre y apellido aparece una sola vez.

 SELECT DISTINCT APELLIDO, NOMBRE
 FROM INMUEBLES;

8. Muestre la cantidad de inmuebles que tiene cada propietario en barrios conocidos, agrupando por documento 

 SELECT DOCUMENTO, COUNT(BARRIO) "CANTIDAD"
 FROM INMUEBLES
    GROUP BY DOCUMENTO;

9. Realice la misma consulta anterior pero en esta oportunidad, sin repetir barrio

 SELECT DOCUMENTO, COUNT(DISTINCT BARRIO) "CANTIDAD"
 FROM INMUEBLES
    GROUP BY DOCUMENTO;
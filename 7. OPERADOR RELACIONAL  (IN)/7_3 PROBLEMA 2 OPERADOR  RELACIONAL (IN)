------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

 drop table medicamentos;

 create table medicamentos(
  codigo number(5),
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(6,2),
  cantidad number(3) not null,
  fechavencimiento date not null,
  primary key(codigo)
 );

-- Ingrese algunos registros:

 insert into medicamentos
  values(100,'Sertal','Roche',5.2,1,'01/02/2015');
 insert into medicamentos 
  values(230,'Buscapina',null,4.10,3,'01/03/2016');
 insert into medicamentos 
  values(280,'Amoxidal 500','Bayer',15.60,100,'01/05/2017');
 insert into medicamentos
  values(301,'Paracetamol 500','Bago',1.90,10,'01/02/2018');
 insert into medicamentos 
  values(400,'Bayaspirina','Bayer',2.10,150,'01/08/2019'); 
 insert into medicamentos 
  values(560,'Amoxidal jarabe','Bayer',5.10,250,'01/10/2020'); 
  
-- 1. Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" empleando el operador "in" (4 registros)

 SELECT NOMBRE, PRECIO, LABORATORIO
 FROM MEDICAMENTOS
    WHERE LABORATORIO IN ('Bayer' , 'Bago');

-- 2. Recupere los nombres y precios de los medicamentos cuyo laboratorio NO sea "Bayer" o "Bago" empleando el operador "in" (1 registro)
    -- Note que los valores nulos no se incluyen.
    
 SELECT NOMBRE, PRECIO , LABORATORIO
 FROM MEDICAMENTOS
    WHERE LABORATORIO NOT IN ('Bayer' , 'Bago');

-- 3. Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y luego el operador "in" (2 registros)
    -- Note que es más conveniente emplear, en este caso, el operador "between", simplifica la consulta.
    
 SELECT NOMBRE , LABORATORIO
 FROM MEDICAMENTOS 
    WHERE CANTIDAD BETWEEN 1 AND 5;

     
     -- Con IN  
 SELECT NOMBRE , LABORATORIO
 FROM MEDICAMENTOS 
    WHERE CANTIDAD IN (1,2,3,4,5);    

-- 4. Recupere los registros cuyas fechas de vencimiento se encuentra entre enero de 2015 y enero del 2017 (emplee el operador apropiado) (2 registros)

 SELECT *
 FROM MEDICAMENTOS
    WHERE FECHAVENCIMIENTO BETWEEN '01/01/2015' AND '01/01/2017';

-- 5. Recupere los registros cuyo año de vencimiento sea 2015 o 2016 (emplee el operador apropiado) (2 registros)

 SELECT *
 FROM MEDICAMENTOS
    WHERE EXTRACT (YEAR FROM FECHAVENCIMIENTO) BETWEEN '2015' AND '2016';
    
    -- Con IN 

 SELECT *
 FROM MEDICAMENTOS
    WHERE EXTRACT (YEAR FROM FECHAVENCIMIENTO) IN ('2015','2016');
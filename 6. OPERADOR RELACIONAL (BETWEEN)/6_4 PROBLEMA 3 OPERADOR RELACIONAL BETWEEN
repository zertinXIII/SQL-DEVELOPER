------------------------------------------------- PROBLEMA 3 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

 drop table medicamentos;

 create table medicamentos(
  codigo number(6) not null,
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(6,2),
  cantidad number(4),
  fechavencimiento date not null,
  primary key(codigo)
 );

-- Ingrese algunos registros:

 insert into medicamentos
  values(102,'Sertal','Roche',5.2,10,'01/02/2020');
 insert into medicamentos 
  values(120,'Buscapina','Roche',4.10,200,'01/12/2017');
 insert into medicamentos 
  values(230,'Amoxidal 500','Bayer',15.60,100,'28/12/2017');
 insert into medicamentos
  values(250,'Paracetamol 500','Bago',1.90,20,'01/02/2018');
 insert into medicamentos 
  values(350,'Bayaspirina','Bayer',2.10,150,'01/12/2019'); 
 insert into medicamentos 
  values(456,'Amoxidal jarabe','Bayer',5.10,250,'01/10/2020'); 
  
-- 1. Recupere los nombres y precios de los medicamentos cuyo precio esté entre 5 y 15 (2 registros)

 SELECT NOMBRE, PRECIO
 FROM MEDICAMENTOS 
    WHERE PRECIO BETWEEN 5 AND 12;

-- 2. Seleccione los registros cuya cantidad se encuentre entre 100 y 200 (3 registros)

 SELECT *
 FROM MEDICAMENTOS 
    WHERE  CANTIDAD BETWEEN 100 AND 200;

-- 3. Recupere los remedios cuyo vencimiento se encuentre entre '01/12/2017'  y '01/01/2028' inclusive.

 SELECT NOMBRE,FECHAVENCIMIENTO
 FROM MEDICAMENTOS 
    WHERE  FECHAVENCIMIENTO BETWEEN '01/12/2017' AND '01/01/2028';

--4. Elimine los remedios cuyo vencimiento se encuentre entre el año 2017 y 2018 inclusive (3 registros)

 DELETE 
 FROM MEDICAMENTOS 
    WHERE EXTRACT (YEAR FROM FECHAVENCIMIENTO) BETWEEN 2017 AND 2018;
    
 SELECT *
 FROM MEDICAMENTOS;
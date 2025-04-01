------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drop table medicamentos;

create table medicamentos(
  codigo number(5),
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(5,2),
  cantidad number(3),
  primary key(codigo)
 );
 
-- Ingrese algunos registros:

 insert into medicamentos values(100,'Sertal','Roche',5.2,100);
 insert into medicamentos values(102,'Buscapina','Roche',4.10,200);
 insert into medicamentos values(205,'Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos values(230,'Paracetamol 500','Bago',1.90,200);
 insert into medicamentos values(345,'Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos values(347,'Amoxidal jarabe','Bayer',5.10,250); 
 
-- 1. Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea "Roche' y cuyo precio sea menor a 5 (1 registro cumple con ambas condiciones)
 
 SELECT CODIGO, NOMBRE
 FROM MEDICAMENTOS
    WHERE (LABORATORIO= 'Roche') AND (PRECIO<5);

-- 2. Recupere los medicamentos cuyo laboratorio sea "Roche" o cuyo precio sea menor a 5 (4 registros)

 SELECT *
 FROM MEDICAMENTOS 
    WHERE (LABORATORIO = 'Roche') OR (PRECIO<5);

-- 3. Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100. 

 SELECT *
 FROM MEDICAMENTOS 
    WHERE ( NOT LABORATORIO = 'Bayer' AND CANTIDAD =100); 
    
-- 3.1   Luego muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100

 SELECT *
 FROM MEDICAMENTOS 
    WHERE ( LABORATORIO = 'Bayer' AND NOT CANTIDAD =100); 

-- 4. Recupere los nombres de los medicamentos cuyo precio esté entre 2 y 5 inclusive (2 registros)

 SELECT NOMBRE
 FROM MEDICAMENTOS 
    WHERE PRECIO>=2 AND PRECIO<=5 ;

-- 5. Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 registro eliminado)

 DELETE
 FROM MEDICAMENTOS 
    WHERE LABORATORIO='Bayer' AND PRECIO>10 ;

-- 6. Cambie la cantidad por 200, de todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 registro afectado)

 UPDATE MEDICAMENTOS 
 SET CANTIDAD =200
    WHERE LABORATORIO = 'Roche' AND PRECIO>5;

-- 7. Muestre todos los registros para verificar el cambio.

 SELECT *
 FROM MEDICAMENTOS;

-- 8. Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados)

 DELETE
 FROM MEDICAMENTOS
    WHERE LABORATORIO='Bayer' OR PRECIO<3;
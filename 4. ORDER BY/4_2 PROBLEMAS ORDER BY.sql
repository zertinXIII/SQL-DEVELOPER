------------------------------------------------- PROBLEMAS ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- En una página web se guardan los siguientes datos de las visitas: nombre, mail, pais y fecha.

-- 1. Elimine la tabla "visitas"

 drop table visitas;

-- 2. créela con la siguiente estructura:

 create table visitas (
  nombre varchar2(30) default 'Anonimo',
  mail varchar2(50),
  pais varchar2(20),
  fecha date
 );

-- 3. Ingrese algunos registros:

 insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina',to_date('2020/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile',to_date('2020/02/13 11:08:10', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('2020/07/02 14:12:00', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',to_date('2020/06/17 20:00:00', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',to_date('2020/02/08 20:05:40', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('2020/07/06 18:00:00', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('2019/10/05 23:00:00', 'yyyy/mm/dd hh24:mi:ss'));

-- 4. Ordene los registros por fecha, en orden descendente.

 SELECT * 
 FROM VISITAS 
 ORDER BY FECHA DESC;

-- 5. Muestre el nombre del usuario, pais y el mes, ordenado por pais (ascendente) y el mes (descendente)

 SELECT NOMBRE , PAIS , EXTRACT (MONTH FROM FECHA) "MES"
 FROM VISITAS 
 ORDER BY PAIS ASC , EXTRACT (MONTH FROM FECHA) DESC;

        ----- OTRA MANERA -----

 SELECT NOMBRE , PAIS , EXTRACT (MONTH FROM FECHA) "MES"
 FROM VISITAS 
 ORDER BY 2 ASC , 3 DESC;

-- 6. Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 registros)

 SELECT MAIL, PAIS 
 FROM VISITAS 
  WHERE EXTRACT (MONTH FROM FECHA) = 10
 ORDER BY 2;
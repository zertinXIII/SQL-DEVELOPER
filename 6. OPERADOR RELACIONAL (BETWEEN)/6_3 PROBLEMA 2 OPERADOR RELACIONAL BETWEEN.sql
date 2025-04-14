------------------------------------------------- PROBLEMA 2 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drop table visitas;

 create table visitas (
  nombre varchar2(30) default 'Anonimo',
  mail varchar2(50),
  pais varchar2(20),
  fecha date
 );

-- Ingrese algunos registros:

 insert into visitas
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','10/10/2016');
 insert into visitas
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','10/10/2016');
 insert into visitas
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','11/10/2016');
 insert into visitas 
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','12/10/2016');
 insert into visitas
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','12/09/2016');
 insert into visitas
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','12/09/2016');
 insert into visitas 
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','15/09/2016');
 insert into visitas 
  values ('Federico1','federicogarcia@xaxamail.com','Argentina',null);

-- 1. Seleccione los usuarios que visitaron la página entre el '12/09/2016' y '11/10/2016' (6 registros)
    -- Note que incluye los de fecha mayor o igual al valor mínimo y menores o iguales al valor máximo, y que los valores nulos no se incluyen.

 SELECT *
 FROM VISITAS 
    WHERE FECHA BETWEEN '12/09/2016' AND '11/10/2016';
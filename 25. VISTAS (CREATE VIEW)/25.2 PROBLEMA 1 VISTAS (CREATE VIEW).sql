------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Una empresa almacena la información de sus empleados en dos tablas llamadas "empleados" y "secciones".

Eliminamos las tablas:

 drop table empleados;
 drop table secciones;
 
Creamos las tablas:

 create table secciones(
  codigo number(2),
  nombre varchar2(20),
  sueldo number(5,2)
   constraint CK_secciones_sueldo check (sueldo>=0),
  constraint PK_secciones primary key (codigo)
 );

 create table empleados(
  legajo number(5),
  documento char(8),
  sexo char(1)
   constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar2(20),
  nombre varchar2(20),
  domicilio varchar2(30),
  seccion number(2) not null,
  cantidadhijos number(2)
   constraint CK_empleados_hijos check (cantidadhijos>=0),
  estadocivil char(10)
   constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso date,
   constraint PK_empleados primary key (legajo),
  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo),
  constraint UQ_empleados_documento
   unique(documento)
);

Ingresamos algunos registros:

 insert into secciones values(1,'Administracion',300);
 insert into secciones values(2,'Contaduría',400);
 insert into secciones values(3,'Sistemas',500);

 insert into empleados values(100,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','10/10/1990');
 insert into empleados values(102,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','02/10/1990');
 insert into empleados values(103,'24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','12/07/1998');
 insert into empleados values(104,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','10/09/1998');
 insert into empleados values(105,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','05/09/2000');
 
Eliminamos la vista "vista_empleados". Aún no hemos aprendido a eliminar vistas, lo veremos próximamente:

  drop view vista_empleados;
  
1. Vista Resumen de Empleados con Secciones (VISTA_EMPLEADOS)

 CREATE VIEW VISTA_EMPLEADOS AS
    SELECT (E.APELLIDO||'  '||E.NOMBRE) "NOMBRE", E.SEXO,S.NOMBRE "SECCION" , E.CANTIDADHIJOS
    FROM EMPLEADOS E
    JOIN SECCIONES S
        ON E.SECCION=S.CODIGO;

2. VER LA INFORMACION DE LA VISTA

 SELECT *
 FROM VISTA_EMPLEADOS;
 
3 . CONSULTA sobre el conteo de Empleados por Área/Departamento
  
  SELECT SECCION , COUNT (*) "CANTIDAD"
  FROM VISTA_EMPLEADOS
  GROUP BY SECCION;

4. ELIMINAR LA VISTA "VISTA_EMPLEADOS_INGRESO"

 DROP VIEW VISTA_EMPLEADOS_INGRESO;
 
5. Creamos otra vista de "empleados" denominada "vista_empleados_ingreso" que almacena la cantidad de empleados por año (GROUP BY ):

 CREATE VIEW VISTA_EMPLEADOS_INGRESO (FECHA,CANTIDAD) AS
 SELECT EXTRACT(YEAR FROM FECHAINGRESO), COUNT (*)
 FROM EMPLEADOS
    GROUP BY EXTRACT (YEAR FROM FECHAINGRESO);

2. VER LA INFORMACION DE LA VISTA

 SELECT *
 FROM VISTA_EMPLEADOS_INGRESO;

Hemos aprendido que los registros resultantes de una vista no se almacena en la base de datos, sino la definición de la vista, por lo tanto, al modificar las tablas referenciadas por la vista
, el resultado de la vista cambia.
 
 Modificamos una fecha en la tabla "empleados" y luego consultamos la vista para verificar que está actualizada:
 
 UPDATE EMPLEADOS SET FECHAINGRESO= '10/09/2000' 
    WHERE FECHAINGRESO='10/09/1998';
    
  select *
  from vista_empleados_ingreso;
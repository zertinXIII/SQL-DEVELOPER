------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Trabajamos con la tabla "libros" de una librería.

Eliminamos la tabla y la creamos nuevamente:

 drop table libros;

 create table libros(
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(5,2)
 );
 
Ingresamos algunos registros:

 insert into libros values ('Uno','Richard Bach','Planeta',15);
 insert into libros values ('Ilusiones','Richard Bach','Planeta',12);
 insert into libros values ('El aleph','Borges','Emece',25);
 insert into libros values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
 insert into libros values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros values ('Puente al infinito','Bach Richard','Sudamericana',14);
 insert into libros values ('Antología','J. L. Borges','Paidos',24);
 insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
 insert into libros values ('Cervantes y el quijote','Borges- Casares','Planeta',34);
 
1. Creamos un procedimiento que recibe el nombre de una editorial y luego aumenta en un 10% los precios de los libros de tal editorial:

 CREATE OR REPLACE PROCEDURE PA_LIBROS_AUMENTAR10 (AEDITORIAL IN VARCHAR2)
 AS
    BEGIN
        UPDATE LIBROS SET PRECIO=PRECIO+(PRECIO*0.1)
        WHERE EDITORIAL=AEDITORIAL;
    END;
    /
    
2. Ejecutamos el procedimiento:

 EXECUTE PA_LIBROS_AUMENTAR10 ('Planeta');

3. Verificar que los precios de los libros de la editorial "Planeta" han aumentado un 10%:

 SELECT *
 FROM LIBROS;
 
4. Creamos otro procedimiento que recibe 2 parámetros, el nombre de una editorial y el valor de incremento (que tiene por defecto el valor 10):

 CREATE OR REPLACE PROCEDURE PA_LIBROS_AUMENTAR (AEDITORIAL IN VARCHAR2, APORCENTAJE IN NUMBER DEFAULT 10)
 AS
    BEGIN
        UPDATE LIBROS SET PRECIO=PRECIO+(PRECIO*APORCENTAJE/100)
        WHERE EDITORIAL=AEDITORIAL;
    END;
    /

5. Ejecutamos el procedimiento enviano ambos valores:

 EXECUTE PA_LIBROS_AUMENTAR ('Planeta',30);

6. Verificar que los precios de los libros de la editorial "Planeta" han aumentado un 30%:

 SELECT *
 FROM LIBROS;
 
7. Ejecutamos el procedimiento "pa_libros_aumentar" omitiendo el segundo parámetro porque tiene establecido un valor por defecto:

 EXECUTE PA_LIBROS_AUMENTAR ('Paidos');

8. Consultamos la tabla "libros" para verificar que los precios de los libros de la editorial "Paidos" han sido aumentados en un 10% (valor por defecto):

 SELECT *
 FROM LIBROS;
 
9. Definimos un procedimiento almacenado que ingrese un nuevo libro en la tabla "libros":

 CREATE OR REPLACE PROCEDURE PA_LIBROS_INSERTAR ( ATITULO IN  VARCHAR2 DEFAULT NULL, AAUTOR IN VARCHAR2 DEFAULT 'DESCONOCIDO', 
 AEDITORIAL IN VARCHAR2 DEFAULT 'SIN ESPECIFICAR', APRECIO IN NUMBER DEFAULT 0)
 AS 
    BEGIN
     INSERT INTO LIBROS VALUES (ATITULO,AAUTOR,AEDITORIAL,APRECIO);
    END;
    /
 
10. Llamamos al procedimiento sin enviarle valores para los parámetros:

 EXECUTE PA_LIBROS_INSERTAR;
 
11. Veamos cómo se almacenó el registro:

 SELECT *
 FROM LIBROS;

12. Llamamos al procedimiento enviándole valores solamente para el primer y cuarto parámetros correspondientes al título y precio:

 EXECUTE pa_libros_insertar('Uno',100);
 
 13. Veamos cómo se almacenó el registro:

 SELECT *
 FROM LIBROS;
------------------------------------------------- PROBLEMA 2 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Una librería almacena los datos de sus libros en una tabla denominada "libros" y en otra denominada "ofertas", almacena los códigos y precios de los libros cuyo precio es inferior a $50.

1- Elimine las tablas:

 drop table libros;
 drop table ofertas;
 
2- Cree las tablas con las siguientes estructuras:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6,2)
 );

 create table ofertas(
  codigo number(6),
  precio number(6,2)
 );
 
3- Ingrese algunos registros en "libros":

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 
 
4- Cree un trigger a nivel de fila que se dispare al ingresar un registro en "libros"; si alguno de los libros ingresados tiene un precio menor o igual a $30 debe ingresarlo en "ofertas"

    CREATE OR REPLACE TRIGGER TR_INGRESAR_LIBROS_OFERTAS
        BEFORE INSERT
        ON LIBROS
        FOR EACH ROW
        BEGIN 
            IF (:NEW.PRECIO<=30) THEN
                INSERT 
                    INTO OFERTAS VALUES  (:NEW.CODIGO,:NEW.PRECIO);
            END IF;
        END TR_INGRESAR_LIBROS_OFERTAS;
        /

5- Ingrese un libro en "libros" cuyo precio sea inferior a $30

     insert into libros values(150,'El experto en laberintos','Gaskin','Planeta',28);

6- Verifique que el trigger se disparó consultando "ofertas"

    SELECT *
    FROM OFERTAS;

7- Ingrese un libro en "libros" cuyo precio supere los $30

 insert into libros values(155,'El gato con botas',null,'Planeta',38);

8- Verifique que no se ingresó ningún registro en "ofertas"

    SELECT *
    FROM OFERTAS;

9- Cree un trigger a nivel de fila que se dispare al modificar el precio de un libro. 
Si tal libro existe en "ofertas" y su nuevo precio ahora es superior a $30, debe eliminarse de "ofertas"; 
si tal libro no existe en "ofertas" y su nuevo precio ahora es inferior a $30, debe agregarse a "ofertas"

     CREATE OR REPLACE TRIGGER TR_MODIFICAR_LIBROS_PRECIO
        BEFORE UPDATE OF PRECIO
        ON LIBROS
        FOR EACH ROW
        BEGIN
            IF (:OLD.PRECIO<=30) AND (:NEW.PRECIO>30) THEN
                DELETE  
                    FROM OFERTAS
                        WHERE CODIGO= : OLD.CODIGO;
            END IF;
            
            IF (:OLD.PRECIO>30) AND (:NEW.PRECIO<=30) THEN
                INSERT
                    INTO OFERTAS VALUES (:NEW.CODIGO, :NEW.PRECIO);
            END IF;
        END TR_MODIFICAR_LIBROS_PRECIO;
        /
         
10- Aumente a más de $30 el precio de un libro que se encuentra en "ofertas"

     update libros set precio=50 where codigo=150;
    
11- Verifique que el trigger se disparó consultando "libros" y "ofertas"

    SELECT * 
    FROM LIBROS;
    
    SELECT *
    FROM OFERTAS;

12- Disminuya a menos de $31 el precio de un libro que no se encuentra en "ofertas"

     update libros set precio=30 where codigo=155;

13- Verifique que el trigger se disparó consultando "libros" y "ofertas"

    SELECT * 
    FROM LIBROS;
    
    SELECT *
    FROM OFERTAS;    

14- Aumente el precio de un libro que no se encuentra en "ofertas"

     update libros set precio=precio+2 where codigo=150;

15- Verifique que el trigger se disparó pero no se modificó "ofertas"

    SELECT * 
    FROM LIBROS;
    
    SELECT *
    FROM OFERTAS;  

16- Cree un trigger a nivel de fila que se dispare al borrar un registro en "libros"; si alguno de los libros eliminados está en "ofertas", también debe eliminarse de dicha tabla.

    CREATE OR REPLACE TRIGGER TR_ELIMINAR_LIBROS_OFERTAS
    BEFORE DELETE
    ON LIBROS
    FOR EACH ROW
    BEGIN
        DELETE 
            FROM OFERTAS 
                WHERE CODIGO= :OLD.CODIGO;
    END TR_ELIMINAR_LIBROS_OFERTAS;
    /

17- Elimine un libro en "libros" que esté en "ofertas"

     delete from libros where codigo=155;

18- Verifique que el trigger se disparó consultando "libros" y "ofertas"

    SELECT * 
    FROM LIBROS;
    
    SELECT *
    FROM OFERTAS;

19- Elimine un libro en "libros" que No esté en "ofertas"

     delete from libros where codigo=150;

20- Verifique que el trigger se disparó consultando "libros" y "ofertas"

    SELECT * 
    FROM LIBROS;
    
    SELECT *
    FROM OFERTAS;

21- Cree una tabla llamada "control" que almacene el código, la fecha y el precio de un libro, antes elimínela por si existe

 DROP TABLE CONTROL;
 
 create table control(
  codigo number(6),
  fecha date,
  precio number(6,2)
 );

22- Cree un disparador que se dispare cada vez que se actualice el precio de un libro; 
el trigger debe ingresar en la tabla "control", el código del libro cuyo precio se actualizó, la fecha y el precio anterior.

    CREATE OR REPLACE TRIGGER TR_ACTUALIZAR_PRECIO
        BEFORE UPDATE OF PRECIO
        ON LIBROS
        FOR EACH ROW
    BEGIN
        INSERT INTO CONTROL VALUES (:OLD.CODIGO,SYSDATE,:OLD.PRECIO);
    END TR_ACTUALIZAR_PRECIO;
    /

23- Actualice el precio de un libro

 update libros set precio=40 where codigo=120;

24- Controle que el precio se ha modificado en "libros" y que se agregó un registro en "control"

    SELECT *
    FROM LIBROS 
        WHERE CODIGO=120;

25- Modifique nuevamente el precio del libro cambiado en el punto 24

  update libros set precio=precio+(precio*0.5) where codigo>=120;


26- Controle que el precio se ha modificado en "libros" y que se agregó un nuevo registro en "control"

    SELECT * 
    FROM LIBROS;
    
    SELECT *
    FROM OFERTAS;

27- Modifique el precio de varios libros en una sola sentencia que incluya al modificado anteriormente

28- Controle que el precio se ha modificado en "libros" y que se agregó un nuevo registro en "control"

29- Vea qué informa el diccionario "user_triggers" respecto del trigger anteriormente creado

    SELECT *
    FROM USER_TRIGGERS 
        WHERE TRIGGER_NAME = 'TR_ACTUALIZAR_PRECIO';
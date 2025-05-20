------------------------------------------------- PROBLEMA 1 ---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

Un profesor almacena las notas de sus alumnos en una tabla denominada "notas".

Eliminamos la tabla:

 drop table notas;
 
Creamos la tabla con la siguiente estructura:

 create table notas(
  nombre varchar2(30),
  nota number(4,2)
 );
 
Ingresamos algunos registros:

 insert into notas values('Acosta Ana', 6.7);
 insert into notas values('Bustos Brenda', 9.5);
 insert into notas values('Caseros Carlos', 3.7);
 insert into notas values('Dominguez Daniel', 2);
 insert into notas values('Fuentes Federico', 8);
 insert into notas values('Gonzalez Gaston', 7);
 insert into notas values('Juarez Juana', 4);
 insert into notas values('Lopez Luisa',5.3);
 
 
1.Creamos o reemplazamos la función "f_condicion" que recibe una nota y retorna una cadena de caracteres indicando si aprueba o no:

 CREATE OR REPLACE FUNCTION F_CONDICION (ANOTA NUMBER)
    RETURN VARCHAR2
 IS
    CONDICION VARCHAR2(20);
 BEGIN
    CONDICION :=' ' ;
    IF ANOTA<4 THEN
        CONDICION:='DESAPROBADO';
    ELSE CONDICION := 'APROBADO';
    END IF;
    RETURN CONDICION;    
 END;
 /
 
2. Comprobamos la funcion que hemos creado. 

 SELECT NOMBRE, NOTA , F_CONDICION (NOTA) 
 FROM NOTAS;
    
3. omitimos la cláusula "else" porque sólo indicaremos acciones en caso que el "if" sea verdadero

 CREATE OR REPLACE FUNCTION F_CONDICION
    RETURN VARCHAR2
 IS
    CONDICION VARCHAR2(20)
 BEGIN
    CONDICION := 'APROBADO';
    IF ANOTA<4 THEN
        CONDICION:= 'DESAPROBADO';
    END IF;
    RETURN CONDICION;
 END;
 /
 
 4. Comprobamos la funcion que hemos creado. 

 SELECT NOMBRE, NOTA , F_CONDICION (NOTA) 
 FROM NOTAS;
 
 5. Simplificamos la función anteriormente creada empleando la sintaxis "if...elsif":
 
  CREATE OR REPLACE FUNCTION F_CONDICION (ANOTA NUMBER)
        RETURN VARCHAR2
    IS
        CONDICION VARCHAR2(20);
    BEGIN
        CONDICION:= ' ';
        IF ANOTA<4 THEN
            CONDICION:= 'DESAPROBADO';
        ELSIF ANOTA<8 THEN
            CONDICION:= 'REGULAR';
        ELSE
            CONDICION:= 'PROMOCIONADO';
        END IF;
        RETURN CONDICION;
    END;
    /
 
6. Comprobamos la funcion que hemos creado. 

 SELECT NOMBRE, NOTA , F_CONDICION (NOTA) 
 FROM NOTAS;       
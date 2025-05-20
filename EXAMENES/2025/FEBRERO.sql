---------------------------------------- CONTINUA FEBRERO 2025 ----------------------------------------
-------------------------------------------------------------------------------------------------------

-- Creación de las tablas en Oracle
drop table cliente cascade constraints;
drop table comercial cascade constraints;
drop table pedido cascade constraints;

CREATE TABLE cliente (
  id NUMBER  PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  apellido1 VARCHAR2(100) NOT NULL,
  apellido2 VARCHAR2(100),
  ciudad VARCHAR2(100),
  categoria NUMBER
);

CREATE TABLE comercial (
  id NUMBER PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  apellido1 VARCHAR2(100) NOT NULL,
  apellido2 VARCHAR2(100),
  comision FLOAT
);

CREATE TABLE pedido (
  id NUMBER  PRIMARY KEY,
  total NUMBER NOT NULL,
  fecha DATE,
  id_cliente NUMBER NOT NULL,
  id_comercial NUMBER NOT NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  CONSTRAINT fk_pedido_comercial FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

-- Inserción de datos
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (3, 'Diego', 'Flores', 'Salas', 0.11);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (4, 'Marta', 'Herrera', 'Gil', 0.14);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (5, 'Antonio', 'Carretero', 'Ortega', 0.12);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (6, 'Manuel', 'Domínguez', 'Hernández', 0.13);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (7, 'Antonio', 'Vega', 'Hernández', 0.11);
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES (8, 'Alfredo', 'Ruiz', 'Flores', 0.05);

INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (1, 150.5, TO_DATE('2017-10-05', 'YYYY-MM-DD'), 5, 2);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (2, 270.65, TO_DATE('2016-09-10', 'YYYY-MM-DD'), 1, 5);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (3, 65.26, TO_DATE('2017-10-05', 'YYYY-MM-DD'), 2, 1);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (4, 110.5, TO_DATE('2016-08-17', 'YYYY-MM-DD'), 8, 3);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (5, 948.5, TO_DATE('2017-09-10', 'YYYY-MM-DD'), 5, 2);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (6, 2400.6, TO_DATE('2016-07-27', 'YYYY-MM-DD'), 7, 1);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (7, 5760, TO_DATE('2015-09-10', 'YYYY-MM-DD'), 2, 1);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (8, 1983.43, TO_DATE('2017-10-10', 'YYYY-MM-DD'), 4, 6);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (9, 2480.4, TO_DATE('2016-10-10', 'YYYY-MM-DD'), 8, 3);
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES (10, 250.45, TO_DATE('2015-06-27', 'YYYY-MM-DD'), 8, 2);

1.1. (0,25 pto.) Clientes cuyos nombres no empiezan por 'A', ordenados alfabéticamente

 SELECT C.NOMBRE 
 FROM CLIENTE C
    WHERE NOMBRE NOT LIKE 'A%'
        ORDER BY C.NOMBRE ASC;

1.2. (0,25 pto.) Datos de los dos pedidos de mayor valor

 SELECT P.ID, P.TOTAL, P.FECHA,P.ID_CLIENTE,P.ID_COMERCIAL
 FROM PEDIDO P
    ORDER BY TOTAL DESC
    FETCH FIRST 2 ROWS ONLY;

1.3. ( 0,5 pto) Utilizando Join resuelve. Nombre de los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega

 SELECT DISTINCT C.NOMBRE , C.APELLIDO1,C.APELLIDO2
 FROM CLIENTE C
    JOIN PEDIDO P
        ON C.ID=P.ID_CLIENTE
    JOIN COMERCIAL CO
        ON P.ID_COMERCIAL=CO.ID
        WHERE 
            CO.NOMBRE='Daniel' AND CO.APELLIDO1='Sáez' AND CO.APELLIDO2='Vega';
        

1.4. (0,5 pto) Utilizando Join resuelve. Clientes que realizaron un pedido en 2017 con cantidad entre 300€ y 1000€

 SELECT C.NOMBRE, C.APELLIDO1, C.APELLIDO2
 FROM CLIENTE C
    JOIN PEDIDO P
        ON C.ID=P.ID_CLIENTE
            WHERE 
                EXTRACT (YEAR FROM P.FECHA)=2017 
                    AND P.TOTAL BETWEEN 300 AND 1000;

1.5. ( 0,5 pto) Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado( id y total). 
Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

 SELECT CO.ID "ID",CO.NOMBRE "NOMBRE", CO.APELLIDO1 "APELLIDO1",CO.APELLIDO2 "APELLIDO2",P.ID , P.TOTAL
 FROM COMERCIAL CO
  LEFT JOIN PEDIDO P
     ON CO.ID=P.ID_COMERCIAL
      ORDER BY 
            CO.APELLIDO1 ASC, CO.APELLIDO2 ASC, CO.NOMBRE ASC;
    
1.6. ( 0,5 pto) Devuelve el mismo tipo de listado pero que solamente muestre los clientes que no han realizado ningún pedido.

 SELECT C.ID,C.NOMBRE, C.APELLIDO1, C.APELLIDO2
 FROM CLIENTE C
    LEFT JOIN PEDIDO P
        ON C.ID=P.ID_CLIENTE
            WHERE 
                P.ID IS NULL
    ORDER BY 
       C.APELLIDO1 ASC, C.APELLIDO2 ASC, C.NOMBRE ASC;
                
1.7. (0,75 pto) Visualiza un ranking de los comerciales con su nombre y apellido, número de clientes sin repetir, y total de ventas generadas . 
En el ranking solo figuraran los comerciales que hayas superado 2000€ en su total de ventas.

 SELECT CO.NOMBRE , CO.APELLIDO1, CO.APELLIDO2 , COUNT(DISTINCT (P.ID_CLIENTE))"NUMERO DE CLIENTES", SUM(P.TOTAL) "TOTAL VENTAS GENERADAS"
 FROM COMERCIAL CO
    JOIN PEDIDO P
        ON CO.ID=P.ID_COMERCIAL
    GROUP BY 
        CO.ID,CO.NOMBRE,CO.APELLIDO1,CO.APELLIDO2
    HAVING
        SUM(P.TOTAL)>2000;

1.8. ( 0,25 pto) Devolver un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes.

 SELECT C.ID, C.NOMBRE, C.APELLIDO1, (SELECT MAX(P.TOTAL)
                                        FROM PEDIDO P
                                          WHERE 
                                            P.ID_CLIENTE=C.ID) "MAX.PEDIDO"
 FROM CLIENTE C;

1.9. (0,5 pto) Utilizando subselect. Listado de los clientes que han realizado al menos un pedido en la misma ciudad donde hay otro cliente con categoría superior a 200, 
Se ha de sacar el id, nombre, apellidos, ciudad y categoría.

 SELECT DISTINCT C.ID, C.NOMBRE , C.APELLIDO1,C.APELLIDO2,C.CIUDAD,C.CATEGORIA
 FROM CLIENTE C
    JOIN PEDIDO P
        ON C.ID=P.ID_CLIENTE
    WHERE 
        C.CIUDAD IN
            (SELECT CIUDAD
            FROM CLIENTE C
                WHERE C.CATEGORIA >200)
    ORDER BY 
        C.CIUDAD , C.APELLIDO1,C.APELLIDO2,C.NOMBRE;

1.10 (0,5 pto) Utilizando exists. Listado de comerciales que no han realizado ningún pedido. Visualizar los datos del comercial ; id, nombre, apellidos y la comisión.

 SELECT CO.ID, CO.NOMBRE,CO.APELLIDO1,CO.APELLIDO2, CO.COMISION
 FROM COMERCIAL CO
    WHERE 
        NOT EXISTS
         (SELECT *
         FROM PEDIDO P
            WHERE 
                P.ID_COMERCIAL=CO.ID)
    ORDER BY 
        CO.NOMBRE,CO.APELLIDO1,CO.APELLIDO2;

1.11 ( 0,5 pto) Listado de todos los datos del cliente que realizó el pedido más caro en 2019

 SELECT C.*, P.TOTAL
 FROM CLIENTE C
 LEFT JOIN PEDIDO P
    ON C.ID=P.ID_CLIENTE
 WHERE 
    EXTRACT (YEAR FROM P.FECHA)=2017
        AND P.TOTAL= (SELECT MAX(TOTAL)
                      FROM PEDIDO 
                         WHERE 
                            EXTRACT (YEAR FROM FECHA)=2017);
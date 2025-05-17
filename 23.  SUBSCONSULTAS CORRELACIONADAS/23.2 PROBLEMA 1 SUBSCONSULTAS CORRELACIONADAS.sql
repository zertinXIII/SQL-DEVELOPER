------------------------------------------------- PROBLEMA 1 ----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

Un almacén almacena la información de sus ventas en una tabla llamada "facturas" en la cual guarda el número de factura, la fecha y el nombre del cliente y una tabla denominada "detalles" en la cual 
se almacenan los distintos items correspondientes a cada factura: el nombre del artículo, el precio (unitario) y la cantidad.

Eliminamos las tablas:

 drop table detalles;
 drop table facturas;
 
Las creamos con las siguientes estructuras:

 create table facturas(
  numero number(5) not null,
  fecha date,
  cliente varchar2(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura number(5) not null,
  numeroitem number(3) not null, 
  articulo varchar2(30),
  precio number(5,2),
  cantidad number(4),
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on delete cascade
 );
 
Ingresamos algunos registros:

 insert into facturas values(1200,'15/01/2017','Juan Lopez');
 insert into facturas values(1201,'15/01/2017','Luis Torres');
 insert into facturas values(1202,'15/01/2017','Ana Garcia');
 insert into facturas values(1300,'20/01/2017','Juan Lopez');

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
 
1. Mostrar todas las facturas junto con cuántos productos tienen y cuánto vale cada factura en total 

 SELECT F.* , (SELECT COUNT (D.NUMEROITEM)
                FROM DETALLES D
                    WHERE D.NUMEROFACTURA=F.NUMERO) "CANTIDAD", (SELECT SUM(D.PRECIO*CANTIDAD)
                                                                  FROM DETALLES D
                                                                    WHERE D.NUMEROFACTURA=F.NUMERO) "VALOR FACTURA TOTAL"
 FROM FACTURAS F;
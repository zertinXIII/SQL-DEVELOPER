-------------------------------------------------------------------- COMBINACIONES Y FUNCIONES DE AGRUPAMIENTO ------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------  RESUMEN DE COMANDOS -------------------------------------------------------------------------------------------------------------

Podemos usar "group by" y las funciones de agrupamiento con combinaciones de tablas.

Para ver la cantidad de libros de cada editorial consultando la tabla "libros" y "editoriales", tipeamos:

 select nombre as editorial,   count(*) as cantidad
  from editoriales e
  join libros l
    on codigoeditorial=e.codigo
        group by e.nombre;
        
Las editoriales que no tienen libros no aparecen en la salida porque empleamos un "join".

Empleamos otra función de agrupamiento con "left join". Para conocer el mayor precio de los libros de cada editorial usamos la función "max()", hacemos un "left join" y agrupamos por nombre de la editorial:

 select e.nombre as editorial,  max(precio) as "mayor precio"
  from editoriales e
  left join libros l
     on codigoeditorial=e.codigo
        group by nombre;
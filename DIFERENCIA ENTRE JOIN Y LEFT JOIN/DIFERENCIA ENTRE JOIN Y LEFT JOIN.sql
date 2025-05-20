-----------------------------Cuándo usar JOIN vs LEFT JOIN -----------------------------------
----------------------------------------------------------------------------------------------

La elección entre JOIN (INNER JOIN) y LEFT JOIN depende de qué datos necesitas en tu resultado:

                            JOIN (INNER JOIN)

Usa cuando: Solo quieres registros que tengan coincidencias en ambas tablas

Resultado: Excluye filas donde no hay coincidencia en alguna de las tablas

Ejemplo práctico:

-- Solo comerciales que tienen pedidos
 SELECT c.nombre, p.total
 FROM comercial c
 JOIN pedido p ON c.id = p.id_comercial
 LEFT JOIN (OUTER JOIN)
 
 Usa cuando: Quieres todos los registros de la primera tabla (izquierda), aunque no tengan coincidencias en la segunda

 Resultado: Incluye todas las filas de la primera tabla, con NULLs donde no hay coincidencia

Ejemplo práctico:


-- Todos los comerciales, incluso los sin pedidos
 SELECT c.nombre, p.total
 FROM comercial c
 LEFT JOIN pedido p ON c.id = p.id_comercial
 
Regla práctica:

Usa JOIN cuando solo te interesan las relaciones existentes

Usa LEFT JOIN cuando necesites mantener todos los registros de la tabla principal (izquierda), independientemente de si tienen relaciones

Ejemplos de tus consultas anteriores:

Consulta 1.6 (clientes sin pedidos):

Necesitas LEFT JOIN para incluir todos los clientes

Luego filtrar con WHERE p.id IS NULL para quedarte con los que no tienen pedidos

Consulta 1.7 (ranking comerciales):

Usas JOIN porque solo te interesan comerciales con pedidos

Además el HAVING filtra por total de ventas, lo que implícitamente requiere que tengan pedidos

Consulta de comerciales con sus pedidos:

LEFT JOIN es correcto porque quieres mostrar todos los comerciales, incluso los sin pedidos
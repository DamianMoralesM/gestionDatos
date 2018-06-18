/*1)	Partes Rojas o verdes */
SELECT C.sid, C.pid, P.color 
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND  (P.color IN ("red","green"))

SELECT DISTINCT R.idM
FROM reservas R 
WHERE R.idB = ANY
(SELECT DISTINCT B.idB
FROM reservas R, barcos B
WHERE B.color = "verde" or B.color="rojo")

/*Un mismo proveedor Rojas y verdes */
SELECT C.sid, C.pid, P.color 
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND  P.color = "green" AND (C.sid = any (
SELECT C.sid
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND  P.color = "red" 
))

	SELECT C.sid
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND P.color = "red" and (C.sid IN
(SELECT C.sid
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND P.color = "green"))









	/*Proveedor solo partes rojas */
	SELECT C.sid
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND P.color = "red" AND (C.sid NOT IN
(
SELECT C.sid
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND P.color != "red"
))



División
SELECT S.sid 
FROM suppliersS 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE NOT EXISTS 
(SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid ) )


Todas las partes rojas
SELECT S.sid 
FROM suppliers S 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE NOT EXISTS 
(SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid ) and P.color = "Red")

Todas las partes rojas o tambien todas verdes
SELECT S.sid 
FROM suppliers S 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE (P.color IN( "RED")) and 
NOT EXISTS (
SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid )   )
UNION
SELECT S.sid 
FROM suppliers S 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE (P.color IN( "green")) and 
NOT EXISTS (
SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid )   )


10. Encontrar los idpas de las partes que son proveídas por proveedores llamados Juan García.

SELECT DISTINCT S.sid
FROM catalog C, suppliers S
WHERE S.sname = "Juan García"

12. Encontrar los idpas de las partes proveídas por todos los proveedores a menos de $200








1.Encontrar los nombres de los proveedores que proveen alguna parte roja.
SELECT C.sid, FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND  (P.color=”red”)

2. Encontrar los idps de los proveedores que proveen alguna parte roja o verde.
SELECT C.sid, 
FROM catalog C, parts P   
WHERE ( C.pid= P.pid ) AND  (P.color IN ("red","green"))

3. Encontrar los idps de los proveedores que proveen alguna parte roja o están en Av. 9 de Julio 2222.

4. Encontrar los idps de los proveedores que proveen alguna parte roja y alguna parte verde.
SELECT  DISTINCT S.sid
FROM suppliers S, catalog C , parts P 
WHERE (S.sid = C.sid)  AND (C.pid = P.pid)  AND  (P.color IN("GREEN"))  WHERE ( S.sid

IN
(
SELECT  DISTINCT S.sid
FROM suppliers S, catalog C , parts P 
WHERE (S.sid = C.sid)  AND (C.pid = P.pid)  AND  (P.color IN("RED"))))


5. Encontrar los idps de los proveedores que proveen todas las partes.
SELECT S.sid 
FROM suppliersS 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE NOT EXISTS 
(SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid ) )

6. Encontrar los idps de los proveedores que proveen todas las partes rojas.
SELECT S.sid 
FROM suppliers S 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE NOT EXISTS 
(SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid ) and P.color = "Red")

7. Encontrar los idps de los proveedores que proveen todas las partes rojas o verdes.
SELECT S.sid 
FROM suppliers S 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE (P.color IN( "RED")) and 
NOT EXISTS (
SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid )   )
UNION
SELECT S.sid 
FROM suppliers S 
WHERE NOT EXISTS 
 (SELECT P.pid FROM parts P
WHERE (P.color IN( "green")) and 
NOT EXISTS (
SELECT C.pid 
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid )   )


8. Encontrar los idps de los proveedores que proveen todas las partes rojas o todas las partes verdes.



9. Encontrar pares de idps tales que el proveedor con el primer idp carga más para alguna parte que el proveedor con el segundo idp.


10. Encontrar los idpas de las partes que son proveídas por proveedores llamados Juan García.

SELECT DISTINCT S.sid
FROM catalog C, suppliers S
WHERE S.sname = "Juan García"




11. Encontrar los idpas de las partes más caras proveídas por los proveedores llamados Juan García.


12. Encontrar los idpas de las partes proveídas por todos los proveedores a menos de $200 (si un proveedor no provee la parte o la cobra más de $200, ésta no se selecciona).

SELECT P.pid 
FROM parts P  
WHERE NOT EXISTS 
 (SELECT S.sid FROM suppliers S
WHERE NOT EXISTS 
(SELECT C.sid
FROM catalog C 
WHERE C.pid = P.pid and C.sid = S.sid and C.cost<200) )











































1.	Encuentre los eids de pilotos certificados para algún avión Boeing.

SELECT DISTINCT (C.eid)
FROM certified C
WHERE C.aid IN
(SELECT DISTINCT A.aid
FROM aircraft A
WHERE aname LIKE '%Boeing%')


2. Encuentre los nombres de pilotos certificados para algún avión Boeing.

SELECT DISTINCT (E.ename)
FROM certified C, employees E
WHERE C.aid IN
(SELECT DISTINCT A.aid
FROM aircraft A
WHERE aname LIKE '%Boeing%') AND (E.eid = C.eid)

3. Encuentre los aids de todos los aviones que pueden ser usados para vuelos sin paradas desde Bonn hasta Madras.

SELECT DISTINCT A.aid
FROM aircraft A, flights F
WHERE (F.distance < A.crusingrange) and ( F.origin = "Bonn" ) and (F.destination = "Madras" )


4. Identifique los vuelos que pueden ser piloteados por cada piloto cuyo salario sea mayor a $10.000.


5. Encuentre los nombres de pilotos que pueden operar aviones con un rango mayor a 3.000 km pero que NO esten certificados para los aviones Boeing.


6. Encuentre los eids de empleados que ganan el mayor salario.


7. Encuentre los eids de empleados que ganen el segundo mayor salario.


8. Encuentre los eids de empleados que están certificados para la mayor cantidad de aviones.

SELECT Max(x.cantidadCertificados)
(SELECT COUNT(aid) as cantidadCertificados
  FROM certified
  GROUP BY eid)x

9. Encuentre los eids de los empleados que están certificados para exactamente 3 (tres) aviones.

SELECT C.eid
FROM certified C
HAVING COUNT(eid) = 3

10. Encuentre la cantidad total de dinero pagado en concepto de salario.

SELECT sum(salary)
FROM employees



11. ¿Existe alguna secuencia de vuelos de Buenos Aires a Berlín? Cada vuelo en la secuencia debe partir de la ciudad que es destino del vuelo anterior; el primer vuelo debe partir de Buenos Aires, el último debe llegar a Berlín y no hay restricción en la cantidad de vuelos intermedios. Su consulta debe determinar cuándo existe alguna secuencia de vuelos desde Buenos Aires a Berlín para alguna instancia de la relación Vuelos.
No se puede hacer




2.
a. 
SELECT COUNT(A.nro_informe)
FROM accidente A
WHERE A.fecha = "1989-12-01"

b.
SELECT COUNT( *)
FROM participo P, persona Per 
WHERE Per.nombre = "Santos" AND (Per.id_conductor = P.id_conductor)

c.
INSERT INTO accidente VALUES ("2018-01-09","Resistencia",1)

d.
DELETE FROM  coche C 
WHERE C.matricula = (
SELECT coche.matricula
  FROM coche C1, esdueno D , persona P
  WHERE C1.modelo="Mazda" AND P.nombre="Santos" AND (C1.matricula=D.matricula) AND (P.id_conductor = D.id_conductor)


)

e. 
UPDATE participo P
SET P.importe = 3000
WHERE P.matricula = "222" AND P.nro_informe="333"



3.
SELECT T.nombreEmpleado
FROM trabaja T
WHERE T.nombreEmpresa = "Banco Importante"

a.	 
SELECT E.nombreEmpleado, E.ciudad
FROM trabaja T, empleado E  
WHERE T.nombreEmpresa = "Banco Importante" AND (T.nombreEmpleado = E.nombreEmpleado)
b.	 
SELECT E.nombreEmpleado, E.ciudad, E.calle
FROM trabaja T, empleado E  
WHERE T.nombreEmpresa = "Banco Importante" AND (T.nombreEmpleado = E.nombreEmpleado) AND (T.sueldo > 10000)

f. 
SELECT T.nombreEmpleado
FROM trabaja T
WHERE T.nombreEmpresa != "Banco Importante"

g. 
SELECT DISTINCT T.nombreEmpleado
FROM trabaja T 
WHERE T.sueldo > (
SELECT x.sueldoMicro
  FROM (
    SELECT min(T1.sueldo) as sueldoMicro
    FROM trabaja T1
    WHERE T1.nombreEmpresa ="Microsoft"
  ) as x

)

i.	
SELECT DISTINCT T.nombreEmpleado
FROM trabaja T, empleado E 
WHERE (T.nombreEmpleado = E.nombreEmpleado) AND (T.sueldo > (

  SELECT  avg(T2.sueldo)
  FROM trabaja T2
  WHERE T2.nombreEmpresa = T.nombreEmpresa

))

j. 
SELECT T.nombreEmpresa
FROM trabaja T 
GROUP BY T.nombreEmpresa
HAVING COUNT(T.nombreEmpresa)  = (
  
  SELECT max(x.tot)
  FROM (
  SELECT COUNT(T1.nombreEmpresa) as tot
  FROM trabaja T1
  GROUP BY T1.nombreEmpresa ) as x
  
  
  )


k. 
SELECT MIN(x.SuedosPromedios)
FROM (
  
(SELECT T.nombreEmpresa,  AVG(T.sueldo) as SuedosPromedios
FROM trabaja T
GROUP BY T.nombreEmpresa ) as x


l. 
SELECT  T2.nombreEmpresa
  FROM trabaja T2
  GROUP BY T2.nombreEmpresa
  HAVING avg(T2.sueldo) > 
  
  ( SELECT avg(T2.sueldo) 
    FROM trabaja T2
    WHERE T2.nombreEmpresa = "Banco Importante" 
   )

Extras
Proveedores que proveen todas las partes
SELECT C.id_proveedor
FROM catalogo C
GROUP BY C.id_proveedor
HAVING COUNT( C.id_parte) = (
SELECT COUNT DISTINT(P.id_parte)
FROM partes P 
)
Encontrar los idps de los proveedores que proveen todas las partes rojas.
SELECT C.id_proveedor
FROM catalogo C,  partes P1
WHERE P1.color = 'Rojo' AND (C.id_parte=P1.id_parte)
GROUP BY C.id_proveedor
HAVING COUNT( C.id_parte) = (
SELECT COUNT(P.id_parte)
FROM partes P 
WHERE P.color = 'Rojo' 
)
Encontrar los idps de los proveedores que proveen todas las partes rojas y también verdes.
SELECT C.id_proveedor
FROM catalogo C,  partes P1
WHERE (P1.color = 'Rojo' OR P1.color = 'Verde') AND (C.id_parte=P1.id_parte) 
GROUP BY C.id_proveedor
HAVING COUNT( C.id_parte) = (
SELECT COUNT(P.id_parte)
FROM partes P 
WHERE P.color = 'Rojo' OR P.color = 'Verde'
)










K Resuelto
SELECT temp1.nombreempresa
FROM (
  SELECT T1.nombreEmpresa, AVG (T1.sueldo) AS smedio
   FROM trabaja T1 
   GROUP BY T1.nombreEmpresa) AS temp1
WHERE temp1.smedio > (

SELECT avg(t.sueldo)
  FROM trabaja t 
  WHERE t.nombreEmpresa = "Banco Importante"

--Consultas SQL indicadas por el docente, versión final completa


--Dado un ID de diagnóstico, mostrar la sesión de chat (FechaHora del mensaje, emisor,receptor, contenido)

SELECT c.fechaHora AS Fecha, if(c.emisor='M', 'Medico', 'Paciente') AS Emisor, if(c.emisor='M', 'Paciente', 'Medico' ) as Receptor, c.mensaje AS Mensaje
FROM chat c
INNER JOIN recibe  r ON r.idPaciente = c.docidentidadPaciente 
WHERE (r.idDiagnostico = 161348021)



--Mostrar las 10 enfermedades mas diagnosticadas, mostrar id, nombre y cantidad (con un nombre amigable)
 

SELECT t.idPatologia, p.nombre, COUNT(t.idPatologia) AS Cantidad_De_Patologias
FROM tiene t
INNER JOIN patologia p ON t.idPatologia = p.id
GROUP BY t.idPatologia
ORDER BY count(t.idPatologia) DESC
LIMIT 0,10;


--Mostrar el id, y nombre de los síntomas que nunca fueron seleccionados para diagnostico
 
SELECT s.id, s.nombre
FROM sintoma s
LEFT JOIN tiene t ON s.id = t.idSintoma
WHERE t.idSintoma  IS NULL;



--4) --Mostrar el ID, Nombre y Apellido de los médicos que mas consultas atendieron los últimos 30 días

SELECT  c.docidentidadMedico AS Id, p.nombres AS Nombre, p.apellidos  AS Apellido, count(DISTINCT c.idSesion ) AS Cantidad_De_Consultas
FROM  chat c
INNER JOIN persona p ON p.docidentidad = c.docidentidadMedico 
WHERE c.fechaHora > DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY p.docidentidad
ORDER BY COUNT(c.idSesion ) DESC
LIMIT 10;


--5) Mostrar el ID y Nombre de Enfermedades de los últimos 15 días que hayan sido diagnosticadas, con mas de 3 síntomas

SELECT  p.id AS Id_Patologia, p.nombre AS Nombre_Patologia, COUNT(DISTINCT a.IdSintoma ) AS Cantidad_De_Sintomas
FROM  asociados a
INNER JOIN patologia p ON p.id = a.idPatologia 
INNER JOIN tiene t ON t.idPatologia = a.idPatologia 
INNER JOIN  recibe r ON t.idDiagnostico  = r.idDiagnostico 
WHERE r.fechaHora > DATE_SUB(NOW(), INTERVAL 15 DAY)
GROUP BY p.id
HAVING COUNT(DISTINCT a.idSintoma) >3
ORDER BY COUNT(a.idSintoma) DESC
LIMIT 10;


--6)Mostrar el ID, Nombre y Apellido de los usuarios que hayan tenido mas de 10 consultas los últimos 20 días, con los síntomas "Fiebre" y "Dolor de Cabeza"


SELECT r.idPaciente ID, nombres Nombres, apellidos Apellidos from recibe r 
JOIN paciente p2 ON p2.docidentidad = r.idPaciente 
JOIN persona p3 ON p3.docidentidad = p2.docidentidad
JOIN tiene t2 on t2.idDiagnostico = r.idDiagnostico 
join sintoma s2 on s2.id = t2.idSintoma 
WHERE r.fechaHora BETWEEN NOW() - INTERVAL 20 DAY AND NOW() and s2.nombre in ('Fiebre alta', 'Dolor de Cabeza')
GROUP BY idPaciente 
HAVING count(r.idPaciente ) > 10;


--Opcionales 

--Mostrar el ID y Fecha de inicio de las sesiones de chat con más de 40 mensajes

SELECT c1.idSesion,DATE_FORMAT( c1.fechaHora ,'%d/%m/%Y') AS Fecha, count( DISTINCT c1.mensaje ) AS cantidad
FROM chat c1
INNER JOIN chat c2 ON c1.idSesion = c2.idSesion
GROUP by c1.idSesion,
c1.fechaHora 
HAVING COUNT(DISTINCT c1.mensaje )>40
ORDER by count(c1.idSesion )=1 DESC;


--Mostrar el ID, Nombre y Apellido de los médicos que no hayan atendido ninguna consulta

SELECT  p.docidentidad AS Id, p.nombres AS Nombre, p.apellidos  AS Apellido
FROM  persona p
LEFT JOIN chat c ON p.docidentidad = c.docidentidadMedico
INNER JOIN medico  m ON p.docidentidad = m.docidentidad 
WHERE c.idSesion  IS NULL;


--Mostrar el ID de las enfermedades que no se hayan diagnosticado nunca.


SELECT p.id, p.nombre
FROM patologia p
LEFT JOIN tiene t ON p.id = t.idPatologia 
WHERE t.idPatologia  IS NULL;

--FIN


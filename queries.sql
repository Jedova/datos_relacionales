-- Activar claves foráneas por seguridad
PRAGMA foreign_keys = ON;

-- 1️ Listar todas las consultas con médico, paciente y licencia
SELECT 
    c.id_consulta,
    c.fecha,
    c.hora_atencion,
    c.numero_box,
    m.nombre     AS medico,
    p.nombre     AS paciente,
    COALESCE(l.diagnostico, 'Sin licencia') AS diagnostico
FROM consulta c
JOIN medico   m ON c.rut_medico = m.rut_medico
JOIN paciente p ON c.rut_paciente = p.rut_paciente
LEFT JOIN licencia l ON c.codigo_licencia = l.codigo_licencia
ORDER BY c.fecha, c.hora_atencion;

-- 2️ Consultas por médico (ejemplo: Dr. Juan Pérez)
SELECT 
    c.fecha,
    c.hora_atencion,
    p.nombre AS paciente,
    l.diagnostico
FROM consulta c
JOIN medico m ON c.rut_medico = m.rut_medico
JOIN paciente p ON c.rut_paciente = p.rut_paciente
LEFT JOIN licencia l ON c.codigo_licencia = l.codigo_licencia
WHERE m.nombre = 'Dr. Juan Pérez';

-- 3️ Consultas por paciente (ejemplo: María López)
SELECT 
    c.fecha,
    c.hora_atencion,
    m.nombre AS medico,
    l.diagnostico
FROM consulta c
JOIN paciente p ON c.rut_paciente = p.rut_paciente
JOIN medico m ON c.rut_medico = m.rut_medico
LEFT JOIN licencia l ON c.codigo_licencia = l.codigo_licencia
WHERE p.nombre = 'María López';







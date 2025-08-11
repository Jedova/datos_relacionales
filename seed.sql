PRAGMA foreign_keys = ON;

INSERT INTO especialidad (codigo_especialidad, descripcion)
VALUES 
  ('CARD', 'Cardiología'),
  ('PED', 'Pediatría');

INSERT INTO medico (rut_medico, nombre, direccion, codigo_especialidad)
VALUES
  ('11111111-1', 'Dr. Juan Pérez', 'Av. Siempre Viva 123', 'CARD'),
  ('22222222-2', 'Dra. Ana Soto', 'Calle Salud 456', 'PED');

INSERT INTO paciente (rut_paciente, nombre, direccion)
VALUES
  ('33333333-3', 'María López', 'Calle Falsa 789'),
  ('44444444-4', 'Carlos Díaz', 'Pasaje Esperanza 101');

INSERT INTO licencia (codigo_licencia, diagnostico, fecha_inicio, fecha_termino)
VALUES
  ('LIC-001', 'Reposo por hipertensión', '2025-08-10', '2025-08-20'),
  ('LIC-002', 'Reposo por influenza', '2025-08-15', '2025-08-22');

INSERT INTO consulta (fecha, hora_atencion, numero_box, rut_medico, rut_paciente, codigo_licencia)
VALUES
  ('2025-08-10', '10:30', 2, '11111111-1', '33333333-3', 'LIC-001'),
  ('2025-08-15', '11:00', 3, '22222222-2', '44444444-4', NULL);

-- =========================================================
-- Esquema: Sistema de Consultas Médicas (SQLite)
-- =========================================================
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS licencia;
DROP TABLE IF EXISTS medico;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS especialidad;

CREATE TABLE especialidad (
  codigo_especialidad TEXT PRIMARY KEY,
  descripcion         TEXT NOT NULL
);

CREATE TABLE medico (
  rut_medico          TEXT PRIMARY KEY,
  nombre              TEXT NOT NULL,
  direccion           TEXT,
  codigo_especialidad TEXT NOT NULL,
  FOREIGN KEY (codigo_especialidad)
    REFERENCES especialidad (codigo_especialidad)
    ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE paciente (
  rut_paciente TEXT PRIMARY KEY,
  nombre       TEXT NOT NULL,
  direccion    TEXT
);

CREATE TABLE licencia (
  codigo_licencia TEXT PRIMARY KEY,
  diagnostico     TEXT NOT NULL,
  fecha_inicio    TEXT NOT NULL,  -- usar formato 'YYYY-MM-DD'
  fecha_termino   TEXT NOT NULL,
  CHECK (date(fecha_termino) >= date(fecha_inicio))
);

CREATE TABLE consulta (
  id_consulta     INTEGER PRIMARY KEY AUTOINCREMENT,
  fecha           TEXT NOT NULL,  -- 'YYYY-MM-DD'
  hora_atencion   TEXT NOT NULL,  -- 'HH:MM' (24h)
  numero_box      INTEGER NOT NULL,
  rut_medico      TEXT NOT NULL,
  rut_paciente    TEXT NOT NULL,
  codigo_licencia TEXT UNIQUE,    -- 0..1
  FOREIGN KEY (rut_medico)
    REFERENCES medico (rut_medico)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  FOREIGN KEY (rut_paciente)
    REFERENCES paciente (rut_paciente)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  FOREIGN KEY (codigo_licencia)
    REFERENCES licencia (codigo_licencia)
    ON UPDATE RESTRICT ON DELETE SET NULL
);

CREATE INDEX ix_consulta_medico_fecha ON consulta (rut_medico, fecha);
CREATE INDEX ix_consulta_paciente_fecha ON consulta (rut_paciente, fecha);
CREATE INDEX ix_consulta_box_fecha ON consulta (numero_box, fecha);




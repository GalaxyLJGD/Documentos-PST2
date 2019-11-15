CREATE DATABASE IF NOT EXISTS db_villas COLLATE utf8mb4_spanish_ci; -- define lenguaje usado

-- Maestras
CREATE TABLE IF NOT EXISTS db_villas.Ano_escolar
(
    id_ano TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descrip_ano CHAR(9) NOT NULL UNIQUE,
    status_ano BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Documento
(
    id_doc TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descrip_doc VARCHAR(60) NOT NULL UNIQUE,
    obligat_doc BOOLEAN NOT NULL,
    status_doc BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Enfermedad
(
    id_enf SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_enf VARCHAR(40) NOT NULL UNIQUE,
    status_enf BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Escuela
(
    id_esc SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_esc VARCHAR(100) NOT NULL UNIQUE,
    status_esc BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Estado
(
    id_est TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_est VARCHAR(25) NOT NULL UNIQUE,
    status_est BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Grado
(
    id_gra TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descrip_gra CHAR(4) NOT NULL,
    status_gra BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Persona
(
    id_per CHAR(13) PRIMARY KEY NOT NULL,
    nombre_per VARCHAR(60) NOT NULL,
    apellido_per VARCHAR(60) NOT NULL,
    fecha_nac_per DATE,
    status_per BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Seccion
(
    id_sec TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descrip_sec CHAR NOT NULL,
    status_sec BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Vacuna
(
    id_vac TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_vac VARCHAR(40) NOT NULL UNIQUE,
    status_vac BOOLEAN DEFAULT TRUE
) ENGINE = INNODB;

-- Transacciones
CREATE TABLE IF NOT EXISTS db_villas.Doc_entregado
(
    id_per CHAR(13) NOT NULL,
    id_doc TINYINT UNSIGNED NOT NULL,
    status_doe BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_doc_entregado FOREIGN KEY (id_per) REFERENCES Persona(id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_documento FOREIGN KEY (id_doc) REFERENCES Documento(id_doc) ON UPDATE CASCADE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Enf_padecida
(
    id_per CHAR(13) NOT NULL,
    id_enf SMALLINT UNSIGNED NOT NULL,
    status_enp BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_enf_padecida FOREIGN KEY (id_per) REFERENCES Persona(id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_enfermedad FOREIGN KEY (id_enf) REFERENCES Enfermedad(id_enf) ON UPDATE CASCADE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Referencia
(
    id_per CHAR(13) UNIQUE NOT NULL,
    direc_ref VARCHAR(100) NOT NULL,
    telefono_ref CHAR(16),
    num_inscrito_ref TINYINT UNSIGNED NOT NULL,
    status_ref BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_referencia FOREIGN KEY (id_per) REFERENCES Persona(id_per) ON UPDATE CASCADE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Representante
(
    id_per CHAR(13) UNIQUE NOT NULL,
    instruc_rep CHAR NOT NULL,
    ocupac_rep VARCHAR(30) NOT NULL,
    status_rep BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_representante FOREIGN KEY (id_per) REFERENCES Persona(id_per) ON UPDATE CASCADE
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Usuario
(
    id_per CHAR(13) UNIQUE NOT NULL,
    rol_usu CHAR NOT NULL,
    clave_usu CHAR(60) NOT NULL,
    status_usu BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_usuario FOREIGN KEY (id_per) REFERENCES Persona(id_per) ON UPDATE CASCADE,
    CONSTRAINT CHK_rol CHECK (rol_usu REGEXP '^[ADR]$')
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Vac_recibida
(
    id_per CHAR(13) NOT NULL,
    id_vac TINYINT UNSIGNED NOT NULL,
    status_var BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_vac_recibida FOREIGN KEY (id_per) REFERENCES Persona(id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_vacuna FOREIGN KEY (id_vac) REFERENCES Vacuna(id_vac) ON UPDATE CASCADE
) ENGINE = INNODB;

-- Transacciones de inscripciones
CREATE TABLE IF NOT EXISTS db_villas.Alumno
(
    id_per CHAR(13) UNIQUE NOT NULL,
    lugar_nac_alu VARCHAR(30) NOT NULL,
    id_est TINYINT UNSIGNED NOT NULL,
    sexo_alu CHAR NOT NULL,
    id_esc SMALLINT UNSIGNED NOT NULL,
    vive_alu CHAR NOT NULL,
    madre_alu CHAR(13),
    padre_alu CHAR(13),
    constit_alu TINYINT UNSIGNED NOT NULL,
    ingreso_alu DECIMAL(14,2) UNSIGNED NOT NULL,
    vivienda_alu CHAR NOT NULL,
    tenencia_alu CHAR NOT NULL,
    observ_alu VARCHAR(500) NOT NULL,
    camisa_alu TINYINT UNSIGNED NOT NULL,
    pantalon_alu TINYINT UNSIGNED NOT NULL,
    zapato_alu TINYINT UNSIGNED NOT NULL,
    status_alu BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_id_alumno FOREIGN KEY (id_per) REFERENCES Persona (id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_estado FOREIGN KEY (id_est) REFERENCES Estado (id_est) ON UPDATE CASCADE,
    CONSTRAINT FK_escuela FOREIGN KEY (id_esc) REFERENCES Escuela (id_esc) ON UPDATE CASCADE,
    CONSTRAINT FK_madre FOREIGN KEY (madre_alu) REFERENCES Persona (id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_padre FOREIGN KEY (padre_alu) REFERENCES Persona (id_per) ON UPDATE CASCADE,
    CONSTRAINT CHK_vive CHECK (vive_alu REGEXP '^[A-K]$'),
    CONSTRAINT CHK_vivienda CHECK (vivienda_alu REGEXP '^[ACDOQR]$'),
    CONSTRAINT CHK_tenencia CHECK (tenencia_alu REGEXP '^[AOPR]$'),
    CONSTRAINT CHK_sexo CHECK (sexo_alu REGEXP '^[MF]$')
) ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS db_villas.Inscripcion
(
    id_ins INT UNSIGNED PRIMARY NOT NULL AUTO_INCREMENT,
    id_ano TINYINT UNSIGNED NOT NULL,
    id_gra TINYINT UNSIGNED NOT NULL,
    id_sec TINYINT UNSIGNED NOT NULL,
    fecha_ins DATE NOT NULL,
    nota_ins CHAR,
    escolar_ins BOOLEAN NOT NULL,
    alumno_ins CHAR(13) NOT NULL,
    docente_ins CHAR(13) NOT NULL,
    represen_ins CHAR(13) NOT NULL,
    parent_ins CHAR NOT NULL,
    status_ins BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_ano FOREIGN KEY (id_ano) REFERENCES Ano_escolar (id_ano) ON UPDATE CASCADE,
    CONSTRAINT FK_grado FOREIGN KEY (id_gra) REFERENCES Grado (id_gra) ON UPDATE CASCADE,
    CONSTRAINT FK_seccion FOREIGN KEY (id_sec) REFERENCES Seccion (id_sec) ON UPDATE CASCADE,
    CONSTRAINT FK_alumno FOREIGN KEY (alumno_ins) REFERENCES Persona (id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_docente FOREIGN KEY (docente_ins) REFERENCES Persona (id_per) ON UPDATE CASCADE,
    CONSTRAINT FK_represen FOREIGN KEY (represen_ins) REFERENCES Persona (id_per) ON UPDATE CASCADE,
    CONSTRAINT CHK_nota CHECK (nota_ins IS NULL OR nota_ins REGEXP '^[A-F]$'),
    CONSTRAINT CHK_grado CHECK (id_gra REGEXP '^[BMS]$')
) ENGINE = INNODB;

-- Valores por defecto
INSERT INTO db_villas.Documento(descrip_doc, obligat_doc) VALUES
    ('Fotocopia de la C.I. del representante', FALSE),
    ('Informe descriptivo', TRUE),
    ('Constancia de promoción', FALSE),
    ('Cédula del alumno', FALSE),
    ('Fotocopia de la partida de nacimiento del alumno', FALSE),
    ('Control de vacunas del alumno', FALSE),
    ('Fotos del representante', FALSE),
    ('Otros', FALSE);

INSERT INTO db_villas.Estado(nombre_est) VALUES
    ('Amazonas'), ('Anzoategui'), ('Apure'), ('Aragua'), ('Barinas'),
    ('Bolivar'), ('Carabobo'), ('Cojedes'), ('Delta Amacuro'),
    ('Distrito Capital'), ('Falcón'), ('Guárico'), ('La Guaira'), ('Lara'),
    ('Miranda'), ('Monagas'), ('Mérida'), ('Nueva Esparta'), ('Portuguesa'),
    ('Sucre'), ('Trujillo'), ('Táchira'), ('Yaracuy'), ('Zulia'), ('Extranjero');

INSERT INTO db_villas.Vacuna(nombre_vac) VALUES
    ('Antiraviólica'), ('Antitetánica'), ('BCG'), ('Fiebre amarilla'),
    ('Hepatitis'), ('Meningitis'), ('Polio'), ('Sarampión'), ('Triple'),
    ('Trivalente');

-- Administrador del sistema
INSERT INTO db_villas.Persona(id_per, nombre_per, apellido_per) VALUES
    ('root', 'Administrador', 'del Sistema');
INSERT INTO db_villas.Usuario(id_per, rol_usu, clave_usu) VALUES
    ('root', 'R', 'm0lAresr3Moj4do5');

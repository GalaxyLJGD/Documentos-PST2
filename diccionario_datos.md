# Diccionario de datos

La base de datos se llama "db_villas".

Se debe usar el collation "utf8mb4_spanish_ci".

# Tabla de contenidos

* [Maestras](#Maestras)
  * [Ano_escolar](#Ano_escolar)
  * [Documento](#Documento)
  * [Enfermedad](#Enfermedad)
  * [Escuela](#Escuela)
  * [Estado](#Estado)
  * [Grado](#Grado)
  * [Persona](#Persona)
  * [Seccion](#Seccion)
  * [Vacuna](#Vacuna)
* [Transacciones](#Transacciones)
  * [Doc_entregado](#Doc_entregado)
  * [Enf_padecida](#Enf_padecida)
  * [Referencia](#Referencia)
  * [Representante](#Representante)
  * [Usuario](#Usuario)
  * [Vac_recibida](#Vac_recibida)
* [Transacciones de la inscripción](#Transacciones-de-la-inscripci-c3--b3-n)
  * [Alumno](#Alumno)
  * [Inscripcion](#Inscripcion)

## Maestras

### Ano_escolar

* id_ano: ID del año escolar. PK y único. Tipo: `TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* descrip_ano: los años que comprende el año escolar, ej: 2019-2020. Solo puede contener números latinos y guión, expresión regular: '`^[0-9]{4}-[0-9]{4}$`'. Único. Tipo: `CHAR(9) UNIQUE NOT NULL`

* status_gra: estado del grado: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Documento

* id_doc: ID del tipo de documento. PK. `TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* nombre_doc: nombre del tipo de documento. Solo puede contener letras y espacios, expresión regular: '`^(?! )[\p{L} ]+(?<! )$`'. Único. Tipo: `VARCHAR(60) NOT NULL UNIQUE`

* obligat_doc: si es obligatorio que el documento sea entregado o no. Solo puede tener lo valores TRUE (obligatorio) o FALSE (no obligatorio). Tipo: `BOOLEAN NOT NULL`

* status_doc: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

nom_doc|obligatorio_doc
-------|---------------------------------------------
Fotocopia de la C.I. del representante|FALSE
Informe descriptivo|TRUE
Constancia de promoción|FALSE
Cédula del alumno|FALSE
Fotocopia de la partida de nacimiento del alumno|FALSE
Control de vacunas del alumno|FALSE
Fotos del representante|FALSE
Otros|FALSE

Nota: la constancia de promoción es obligatoria para primero y sexto grado, y se debe agregar una fotocopia de la cédula por cada representante que inscriba al alumno.

### Enfermedad

* id_enf: ID del tipo de enfermedad. PK. Tipo: `SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* nombre_enf: nombre de la enfermedad. Solo se permiten letras, numeros y espacios, expresión regular: '`^(?! )[\p{L}\d ]+(?<! )$`'. Único. Tipo: `VARCHAR(40) NOT NULL UNIQUE`

* status_enf: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Escuela

* id_esc: ID de la escuela de la que proviene el estudiante. PK. Tipo: `SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* nombre_esc: nombre de la escuela de la que proviene el estudiante. Solo puede tener letras y espacios, expresión regular: '`^(?! )[\p{L} ]+(?<! )$`'. Único. Tipo: `VARCHAR(100) NOT NULL UNIQUE`

* status_esc: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Estado

* id_est: ID del estado de nacimiento del alumno. PK. Tipo: `TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* nombre_est: nombre del estado. Solo puede contener letras y espacios, expresión regular: '`^(?! )[\p{L} ]+(?<! )$`'. Único. Tipo: `VARCHAR(25) NOT NULL UNIQUE`

* status_est: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

Esta tabla debe contener por defecto:

nombre_est|
----------------|
Amazonas|
Anzoategui|
Apure|
Aragua|
Barinas|
Bolivar|
Carabobo|
Cojedes|
Delta Amacuro|
Distrito Capital|
Falcón|
Guárico|
La Guaira|
Lara|
Miranda|
Monagas|
Mérida|
Nueva Esparta|
Portuguesa|
Sucre|
Trujillo|
Táchira|
Yaracuy|
Zulia|
Extranjero|

### Grado

* id_gra: ID del grado. PK. Tipo: `TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* descrip_gra: grado del alumno. Solo puede contener números y letras latinas minúsculas, expresión regular: "^[0-9]{1,2}[a-z]{2}$" Tipo: `CHAR(4) NOT NULL`

* status_gra: estado del grado: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Persona

* id_per: ID de la persona, es el número de cédula, Solo puede tener letras latinas mayúsculas y números, expresión regular: '`^[0-9A-Z]+$`'. Tipo: `CHAR(13) PRIMARY KEY NOT NULL`

* apellido_per: apellidos de la persona. Solo puede tener letras y espacio, expresión regular: '`^(?! )[\p{L} ]+(?<! )$`'. Tipo: `VARCHAR(60) NOT NULL`

* nombre_per: nombres de la persona. Solo puede tener letras y espacio, expresión regular: '`^(?! )[\p{L} ]+(?<! )$`'. Tipo: `VARCHAR(60) NOT NULL`

* fecha_nac_per: fecha de nacimiento de la persona. Opcional. `DATE`

* status_per: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Seccion

* id_sec: ID de la sección. PK. Tipo: `TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT`

* descrip_sec: descripción de la sección. Solo puede contener una letras mayúscula, expresión regular: "^[A-Z]$". Único. Tipo: `CHAR NOT NULL`

* status_sec: estado del grado: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Vacuna

* id_vac: ID del tipo de vacuna. PK. Solo puede tener letras mayúsculas, expresión regular: '`^[A-Z]$`'. PK. Tipo: `CHAR PRIMARY KEY NOT NULL AUTO_INCREMENT`

* nombre_vac: nombre de la vacuna. Solo se permiten letras, numeros y espacios, expresión regular: '`^(?! )[\p{L}\d ]+(?<! )$`'. Único. Tipo: `VARCHAR(25) NOT NULL UNIQUE`

* status_vac: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

Esta tabla debe contener por defecto:

nom_vac|
---------------|
Antiraviólica|
Antitetánica|
BCG|
Fiebre amarilla|
Hepatitis|
Meningitis|
Polio|
Sarampión|
Triple|
Trivalente|

### Transacciones

### Doc_entregado

* id_per: ID del alumno. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* id_doc: ID del tipo de documento. FK de Documento. Tipo: `TINYINT UNSIGNED`

* status_esc: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Enf_padecida

* id_per: ID de la persona. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* id_enf: ID del tipo de enfermedad. FK de Enfermedad. Tipo: `SMALLINT UNSIGNED NOT NULL`

* status_enp: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Referencia

* id_per: ID de la persona. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* direc_ref: dirección donde vive la persona. Opcional. Tipo: `VARCHAR(100)`

* telef_ref: número de teléfono de la persona. Solo puede tener números latinos y símbolo "+", expresión regular: '`^(\+[0-9]{3})?[0-9]{12}$`'. Opcional. Tipo: `CHAR(16)`

* status_ref: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Representante

* id_per: ID de la persona. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* instruc_rep: nivel de instrucción. Solo puede contener los valores: Básica (B), Media (M), Superior (S); expresión regular: '`^[BMS]$`' Opcional. Tipo `CHAR NOT NULL`

* ocupac_per: empleo de la persona. Tipo: `VARCHAR(30) NOT NULL`

* status_rep: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

### Usuario

* id_per: cédula de la persona e ID del usuario. Solo puede tener letras latinas minúsculas o números: '`^[0-9a-z]+$`'. FK de Persona y único. Tipo: `CHAR(13) UNIQUE NOT NULL`

* clave_usu: contraseña de usuario hasheado con Bcrypt usando PHP. Tipo: `CHAR(60) NOT NULL`

* rol_usu: rol del usuario, esto determina los permisos que tiene. Solo puede tener los valures 'A' (administración), 'D' (Docente), 'R' (Root), expresión regular: '`^[ADR]$`'. Tipo: `CHAR NOT NULL`

* status_usu: estado de la cuenta de usuario: habilitada (TRUE) o deshabilitada (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

Esta tabla debe contener por defecto:

id_usu|clave_usu|rol_usu
------|---------|-------
root|m0lAresr3Moj4do5|R

### Vac_recibida

* id_per: ID de la persona. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* id_vac: ID del tipo de vacuna. FK de Vacuna. Tipo: `TINYINT UNSIGNED`

* status_var: estado del dato: habilitado (TRUE) o deshabilitado (FALSE). Tipo: `BOOLEAN DEFAULT TRUE`

## Transacciones de la inscripción

### Alumno

* id_per: número de cédula del alumno. FK de Persona y único. Tipo: `CHAR(13) NOT NULL UNIQUE`

* lugar_nac_alu: ciudad en la que nació el alumno. Solo se permiten letras y espacios, expresión regular: '`^(?! )[\p{L} ]+(?<! )$`'. Tipo: `VARCHAR(30) NOT NULL`

* id_est: clave del tipo de estado. FK de Estado. Tipo: `TINYINT UNSIGNED NOT NULL`

* sexo_alu: sexo del alumno. Solo puede tener los valores 'M' y 'F'. Tipo: `CHAR NOT NULL`

* id_esc: ID de la escuela de la que procede el alumno. FK de Escuela. Tipo: `SMALLINT UNSIGNED NOT NULL`

* vive_alu: parentesco de la persona con la que vive. Expresión regualar: '`^[A-K]$`'. Tipo: `CHAR NOT NULL`

  Valores posibles que puede contener:

  Letra|Significado
  -|---------------
  A|Padre
  B|Madre
  C|Tío
  D|Tía
  E|Abuelo
  F|Abuela
  G|Hermano
  H|Hermana
  I|Primo
  J|Prima
  K|Otro

* madre_alu: cédula de la madre. Tipo: `CHAR(13) NOT NULL`

* padre_alu: cédula del padre. Tipo: `CHAR(13) NOT NULL`

* constit_alu: constitución familar del alumno, cantidad de personas en su nucleo familiar. Tipo: `TINYINT UNSIGNED NOT NULL`

* ingreso_alu: ingresos mensuales de la familia del alumno. Tipo: `DECIMAL(14,2) UNSIGNED NOT NULL`

* vivienda_alu: tipo de casa en la que vive el alumno. Expresión regular: '`^[ACDOQR]$`'. Tipo: `CHAR NOT NULL`

  Los valores que puede contener son:

  Letra|Significado
  -|---------------
  C|Casa
  D|Departamento
  Q|Quinta
  R|Rancho
  A|Anexo
  O|Otra

* tenencia_alu: tipo de tenencia de vivienda en la que vive el alumno. Expresión regular: '`^[AOPR]$`' Tipo: `CHAR NOT NULL`

  Los valores que puede contener son:

  Letra|Significado
  -|---------------
  P|Propia
  A|Alquilada
  R|Prestada
  O|Otra

* observ_alu: observaciones del alumno. Puede tener cualquier caracter Unicode excepto caracteres de control, y barras invertidas expresión regular: '`^(?! )(\P{Cc}|\R)+(?<! )$`'. Tipo: `VARCHAR(500) NOT NULL`

* camisa_alu: talla de la camisa del alumno. Tipo: `TINYINT UNSIGNED NOT NULL`

* pantalon_alu: talla del pantalón del alumno. Tipo: `TINYINT UNSIGNED NOT NULL`

* zapatos_alu: talla de los zapatos del alumno. Tipo: `TINYINT UNSIGNED NOT NULL`

* status_alu: estado de los datos del alumno. Tipo: `BOOLEAN DEFAULT TRUE`

### Inscripcion

* id_ins: ID de la planilla de inscripción. PK. Tipo: `INT PRIMARY KEY NOT NULL AUTO_INCREMENT`

* id_ano: ID del año escolar. FK de Ano_escolar. Tipo: `TINYINT UNSIGNED NOT NULL`

* id_gra: ID del grado del alumno. FK de Seccion. Tipo: `TINYINT UNSIGNED NOT NULL`

* id_sec: ID de la sección del alumno. FK de Seccion. Tipo: `TINYINT UNSIGNED NOT NULL`

* fecha_ins: fecha de la inscripción del alumno. Tipo: `DATE NOT NULL`

* nota_ins: nota total con la que pasó el año. Solo puede tener letras mayúsculas, expresión regular: '`^[A-F]$`'. Tipo: `CHAR`

* escolar_ins: escolaridad del alumno: regular (TRUE), repitiente (FALSE). Tipo: `BOOLEAN NOT NULL`.

* alumno_ins: ID del alumno. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* docente_ins: ID del docente que lo inscribió. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* represen_ins: ID del representante que lo inscribió. FK de Persona. Tipo: `CHAR(13) NOT NULL`

* parent_ins: parentesco del alumno con respecto al representante. Expresión regular: '`^[A-K]$`'. Tipo: `CHAR NOT NULL`

  Los valores que puede contener son:

  Letra|Significado
  -----|-----------
  A|Padre
  B|Madre
  C|Tío
  D|Tía
  E|Abuelo
  F|Abuela
  G|Hermano
  H|Hermana
  I|Primo
  J|Prima
  K|Otro

* status_ins: estado de los datos de la inscripción. Tipo: `BOOLEAN DEFAULT TRUE`

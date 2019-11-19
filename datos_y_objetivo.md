**Objetivo**: Desarrollar un componente de software utilizando diferentes
metodología para cubrir las necesidades de la comunidad.

**Título**: Aplicación informática para el control del proceso de inscripción en
la Escuela Bolivariana «Villas del Pilar» Araure, Estado Portuguesa

Margenes 3 cm izquierda, 2 cm el resto
Letras Arial o Times New Roman
interlineado 1,5
letra tamaño 12

---

# Procesos principales

## Ingreso:
* Nuevo ingreso.
* Cambio de escuela.

## Progresión:
* Paso al siguiente grado.
* Repitencia.

## Egreso:
* Promoción (pasó del 6to grado)
* Retiro (se va de la escuela).

# Funcionamiento

* Siges, pasar datos del estudiante a institución del gobierno.
* Los estudiantes de preescolar de «El Simoncito» tienen el cupo asegurado para
  1er grado.
* El representante puede negar el cupo asegurado de «El Simoncito».
* La ficha de inscripción y reinscripción se paga una sola vez.
* La carpeta se le entrega al representante cuando el estudiante es egresado.
* Hay 2 secciones por grado, hay en total 12.
* Hay alrededor de 35 cupos disponibles por sección.
* Se realiza una cuadratura para saber cuantos cupos hay disponibles.
* Se realiza un censo de la población estudiantil aspirante para estudiar en la
  escuela.
* Datos pedidos para el censo:
  * Cupo para X grado.
  * Procedencia (escuela de la que procede).
  * Dirección.
  * Nombre del representante.
  * Nombre del estudiante.
  * Edad del estudiante.
* El censo no asegura que se pueda recibir un cupo.
* Si hay cupos disponibles entonces se entregan en orden de llegada (el primero
  que llega primero recibe). Ej: si hay 3 cupos y 5 aspirantes solo los tres
  primeros en llegar recibirán los cupos.
* Se usan letras «Literales» para calificar las notas de un estudiante.
* Si el estudiante saca E entonces debe repetir el grado.
* Si el estudiante saca E o D entonces debe firmar una acta de compromiso.
* Se requiere cédula a partir de 4to grado.
* Se genera una cédula estudiantil usando datos de la cédula del representante
  en caso de que sean
* Se requieren varios documentos en la inscripción, los cuales son:
  * Fotocopia de la C.I. del representante.
  * Informe descriptivo (boletín con el literal) (obligatorio)
  * Constancia de promoción.
  * Fotocopia de la C.I. del alumno.
  * Fotocopia de la partida de nacimiento del alumno.
  * Control de vacunas.
  * Fotos del alumno.
  * Fotos del representante.
  * Otros que se podrían agregar.
* Se están minimizando la cantidad de documentos pedidos.
* Hay 2 planillas para la inscripción.
* Una copia física de los documentos es necesaria.
* Se visita el lugar donde vive el alumno en caso de que haya pasado mucho
  tiempo sin ir a clases.
* Hay planilla de egreso.
* La cédula estudiantil (ejemplo: V-11212345678 ó V-11-2-12345678) se genera de
  la siguiente manera:
  * Letra de la nacionalidad (Venezolano: V).
  * Últimos dos números del año (2011: 11).
  * N° de alumbramiento (o sea, número del hijo) (segundo hijo: 2).
  * Cédula del representante (cédula del representante: 12345678).

# Requerimientos funcionales

* Gestionar año escolar
* Gestionar estudiantes
* Gestionar sección
* Gestionar grado
* Gestionar docente
* Gestionar nuevo ingreso
* Gestionar regulares
* Gestionar reporte de matrícula inicial
* Gestionar solicitud de egreso

# Requerimientos más detallados (incompletos)

* Inscribir a los estudiantes digitalmente.
* Digitalizar la planilla de inscripción y reinscripción.
* Hacer la probresión de grado automáticamente a los estudiantes si tienen la
  nota aprobatoria.
* Hacer repetir el grado a los estudiantes con la nota reprobatoria.
* Permitir al estudiante reprobar incluso teniendo la nota necesaria. 
* Mostrar cuantos niños han aprobado y reprobado en todas las secciones.
* Tener en cuenta el cronograma de inscripción para permitir la introducción de
  gente durante rango de fechas.
* Poder introducir un nuevo estudiante hasta que se acabe el primer lapso si hay
  cupos disponibles.
* Pedir contraseña del estudiante a partir de 4to grado, pero debe ser flexible.
* Debe pedir número de teléfono del representante obligatoriamente.
* Debe generar una planilla de egreso.
* Debe generar la matrícula inicial. Una tabla de datos con los alumnos de cada
  sección, las columnas que tiene son:
  * N° (Por orden de apellido).
  * Cédula escolar.
  * Apellido.
  * Nombre.
  * Fecha nac.:
    * Día.
    * Mes.
    * Año.
  * Lugar de nac.
  * Sexo.
  * Representante.
  * Cédula.
  * Teléfono.
  * Dirección de habitación.
* Debe permitir imprimir la planilla de ingreso, reingreso, egreso y la
  matrícula inicial.

# Secuencia para la inscripción (provenientes del Simoncito)

1. Escuela realiza cuadratura.
1. Escuela realiza censo.
1. Escuela apertura el periódo de inscripciones.
1. Representante inscribe al alumno
1. Representante trae documentos a consignar.
1. Representante consigna documentos
1. Docente rellena planilla
1. Docente recibe documentos e inscribe al estudiante.
1. Docente guarda documentos.

# Secuencia para la inscripción (provenientes de cualquier otro sitio)

1. Escuela realiza cuadratura.
1. Escuela realiza censo.
1. Representante inscribe alumno en el censo.
1. Escuela da el cupo al estudiante si hay disponibles.
1. Escuela apertura el periódo de inscripciones.
1. Representante inscribe al alumno
1. Representante trae documentos a consignar.
1. Representante consigna documentos
1. Docente rellena planilla
1. Docente recibe documentos e inscribe al estudiante.
1. Docente guarda documentos.

# Secuencia para progresión (paso)

1. Escuela (no se definió quien aún) entrega informe el informe descriptivo al
   profesor.
1. Representante entrega datos pedidos para la ficha de reinscripción.
1. Docente rellena ficha de reingreso y firma la ficha.
1. Representante firma la ficha.
1. Docente guarda los documentos.

# Secuencia para progresión (repitencia)

1. Docente crea el informe descriptivo del estudiante.
1. Representante entrega datos pedidos para la ficha de reinscripción.
1. Docente rellena ficha de reingreso y firma la ficha.
1. Alumno firma una documentos de compromiso.
1. Representante firma la ficha.
1. Docente guarda los documentos.

# Secuencia para el egreso (retiro)

1. Representante solicita egreso del alumno.
1. Secretario pide datos del alumno al profesor que los tiene.
1. Secretario rellena información de la planilla de egreso.
1. Secretario rellena información de la planilla de prosecución.
1. Representante firma planilla ambas planillas.
1. Docente entrega documentos al representante.

# Secuencia para el egreso (graduación)

1. (Confuso y desconocido).
1. Alumno firma libro para el retiro de documentos y entrega del título.
1. Alumno recibe título.

# BBDD

* Tabla de permisos de usuario.

# INY1102 - FUNDAMENTOS CLOUD I

<p align="left" style="text-align:left;">
  <a href="https://www.duoc.cl/">
    <img alt="Github Universe" src="img/logo.png" width="1040"/>
  </a>
</p>


## ANTECEDENTES GENERALES

<p align="justify"> <strong>Fundamentos Cloud I</strong> es una asignatura de especialidad impartida en el primer semestre del itinerario formativo de la carrera de Ingeniería en Infraestructura Tecnológica o Técnico en Infraestructura Tecnológica. Esta asignatura se encuentra dentro de la línea formativa de <em>Fundamentos Cloud Computing</em>, proporcionando las bases esenciales en este campo. </p>

<p align="justify"> El propósito de esta asignatura es que los y las estudiantes desarrollen competencias para aplicar los principios fundamentales de las Tecnologías de la Información, adquiriendo las bases necesarias para introducirse en el mundo de Cloud Computing. La formación se orienta hacia la administración eficiente, segura y escalable de recursos digitales, preparándolos para los desafíos tecnológicos actuales.</p>

#### Objetivo del repositorio

<p align="justify"> Este es un repositorio de recursos de scritps u otros archivos útiles o necesarios para desarrollo la clase.

## URLs de de referencia o utilidad

##### Reference for sql script

- [Create Table SQL](https://www.geeksforgeeks.org/sql-create-table/)
- [Select SQL](https://www.geeksforgeeks.org/sql-select-query/)
- [PostgreSQL Tutorial](https://www.geeksforgeeks.org/postgresql-tutorial)


## ACTIVIDADES

## 3.2 User data
#### ANTECEDENTES GENERALES

El [user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) de ![AWS](https://img.shields.io/badge/-AWS-FF9900?style=flat-square&logo=aws&logoColor=white) es un conjunto de instrucciones que se puede proporcionar al iniciar una instancia de Amazon EC2 para automatizar tareas de configuración. Estas instrucciones pueden ser scripts en shell, comandos de configuración, o scripts en otros lenguajes que se ejecutan al inicio de la instancia. El User Data se usa comúnmente para:

1. **Instalación de software**: Automáticamente instalar paquetes y aplicaciones necesarios.
2. **Configuración del sistema**: Realizar ajustes de configuración en el sistema operativo o en aplicaciones.
3. **Descarga de archivos**: Obtener archivos necesarios desde S3 u otros lugares.
4. **Configuración de servicios**: Iniciar y configurar servicios que deben ejecutarse en la instancia.

El User Data se ejecuta una vez al iniciar la instancia por primera vez. Sin embargo, se puede configurar para que se ejecute en cada arranque reiniciando la instancia. Esta funcionalidad es útil para la gestión de infraestructura como código, asegurando que las instancias se configuren automáticamente de manera consistente.

#### REQUERIMIENTOS PARA ESTA ACTIVIDAD

Usar los scripts indicados por su docente para las [actividades de la clase.](
https://github.com/Fundacion-Instituto-Profesional-Duoc-UC/INY1103/blob/main/user_data_ea_3.2.sh
)

Ejemplos de scripts de [user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) que se pueden utilizar son los ofrecidos por la [documentación de AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html#user-data-shell-scripts).


#### DESARROLLO DE ACTIVIDAD

Para más detalles visite el laboratorio de ejecución indicado por su docente.

## 3.4.2 Base de Datos Relacional en modelo IaaS                   
#### ANTECEDENTES GENERALES

Esta actividad se diseñó para reforzar la noción de aprovechar instancias EC2 como infraestructura como servicio (IaaS) para satisfacer las necesidades de bases de datos relacionales.

Este laboratorio se centra en la implementación de una base de datos relacional en la nube utilizando una instancia de cómputo. Durante el laboratorio, aprender a configurar una base de datos relacional en una instancia de Amazon EC2, conectarse a la base de datos desde un cliente y realizar consultas básicas utilizando el lenguaje SQL (Structured Query Language), incluyendo las operaciones creación, selección, inserción, actualización y eliminación de datos (CRUD) en una base de datos relacional.

Al finalizar este laboratorio, podrá realizar las siguientes tareas:

- Implementar una instancia de Amazon EC2 para alojar la base de datos relacional usando el modelo de Infraestructura como Servicio.
-	Instalar y configurar un sistema de gestión de bases de datos (DBMS).
-	Conectar la base de datos a través de herramientas de gestión remota.
-	Realizar operaciones utilizando lenguaje SQL (Structured Query Language).


#### REQUERIMIENTOS PARA ESTA ACTIVIDAD

Para completar este laboratorio de manera satisfactoria, debe tener conocimientos básicos sobre Amazon EC2 (contenido revisado en la actividad previa 3.2), también se recomienda tener bases de administración básica de servidores Linux y el uso de herramientas de línea de comandos de Linux para la instalación de software.
Se debe utilizar el laboratorio de Sandbox Environment del curso de AWS Academy Cloud Foundations para llevar a cabo las actividades.


#### DESARROLLO DE ACTIVIDAD

Desarrollo de la [actividad](./postgres_engine/postgres_as_iaas.md) se encuentra alojado en este repositorio resolviendo:

- La instalación y configuración de base de datos relacional en modelo de Infraestructura como Servicio.
- Conectarse al motor de PostgreSQL y utilizar lenguaje SQL.

<!-- Pendient </p> -->


## CONTRIBUCIONES

Contribuciones son bienvenidas! Revisa nuestra [Guía de Contribuciones](./docs/CONTRIBUTING.md)

##### Reference for Gitflow

- [Flujo de trabajo de Gitflow](https://www.atlassian.com/es/git/tutorials/comparing-workflows/gitflow-workflow)

<!-- Todos/das son bienvenidos/das a colaborar aquí usando las prácticas del Gitflow. Los cambios a la rama main deben ser siempre a través de la aprobación de Pull Request. </p> -->

## CÓDIGO DE CONDUCTA

👋 Por favor, contribuye con amabilidad. Revisa nuestro [Código de Conducta](./docs/CODE_OF_CONDUCT.md)
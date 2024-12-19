# **Implementación de PostgreSQL como IaaS en AWS**

## **Paso a Paso para Implementar PostgreSQL en EC2**

Este documento detalla los pasos para implementar PostgreSQL como una solución IaaS en una instancia EC2 de AWS.

---

## **Paso 1: Crear la Instancia EC2**

1. Inicia sesión en la consola de AWS.
2. Ve a **Servicios > EC2 > Instancias > Lanzar instancia**.
3. Configura la instancia:
   - **Nombre**: `postgres_engine`.
   - **AMI**: Selecciona **Amazon Linux 2023**.

<img src=".img/launch_ec2.png" alt="launching ec2" width="70%">

   - **Tipo de instancia**: `t2.micro`
   - **Almacenamiento**: Configura al menos 8 GB de almacenamiento.
   - **Configuración de red**:
     - Abre el puerto `22` (para SSH).
     - Abre el puerto `5432` (para PostgreSQL).

4. Genera o selecciona una clave SSH para acceder a la instancia.
5. Lanza la instancia.

---

## **Paso 2: Conectarse a la Instancia EC2**

1. Accede a tu instancia mediante SSH:

   ```bash
   ssh -i "ruta_a_tu_clave.pem" ec2-user@<IP_de_tu_instancia>

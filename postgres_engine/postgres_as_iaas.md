# **Implementación de PostgreSQL como IaaS en AWS**

## **Guía para Implementar PostgreSQL en EC2**

---

## *1. Crear la Instancia EC2*

1. Inicia sesión en la Sandbox de laboratorio otorgado por tu docente.

2. Ve a **Servicios > EC2 > Instancias > Lanzar instancia**.

3. Configura la instancia:
   - **Nombre**: `postgres_engine`.
   - **AMI**: Selecciona **Amazon Linux 2023**.

<img src="img/launch_ec2.png" alt="launching ec2" width="60%">

   - **Tipo de instancia**: `t2.micro`
   - **Key Pair**: Crear una llave o seleccionar existente a la que usted tenga acceso.

<img src="img/instance_type_pair_key.png" alt="launching ec2" width="60%">

   - **Configuración de red**:
     - Tipo de red: Usar red pública ofrecida por el ambiente Sandbox

<img src="img/network_settings.png" alt="launching ec2" width="60%">

   - Abre el puerto `22` (SSH).
   - Abre el puerto `5432` para tu IP pública (PostgreSQL).

<img src="img/ports.png" alt="launching ec2" width="60%">

5. **Almacenamiento**: Configura al menos 8 GB de almacenamiento. (Por defecto)

6. Lanza la instancia.

---

## **Paso 2: Conectarse a la Instancia EC2**

1. Accede a tu instancia mediante SSH:

   ```bash
   ssh -i "ruta_a_tu_clave.pem" ec2-user@<IP_de_tu_instancia>

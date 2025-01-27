# **Configurar Base de Datos Relacional en modelo IaaS**

---
## **Parte I: Instalación base de datos relacional en modelo de Infraestructura como Servicio**

## *Paso 1. Crear la Instancia EC2*

1. Inicia sesión en la Sandbox de laboratorio otorgado por tu docente.

2. Ve a **Servicios > EC2 > Instancias > Lanzar instancia**.

3. Configura la instancia:
   - **Nombre**: `postgres_engine`.
   - **AMI**: Selecciona **Amazon Linux 2023 AMI**.

<img src="img/launch_ec2.png" alt="launching ec2" width="60%">

   - **Tipo de instancia**: `t2.micro`, cumple con el mínimo de RAM solicitado
   - **Key Pair**: Crear una llave o seleccionar existente a la que usted tenga acceso.

<img src="img/instance_type_pair_key.png" alt="launching ec2" width="60%">

   - **Configuración de red**:
     - Tipo de red: Usar VPC por defecto y red pública ofrecida por el ambiente Sandbox. 
     - Asegúrese de que la IP pública quede habilitada para la instancia.

<img src="img/network_settings.png" alt="launching ec2" width="60%">

   - **Para el Security Group**

      - Abre el puerto `22` (SSH).
      - Abre el puerto `5432` para tu IP pública (PostgreSQL).
      - Si lo requiere, también puede abrir también ICMP para pruebas de conetividad.
      - Puede permitir todas las conexiones para cada puerto, sin embargo, siempre tenga en cuenta que **las reglas cuyo origen es 0.0.0.0/0 o ::/0 permiten a todas las direcciones IP acceder a la instancia**. El proveedor recomienda **como buena práctica, configurar reglas de grupo de seguridad para permitir el acceso únicamente desde direcciones IP conocidas**.


<img src="img/ports.png" alt="launching ec2" width="60%">


5. **Almacenamiento EBS**: 

- Configura al menos 12 GiB de almacenamiento EBS. 

<img src="img/storage.png" alt="ebs final result example" width="60%">


- En el ejemplo de instancia ya lanzada se observan el tamaño de volumen solicitado.

<img src="img/ebs.png" alt="ebs final result example" width="60%">

6. Si está conforme con las configuraciones lance la instancia y espere a tenga su estado `En ejecución`.

<img src="img/summary.png" alt="launching ec2" width="60%">

- Instancia en ejecución

<img src="img/ec2_running.png" alt="ec2 running" width="60%">

---


## *Paso 2. Conectarse a la Instancia EC2 e instalar PostgreSQL*


1. Defina junto a su docente, la forma más adecuada para conectar a la instancia de cómputo para instalar y configurar el motor de base de datos. Las opciones a considera serían mediante **SSH** o usando la **Conexión de la instancia EC2 browser-based** o usando el **LabRole** para el Administración de Sesiones.

La forma más adecuada dependerá de si utiliza Sandbox Environment del curso de `AWS Academy Cloud Foundations` o `AWS Academy Learner Lab`. 

- En este caso se usará **Conexión de la instancia EC2 usando cliente browser-based**.

<img src="img/connect_browser-based_client.png" alt="showing how to connect using browser-based client" width="60%">


- Conexión usando cliente browser-based

<img src="img/browser-based_client.png" alt="connected using browser-based client" width="60%">


2. Instalación del motor en la instancia:

- Se actualizan paquetes dentro de la instancia y se instala la versión 16 PostgreSQL.
- Se inicializa el setup de PostgreSQL para crear las estructuras necesarias (directorios y archivos) y que este funcione correctamente.
- Se inicia manualmente el servicio de PostgreSQL y se habilita para que este arranque automáticamente en sistema.
- Se chequea el estado del sevicio para verificar que esté corriendo (running).

```bash
sudo dnf update
sudo dnf upgrade
sudo dnf install postgresql16 postgresql16-server -y
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo systemctl status postgresql
 ```

- Si realiza este punto correctamente debería ver que el servicio esté corriendo (running). 

<img src="img/postgresql_running.png" alt="postgresql is running" width="60%">

Para salir use `Ctrl + C`.

3. Configurar una contraseña:

- Configurar una contraseña al usuario por defecto llamado `postgres`.

```bash
sudo -u postgres psql
```
<img src="img/password_postgres.png" alt="modify password postgres" width="60%">


4. Configurar respaldar y configurar archivo `postgresql.conf`:

- En el archivo `postgresql.conf`, se controla en qué interfaces de red PostgreSQL escuchará conexiones entrantes.
- Respaldar archivo `postgresql.conf`. Para conservar archivo original en caso de algún error o problema.
- Verificar que el archivo original y copia se encuentren en el directorio.
- Configurar archivo `postgresql.conf` usando un editor de texto como `vi` o `vim`.

```bash
sudo cp /var/lib/pgsql/data/postgresql.conf /var/lib/pgsql/data/postgresql.conf.back
sudo ls -l /var/lib/pgsql/data/
sudo vim /var/lib/pgsql/data/postgresql.conf
```
- Configurar en la línea 60 archivo `postgresql.conf` las direcciones de escucha del servicio. 
- Para este caso abriremos todas las conexiones, sin embargo, por seguridad se recomienda que defina una IP específica.
- Por defecto tiene `localhost`, cambiar a `*` abriendo así a todas las direcciones entrantes posibles y guardar los cambios.

<img src="img/listen_addresses.png" alt="listen addresses" width="60%">

5. Configurar respaldar y configurar archivo `pg_hba.conf`:

- En el archivo `pg_hba.conf`, se controla quién puede conectarse y cómo se autentican los clientes a PostgreSQL. Aquí se definen reglas de autenticación basadas en IP, usuario y base de datos.
- Respaldar archivo `pg_hba.conf`. Para conservar archivo original en caso de algún error o problema.
- Verificar que el archivo original y copia se encuentren en el directorio.
- Configurar archivo `pg_hba.conf` usando un editor de texto como `vi` o `vim`.

```bash 
sudo cp /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.back
sudo ls -l /var/lib/pgsql/data/
sudo vim /var/lib/pgsql/data/pg_hba.conf

```
- Al final del archivo `pg_hba.conf` agregar configuración de la autenticación del cliente.

```bash
 # TYPE  DATABASE    USER    ADDRESS             METHOD
#Autenticacion cliente remoto a la BD
host    all         all     0.0.0.0/0         md5
```

<img src="img/client_authentication.png" alt="client authentication method" width="60%">


6. Reinicie el servicio y pruebe conectividad:

- Reiniciar el servicio para que apliquen los cambios realizados en los puntos atenriores.

```bash
sudo systemctl restart postgresql

```

- Desde su entorno local realice pruebas de conectividad hacia el motor.




---

## **Parte II: Conectarse al motor de PostgreSQL**

# Aplicaciones estáticas con S3.

Este laboratorio deberías poder completarlo tanto desde CLoud Shell como con tu equipo local utilizando AWS CLI. A su vez las instrucciones funcionarán correctamente con las instancias creadas con las AMI de Amazon Linux y Ubuntu, eso siempre y cuando cuenten con el rol adecuado.

Los siguientes pasos lo ayudarán a crear un sitio estático albergado en un bucket de S3.

## Preparación

* El nombre del bucket forma parte de la URL asociada a cada objeto, por lo que debe tener un nombre único a nivel global. 

Define un nombre único para albergar tu sitio:

```bash
STATIC_SITE=staticsite$RANDOM
```

* Muestra el nombre que se ha generado para tu bucket:

```bash
echo $STATIC_SITE
```

## Configuración de S3

* Crea el bucket con:

```bash
aws s3 mb s3://$STATIC_SITE
```

* Comprueba que el bucket está disponible en tu cuenta:

```bash
aws s3 ls
```

* Por motivos de seguridad el acceso público de los buckets está bloqueado por defecto.

Para los fines de este laboratorio se eliminará dicho bloqueo, aunque debe tener en claro que no siempre será así y en otras ocasiones se requerirá tenerlas activadas.

Procedemos a borrar el bloqueo de acceso público:


```bash
aws s3api delete-public-access-block --bucket $STATIC_SITE
```

* Además del paso anterior, debe definir la *resource policy* que permitirá que incluso usuarios no autenticados puedan leer de él. Se definirá un archivo con esta política de bucket:

```bash
cat<< EOF > policy.json 
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Public s3 access",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$STATIC_SITE/*"
    }
  ]
}
EOF
```

* Asigna la policy al bucket. A partir de este momento cualquier persona podrá leer su contenido:

```bash
aws s3api put-bucket-policy --bucket $STATIC_SITE --policy file://policy.json
```

* Genera en un archivo json con la configuración del bucket para que se comporte como un servidor web:

```bash
cat<< EOF > statichost.json
{
  "IndexDocument": {
    "Suffix": "index.html"
  },
  "ErrorDocument": {
    "Key": "404.html"
  },
  "RoutingRules": [
    {
      "Redirect": {
        "ReplaceKeyWith": "index.html"
      },
      "Condition": {
        "KeyPrefixEquals": "/"
      }
    }
  ]
}
EOF
```

* Asocia el bucket a dicha configuración:

```
aws s3api put-bucket-website --bucket $STATIC_SITE --website-configuration file://statichost.json
```

## Publicación del sitio estático

* Fija la región de trabajo:

```bash
REGION=us-east-1
```

* Crea tu sitio en la carpeta `web`:

```bash
mkdir web
wget https://raw.githubusercontent.com/Fundacion-Instituto-Profesional-Duoc-UC/INY1102/refs/heads/main/s3/index.html -O web/index.html

wget https://raw.githubusercontent.com/Fundacion-Instituto-Profesional-Duoc-UC/INY1102/refs/heads/main/s3/404.html -O web/404.html
```

* Reemplace el texto por su nombre y su sección `Valentina Paz, Sección 001V` :

```bash
sed -i 's/(Agregue nombre, apellido y sección)/Valentina Paz, Sección 001V/' web/index.html ## reemplazar datos según corresponda
```

* Copia tu los archivos de tu sitio al bucket

```bash
aws s3 cp --cache-control max-age=3600 --recursive web/ s3://$STATIC_SITE
```

* Obtén la dirección pública compatible con navegadores de tu bucket y úsala para acceder a tu sitio desde desde el navegador:

```bash
echo The website url is: http://$STATIC_SITE.s3-website-$REGION.amazonaws.com
```
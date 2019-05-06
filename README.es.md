# PHP, Symfony y MongDB para BitBucket Pipelines
> Configuración de PHP, Symfony y MongoDB para utilizar con Bitbucket pipelines y ejecutar tests en cada commit

![GitHub](https://img.shields.io/github/license/mbelchin/bitbucket-pipelines-php-symfony-mongodb.svg)

[![Twitter](https://img.shields.io/twitter/url/https/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fmbelchin%2Fbitbucket-pipelines-php-symfony-mongodb&hashtags=bitbucket,bitbucket-pipelines,php,symfony,mongodb,docker)

*Lee esta información en otros idiomas: [English](README.md), [Español](README.es.md).*

Configuración de Bitbucket pipiles para ejecutar test PHPUnit en cada commit para un project que utiliza PHP, Symofony y MongoDB.

## Documentación

En este repositorio encontrarás el fichero `bitbucket-pipelines.yml` responsible de descargar la imagen de docker y ejecutar el pipeline de BitBucket.

También encontrarás el fichero `Dockerfile` utilizado para crear la imagen a medida de este proyecto.

En nuestro caso necesitábamos PHP 5.6 y MongoDB 3.2. En la misma imagen encontrarás instalado `composer` para instalar las dependencias de tus proyectos PHP+Symfony y también tendrás PHPUnit 5.6 necesario para ejecutar los tests de PHP 5.6.

### Crea tu propia imagen

Puedes utilizar el fichero `Dockerfile` disponible como imagen base y modificarlo según tus necesidades. Por ejemplo, usar PHP 7:

```
FROM php:7.1.1
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    mongodb \
    mongodb-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
```

### Construye tu propia imagen

Cuando tengas la imagen creada, puedes construirla con este comando:

```
docker build -t <your-docker-account>/php-mongodb .
```

### Ejecuta la imagen localmente

```
docker run -i -t <your-docker-account>/php-mongodb /bin/bash
```

### Sube tu imagen a Docker hub

1. Utiliza tus credenciales para hacer login en Docker Hub.

```
docker login
```

2. Sube tu imagen, ejecutando este comando:

```
docker push <your-docker-account>/php-mongodb
```

## Autor

[Moisés Belchín](https://moisesbm.wordpress.com)  
[@moises_b_m](https://twitter.com/moises_b_m)  
[https://github.com/mbelchin/](https://github.com/mbelchin/)  

Distribuido bajo lincencia MIT. Echa un vistazo a ``LICENSE`` para más información.

## Discusión

Este proyecto ha sido creado para encontrar una manera simple de compartir la configuración de Pipelines de Bitbucket y que pueda ser utilizada en proyectos que usan PHP y Symfony que requieran MongoDB como base de datos para ejecutar los tests PHPUnit.

Si consideras que algunas cosas podrían mejorarse o si conoces alguna otra herramienta más sencilla o con una configuración más fácil, por favor, abre un hilo de debate para que todos nos podamos beneficiar de todas las mejoras que surjan.

## Contribuir

1. Haz un fork 1. (<https://github.com/mbelchin/bitbucket-pipelines-php-symfony-mongodb/fork>)
2. Crea una nueva rama (`git checkout -b feature/fooBar`)
3. Haz un commit de tus cambios (`git commit -am '<type>(scope): add some fooBar'`)
4. Haz push de tu rama (`git push origin feature/fooBar`)
5. Crea un nuevo Pull Request

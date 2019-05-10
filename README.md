# PHP, Symfony and MongoDB for BitBucket Pipelines
> PHP, Symfony and MongoDB configuration for Bitbucket pipelines and run tests on every commit

![GitHub](https://img.shields.io/github/license/mbelchin/bitbucket-pipelines-php-symfony-mongodb.svg)

[![Twitter](https://img.shields.io/twitter/url/https/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fmbelchin%2Fbitbucket-pipelines-php-symfony-mongodb&hashtags=bitbucket,bitbucket-pipelines,php,symfony,mongodb,docker)

*Read this in other languages: [English](README.md), [Español](README.es.md).*

Bitbucket pipeline configuration to run phpunit tests on every commit to a PHP, Symfony project using MongoDB.

## Documentation

In this repository you'll find the file `bitbucket-pipelines.yml` responsible to pull the docker image and run the pipeline.

You'll also find `Dockerfile` the file used to create our custom image.

In our case we need PHP 5.6 and MongoDB 3.2. In the same image you'll find installed composer for installing the dependencies in your PHP+Symfony project and PHPUnit 5.6 to run PHP 5.6 tests.

### Create your own image

You can use the `Dockerfile` available as a base for your custom image and modify it accordingly. For instance, using PHP 7:

```
FROM php:7.1.1
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    mongodb \
    mongodb-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
```

### Build the image

Once you have your image ready, buid it:

```
docker build -t <your-docker-account>/php-mongodb .
```

### Run the image locally

```
docker run -i -t <your-docker-account>/php-mongodb /bin/bash
```

### Push the image to Docker hub

1. Use your credentials to login in Docker Hub.

```
docker login
```

2. Push your new image.

```
docker push <your-docker-account>/php-mongodb
```

_For a detailed explanation, please refer to: [https://moisesbm.wordpress.com/2019/05/08/bitbucket-pipeline-configuration-for-php-mongodb-and-symfony/](https://moisesbm.wordpress.com/2019/05/08/bitbucket-pipeline-configuration-for-php-mongodb-and-symfony/)_

## Author

[Moisés Belchín](https://moisesbm.wordpress.com)  
[@moises_b_m](https://twitter.com/moises_b_m)  
[https://github.com/mbelchin/](https://github.com/mbelchin/)  

Distributed under the MIT license. See ``LICENSE`` for more information.

## Discussion

This project was created to find a simple way to share same BitBucket pipeline configuration to be used in projects using PHP and Symfony which need MongoDB as database to run phpunit tests.

If you consider some things could be improved or you know another simpler, easier configurable tools, please open a discussion thread so all of us could benefit from those improvements.

## Contributing

1. Fork it (<https://github.com/mbelchin/bitbucket-pipelines-php-symfony-mongodb/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am '<type>(scope): add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

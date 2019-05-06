FROM debian:jessie-slim

MAINTAINER Moises Belchin <moisesbelchin@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 \
  && echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    mongodb-org \
    mongodb-org-server \
    ca-certificates \
    php5 \
    php5-mongo \
    php5-mcrypt \
    curl libcurl3 php5-curl \
    wget \
    libssl-dev \
    unzip \
  && apt-get clean autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN wget https://phar.phpunit.de/phpunit-5.6.phar \
  && chmod +x phpunit-5.6.phar \
  && mv phpunit-5.6.phar /usr/local/bin/phpunit

# This Dockerfile doesn't need to have an entrypoint and a command
# as Bitbucket Pipelines will overwrite it with a bash script.
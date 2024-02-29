FROM php:7.4-apache

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd mcrypt

RUN apt-get update

RUN apt-get install git -y

RUN git clone --depth 1 https://github.com/mjau-mjau/x3.git src

RUN mv src/* /var/www/html/

RUN chmod -R 777 /var/www/html/content

RUN chmod -R 777 /var/www/html/config
# COPY src/ /var/www/html/

RUN a2enmod rewrite

EXPOSE 80
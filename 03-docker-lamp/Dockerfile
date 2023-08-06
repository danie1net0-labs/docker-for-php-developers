FROM php:8.2-apache


LABEL maintainer="Daniel Neto"

COPY .docker/php/php.ini /usr/local/etc/php/
COPY .docker/php/opcache.ini /usr/local/etc/php/conf.d
COPY . /app
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && a2enmod rewrite negotiation

USER 1000

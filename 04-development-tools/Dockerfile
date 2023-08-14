FROM php:8.2-apache


LABEL maintainer="Daniel Neto"

COPY .docker/php/php.ini /usr/local/etc/php/
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY . /app

RUN docker-php-ext-install pdo_mysql opcache \
    && pecl install xdebug-3.2.2 \
    && docker-php-ext-enable xdebug \
    && a2enmod rewrite negotiation

COPY .docker/php/xdebug-dev.ini /usr/local/etc/php/conf.d/xdebugdev.ini


RUN cp -R /usr/local/etc/php/conf.d /usr/local/etc/php/conf.d-dev \
    && rm -f /usr/local/etc/php/conf.d/*-dev.ini \
    && rm -f /usr/local/etc/php/conf.d/*xdebug.ini

RUN chown -R www-data:www-data /app

USER 1000

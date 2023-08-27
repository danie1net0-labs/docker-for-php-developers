FROM php:8.2-apache

COPY composer-installer.sh /usr/local/bin/composer-installer
COPY apache/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo_mysql opcache \
    && a2enmod rewrite negotiation

RUN apt-get -yqq update \
    && apt-get -yqq install --no-install-recommends unzip \
    && chmod +x /usr/local/bin/composer-installer \
    && composer-installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer --version \

WORKDIR /var/www/html

ADD app /var/www/html

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

RUN chown -R www-data:www-data /var/www/html

USER 1000

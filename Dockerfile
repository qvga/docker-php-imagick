FROM php:7.2-apache
RUN apt-get update && apt-get install -y --no-install-recommends\
        libmagickwand-dev \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick

RUN a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo pdo_mysql

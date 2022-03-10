FROM php:7.3-fpm-alpine

# install required extension
RUN apk add libxml2-dev

# install mysql pdo driver
RUN docker-php-ext-install pdo_mysql \
    bcmath \
    ctype \
    fileinfo \
    json \
    exif \
    mbstring \
    tokenizer \
    xml

RUN docker-php-ext-enable exif

# composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/bin --filename=composer

# install git
RUN set -eux && \
  apk update && \
  apk add --update --no-cache --virtual=.build-dependencies git

# install npm
RUN apk add npm

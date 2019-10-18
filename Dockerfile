FROM php:7.3-fpm-alpine3.10

RUN apk update && apk upgrade

# BZIP2
RUN apk add --no-cache bzip2-dev
RUN docker-php-ext-install -j$(nproc) bz2

# GD
RUN apk add --no-cache freetype-dev jpeg-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# INTL
RUN apk add --no-cache icu-dev
RUN docker-php-ext-install -j$(nproc) intl

# JSON
RUN docker-php-ext-install -j$(nproc) json

# MySQL
RUN docker-php-ext-install -j$(nproc) mysqli

# Opcache
RUN docker-php-ext-install -j$(nproc) opcache

# XML
RUN apk add --no-cache libxml2-dev
RUN docker-php-ext-install -j$(nproc) xml

# ZIP
RUN apk add --no-cache libzip-dev
RUN docker-php-ext-install -j$(nproc) zip

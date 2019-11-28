FROM php:7.3.12-fpm-stretch

RUN apt update && apt -y upgrade

# BZIP2
RUN apt -y install libbz2-dev
RUN docker-php-ext-install -j$(nproc) bz2

# GD
RUN apt -y install libfreetype6-dev libjpeg-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# INTL
RUN apt -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

# JSON
RUN docker-php-ext-install -j$(nproc) json

# MySQL
RUN docker-php-ext-install -j$(nproc) mysqli

# Opcache
RUN docker-php-ext-install -j$(nproc) opcache

# XML
RUN apt -y install libxml2-dev
RUN docker-php-ext-install -j$(nproc) xml

# ZIP
RUN apt -y install libzip-dev
RUN docker-php-ext-install -j$(nproc) zip

FROM php:7.1-fpm

RUN apt-get update

# BZIP2
RUN apt-get install -y libbz2-dev
RUN docker-php-ext-install -j$(nproc) bz2

# GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# INTL
RUN apt-get install -y libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

# JSON
RUN docker-php-ext-install -j$(nproc) json

# Mcrypt
RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install -j$(nproc) mcrypt

# MySQL
RUN docker-php-ext-install -j$(nproc) mysqli

# Opcache
RUN docker-php-ext-install -j$(nproc) opcache

# XML
RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install -j$(nproc) xml

# ZIP
RUN docker-php-ext-install -j$(nproc) zip

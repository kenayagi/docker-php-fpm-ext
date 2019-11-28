FROM php:5.6.40-fpm-stretch

RUN apt update && apt -y upgrade

# BZIP2
RUN apt -y install libbz2-dev
RUN docker-php-ext-install -j$(nproc) bz2

# GD
RUN apt -y install libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# INTL
RUN apt -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

# JSON
RUN docker-php-ext-install -j$(nproc) json

# Mcrypt
RUN apt -y install libmcrypt-dev
RUN docker-php-ext-install -j$(nproc) mcrypt

# MySQL
RUN docker-php-ext-install -j$(nproc) mysql
RUN docker-php-ext-install -j$(nproc) mysqli
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# Opcache
RUN docker-php-ext-install -j$(nproc) opcache

# XML
RUN apt -y install libxml2-dev
RUN docker-php-ext-install -j$(nproc) xml

# ZIP
RUN docker-php-ext-install -j$(nproc) zip

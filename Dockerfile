FROM php:7.3.16-fpm-stretch

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    libfreetype6-dev \
    libjpeg-dev \
    libicu-dev \
    libmagickwand-dev \
    libpng-dev \
    libbz2-dev \
    libxml2-dev \
    libzip-dev \
    && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

RUN docker-php-ext-install -j$(nproc) \
    bz2 \
    exif \
    gd \
    intl \
    json \
    mysqli \
    pdo_mysql \
    opcache \
    xml \
    zip

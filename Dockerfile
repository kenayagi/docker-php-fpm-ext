FROM php:7.3.26-fpm-stretch

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    libwebp-dev \
    libxml2-dev \
    libzip-dev \
    && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-webp-dir=/usr/include/
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

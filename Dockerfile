FROM php:7.4.14-fpm-buster

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

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
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

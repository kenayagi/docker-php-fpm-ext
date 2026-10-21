FROM php:8.4.27-fpm-trixie

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    git \
    libavif-dev \
    libbz2-dev \
    libffi-dev \
    libfreetype6-dev \
    libgmp-dev \
    libicu-dev \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    libvips-dev \
    libwebp-dev \
    libxml2-dev \
    libzip-dev \
    libzstd-dev \
    unzip \
    && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-avif --with-freetype --with-jpeg --with-webp

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    exif \
    ffi \
    gd \
    gmp \
    intl \
    mysqli \
    opcache \
    pdo_mysql \
    xml \
    zip

RUN --mount=type=bind,from=ghcr.io/php/pie:bin,source=/pie,target=/usr/local/bin/pie \
    export DEBIAN_FRONTEND="noninteractive"; \
    set -eux; \
    pie install --no-cache \
        imagick/imagick \
        kjdev/brotli \
        kjdev/zstd

COPY config/access-format.conf /usr/local/etc/php-fpm.d/access-format.conf

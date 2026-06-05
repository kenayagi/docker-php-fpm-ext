FROM php:8.4.22-fpm-bookworm

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    git \
    libavif-dev \
    libbz2-dev \
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
    && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-avif --with-freetype --with-jpeg --with-webp

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    exif \
    gd \
    gmp \
    intl \
    mysqli \
    pdo_mysql \
    opcache \
    xml \
    zip

RUN printf \n | pecl install vips && docker-php-ext-enable vips
RUN printf \n | pecl install zstd && docker-php-ext-enable zstd

COPY config/access-format.conf /usr/local/etc/php-fpm.d/access-format.conf

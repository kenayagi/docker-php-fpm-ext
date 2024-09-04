FROM php:8.3.11-fpm-bookworm

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
    libwebp-dev \
    libxml2-dev \
    libzip-dev \
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

#RUN cd /usr/local/include/php/ext && \
#    git clone https://github.com/Imagick/imagick && \
#    cd imagick && \
#    git reset --hard 28f27044e435a2b203e32675e942eb8de620ee58 && \
#    docker-php-ext-configure imagick && \
#    docker-php-ext-install -j$(nproc) imagick
#
#RUN docker-php-ext-enable imagick
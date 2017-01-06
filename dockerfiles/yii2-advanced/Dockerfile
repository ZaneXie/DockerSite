FROM php:5-fpm
#RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
#        && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
#        && composer global require "fxp/composer-asset-plugin:1.0.0"

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
        && sed -i '/deb http:\/\/security.debian.org jessie\/updates main/d' /etc/apt/sources.list \
        && apt-get update && apt-get remove -y libcurl3 && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
        libcurl4-openssl-dev \
        libmemcached-dev \
        zlib1g-dev

RUN  docker-php-ext-install -j$(nproc) mcrypt intl mysqli curl pdo_mysql \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        &&  pecl install memcached-2.2.0 apcu-4.0.10\
        && docker-php-ext-enable memcached apcu


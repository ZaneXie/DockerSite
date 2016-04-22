from ubuntu:14.04
ADD ./config/apt.sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get install -y --force-yes language-pack-en-base
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y --force-yes php7.0-fpm php7.0-intl php7.0-mysql php7.0-gd php7.0-curl php7.0-opcache
RUN apt-get install -y --force-yes php7.0-mbstring 
RUN apt-get install -y --force-yes curl
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
RUN sed -i "s,;daemonize = yes,daemonize = no,g" /etc/php/7.0/fpm/php-fpm.conf
RUN sed -i "s,listen = /run/php/php7.0-fpm.sock,listen = [::]:9000,g" /etc/php/7.0/fpm/pool.d/www.conf
RUN mkdir /var/run/php
EXPOSE 9000
CMD ["php-fpm"]

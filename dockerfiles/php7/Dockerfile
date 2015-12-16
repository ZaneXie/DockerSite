from ubuntu:14.04
ADD ./config/apt.sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get install -y --force-yes language-pack-en-base
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y --force-yes php7.0-fpm php7.0-intl php7.0-mysql php7.0-gd php7.0-curl php7.0-opcache
RUN apt-get install -y nginx curl
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer
RUN composer config -g repositories.packagist composer http://packagist.cn
EXPOSE 80
ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]

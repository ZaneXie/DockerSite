FROM ubuntu:14.04
#ADD ./config/apt.sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php5 && apt-get update && \
    apt-get install -y --force-yes php5-fpm php5-mcrypt php5-apcu php5-intl php5-mysql php5-memcache php5-imagick php5-gd php5-curl && \
    apt-get install -y nginx &&\
    apt-get install -y curl
RUN php5enmod mcrypt
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && composer global require "fxp/composer-asset-plugin:1.0.0"
EXPOSE 80
ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]

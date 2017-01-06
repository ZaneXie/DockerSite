from php:7-fpm
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer \
	&& chmod +x /usr/bin/composer \
	&& composer config -g repo.packagist composer https://packagist.phpcomposer.com

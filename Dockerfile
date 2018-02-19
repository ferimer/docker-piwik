FROM php:7.0-apache
MAINTAINER Ferimer <developers@ferimer.es>

COPY piwik/piwik/ /var/www/html/

RUN	chmod -R 0755 /var/www/html/tmp && \
	mkdir /var/www/html/tmp/assets && chmod -R 0755 /var/www/html/tmp/assets/ && \
	mkdir /var/www/html/tmp/cache && chmod -R 0755 /var/www/html/tmp/cache/ && \
	mkdir /var/www/html/tmp/logs && chmod -R 0755 /var/www/html/tmp/logs/ && \
	mkdir /var/www/html/tmp/tcpdf && chmod -R 0755 /var/www/html/tmp/tcpdf/ && \
	mkdir /var/www/html/tmp/templates_c && chmod -R 0755 /var/www/html/tmp/templates_c/ && \
	chown -R www-data:www-data /var/www/html

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
	zip \
	libgeoip-dev \
	php5-geoip geoip-database geoip-database-extra && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd mysqli mbstring zip

RUN pecl install APCu geoip


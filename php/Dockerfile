FROM php:7.2.10-apache-stretch

RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        mysql-client \
        libgmp-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get update
RUN apt-get install -y libxml2-dev libzip-dev zip git jpegoptim optipng optipng pngquant gifsicle
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get update
RUN docker-php-ext-install pdo pdo_mysql mysqli pcntl exif bcmath gmp

RUN apt-get update

RUN docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip

COPY ./php/start.sh /usr/local/bin/start
COPY ./php/cacert.pem /usr/lib/ssl/certs/cacert.pem

ENV TZ=Turkey
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN chmod u+x /usr/local/bin/start

ADD ./php/php.ini /usr/local/etc/php

CMD ["/usr/local/bin/start"]

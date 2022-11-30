FROM php:8.1-fpm-alpine3.16

WORKDIR /var/www/html
COPY src .
RUN chmod -R o+w ./storage/

RUN apk update && apk add oniguruma-dev
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath 

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
USER laravel  
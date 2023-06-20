FROM php:8-fpm-alpine

ARG UID
ARG GID

ENV UID=1000
ENV GID=1000

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

RUN sed -i "s/user www-data/user laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group www-data/group laravel/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R laravel:laravel /var/www/html

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]

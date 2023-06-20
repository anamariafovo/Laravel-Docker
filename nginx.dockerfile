FROM nginx:stable-alpine

ENV UID=laravel
ENV GID=laravel

RUN mkdir -p /var/www/html/public

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${UID}/g" /etc/nginx/nginx.conf

RUN adduser -g ${GID} -s /bin/sh -D ${UID}

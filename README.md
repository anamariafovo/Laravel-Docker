# Laravel-Docker

1. docker-compose build --no-cache
2. docker-compose up -d
3. docker-compose exec php composer install
4. Create .env file and copy contents from .env.example
5. Create app key:
   php artisan key:generate
   php artisan cache:clear
   php artisan config:clear

To get inside of a container: `docker exec -it <CONTAINER_ID> /bin/sh`
To remove containers, images and volumes: `docker system prune -a --volumes`


TODO: stream laravel.log permission issue solved

sudo chmod 777 storage/logs/laravel.log
sudo chmod 777 storage/framework/sessions
sudo chmod 777 storage/framework/views
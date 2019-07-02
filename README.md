# laravel-docker
# docker images for laravel-apache-mysql  | queue | schedule | websocket | firefox | chrome | phpmyadmin

git clone https://github.com/laravel/laravel.git
cd laravel
git clone https://github.com/karpuzkan/laravel-docker.git
cd laravel-docker
./setup.sh
cd ../
sudo chmod 775 laravel-docker
sudo chmod 777 laravel-docker/redis/socket

docker-compose -f laravel-docker/docker-compose.yml up

# then u can ssh in laravel container and run composer install

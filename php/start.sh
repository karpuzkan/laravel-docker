#!/usr/bin/env bash

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

if [ "$env" != "local" ]; then
    echo "Not Local"
    #(cd /var/www/html && php artisan config:cache && php artisan route:cache && php artisan view:cache)
fi

if [ "$role" = "app" ]; then

    exec apache2-foreground

elif [ "$role" = "queue" ]; then

    echo "Running the queue..."
    su - www-data -s /bin/bash -c "php /var/www/app/artisan queue:work --tries=3"

elif [ "$role" = "scheduler" ]; then

    while [ true ]
    do
      su - www-data -s /bin/bash -c "php /var/www/app/artisan schedule:run --verbose --no-interaction &"
      sleep 60
    done
else
    echo "Could not match the container role \"$role\""
    exit 1
fi
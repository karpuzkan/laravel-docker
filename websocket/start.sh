#!/usr/bin/env bash

set -e

su - www-data -s /bin/bash -c "php /var/www/app/artisan websocket:serve"
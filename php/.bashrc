alias lsls="ls -la"
alias art="php artisan"
alias cls="clear"
alias arto='php artisan config:clear && php artisan view:clear && php artisan cache:clear && php artisan route:cache'
alias dusk='php artisan dusk --group=$1'
alias artm='art migrate:refresh --seed --database=system'
alias testing='./vendor/bin/phpunit --testsuite $1 --group=$2'
alias tester='./vendor/bin/phpunit'
alias resettenant='php artisan tenancy:migrate:refresh && php artisan tenancy:db:seed'
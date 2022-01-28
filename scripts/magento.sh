#!/bin/bash
cd /var/www/html/magento-community-aws
composer install --ignore-platform-reqs
php  bin/magento maintenance:enable
php  bin/magento setup:upgrade
php  bin/magento deploy:mode:set production
php  bin/magento cache:clean
php  bin/magento cache:flush
php  bin/magento maintenance:disable
chmod -R 777 var generated pub/static


#!/bin/bash
cd /var/www/html/magento-community-aws
composer install --ignore-platform-reqs > /var/www/html/magento-community-aws/var/log/composer.log
php  bin/magento maintenance:enable
php  bin/magento setup:upgrade > /var/www/html/magento-community-aws/var/log/setupupgrade.log
php  bin/magento deploy:mode:set production > /var/www/html/magento-community-aws/var/log/deployproduction.log
php  bin/magento cache:clean
php  bin/magento cache:flush
php  bin/magento maintenance:disable
chmod -R 777 var generated pub/static

#!/bin/bash
#sudo service nginx restart
#sudo aws s3 sync s3://remotedevtesting/config/ /var/www/html/remote/app/etc/
#sudo cp -rfv /var/www/html/remote/app/etc/composer.json /var/www/html/remote/
#sudo chown -R ubuntu:ubuntu /var/www/html/remote/
cd /var/www/html/ && rm -rf ./vendor
cd /var/www/html/ && composer install
sudo chown -R ubuntu:ubuntu /var/www/html/

php /var/www/html bin/magento maintenance:enable
php /var/www/html bin/magento setup:upgrade
php /var/www/html bin/magento deploy:mode:set production
php /var/www/html bin/magento cache:clean
php /var/www/html bin/magento cache:flush
php /var/www/html bin/magento maintenance:disable


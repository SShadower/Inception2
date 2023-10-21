#!/bin/bash

mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/db1/$w_db_n/1"   wp-config.php
sed -i -r "s/user/$w_db_user/1"  wp-config.php
sed -i -r "s/pwd/$w_db_mdp/1"    wp-config.php

wp core install --url=$DNS/ --title=$w_title --admin_user=$w_admin_user --admin_password=$w_admin_mdp --admin_email=$w_admin_mail --skip-email --allow-root

wp user create $w_user $w_mail --role=author --user_pass=$w_mdp --allow-root

wp theme install astra --activate --allow-root

wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php


/usr/sbin/php-fpm7.3 -F
FROM debian

RUN apt-get update\
	&& apt-get -y install curl php-fpm php-gd php-intl php-mbstring php-imagick

RUN mkdir -p /var/www/html/\
	&& cd /var/www/html/\
	&& curl -O https://wordpress.org/latest.tar.gz\
	&& tar -xvf latest.tar.gz\
	&& rm latest.tar.gz\
	&& chown -R www-data:www-data /var/www/html/wordpress\
	&& cd wordpress\
	&& cp wp-config-sample.php wp-config.php

RUN /etc/init.d/php7.4-fpm start
CMD /usr/sbin/php-fpm7.4 -F
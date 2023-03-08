FROM debian

RUN apt-get update\
	&& apt-get -y install curl php-fpm php-gd php-intl php-mbstring php-imagick php-mysql

COPY conf/www.conf /etc/php/7.4/fpm/pool.d
RUN mkdir /run/php
RUN mkdir -p /var/www/html/\
	&& cd /var/www/html/\
	&& curl -O https://wordpress.org/latest.tar.gz\
	&& tar -xvf latest.tar.gz\
	&& rm latest.tar.gz\
	&& cd wordpress\
	&& cp wp-config-sample.php wp-config.php\
	&& chown -R www-data:www-data /var/www/html/wordpress

RUN service php7.4-fpm start
EXPOSE 9000
CMD /usr/sbin/php-fpm7.4 -F

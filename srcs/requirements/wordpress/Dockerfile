FROM debian:buster

RUN apt-get update\
	&& apt-get -y install curl\ 
						php-fpm\
						php-gd\
						php-intl\
						php-mbstring\
						php-imagick\
						php-mysql\
						mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
	&& chmod +x wp-cli.phar\
	&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/config.sh /root
RUN mkdir /run/php
RUN mkdir -p /var/www/html/wordpress
	# && cd /var/www/html/\
	# && curl -O https://wordpress.org/latest.tar.gz\
	# && tar -xvf latest.tar.gz\
	# && rm latest.tar.gz\
	# && cd wordpress\
	# && cp wp-config-sample.php wp-config.php\
	# && chown -R www-data:www-data /var/www/html/wordpress

EXPOSE 9000
WORKDIR /var/www/html/wordpress
ENTRYPOINT [ "bash", "/root/config.sh" ]
CMD /usr/sbin/php-fpm7.3 -F

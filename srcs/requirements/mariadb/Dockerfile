FROM debian

COPY conf/setup_wordpress.sql /entry-point.d/
COPY conf/startup.sh /entry-point.d/
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN service mariadb start
RUN chmod +x /entry-point.d/startup.sh && chmod +x /entry-point.d/setup_wordpress.sql
ENTRYPOINT [ "/entry-point.d/startup.sh" ]
CMD mysqld --console

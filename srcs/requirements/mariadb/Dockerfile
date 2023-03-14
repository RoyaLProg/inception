FROM debian:buster

COPY conf/startup.sh /entry-point.d/
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN chmod +x /entry-point.d/startup.sh
EXPOSE 3306
RUN service mysql start
ENTRYPOINT [ "/entry-point.d/startup.sh" ]
CMD mysqld --console --bind-address=0.0.0.0

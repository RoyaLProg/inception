FROM debian

RUN apt update && apt upgrade
RUN apt install mariadb mariadb-client
CMD ["mysqld", "--user=root", "--console"]

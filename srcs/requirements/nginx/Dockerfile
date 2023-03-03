FROM debian

RUN apt update && apt upgrade
RUN apt install nginx
CMD ["mysqld", "--user=root", "--console"]

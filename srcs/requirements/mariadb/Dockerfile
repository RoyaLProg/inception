FROM alpine

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client
CMD ["mysqld", "--user=root", "--console"]

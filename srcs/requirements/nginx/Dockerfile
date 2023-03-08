FROM debian

RUN apt-get update && apt-get upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN service nginx start
CMD ["nginx", "-g", "daemon off;"]


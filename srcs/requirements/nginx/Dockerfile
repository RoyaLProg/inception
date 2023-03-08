FROM debian

RUN apt-get update && apt-get upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN mkdir /etc/nginx/ssl
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-out /etc/nginx/ssl/ccambium.pem \
-keyout /etc/nginx/ssl/ccambium.key \
-subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=ccambium/CN=ccambium/"
RUN service nginx start
CMD ["nginx", "-g", "daemon off;"]


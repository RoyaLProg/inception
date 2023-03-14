TARGET=srcs/docker-compose.yml

all: mkdir build create start host

build:
	docker compose -f $(TARGET) build

up:
	docker compose -f $(TARGET) up

start:
	docker compose -f $(TARGET) start

stop:
	docker compose -f $(TARGET) stop

clean:
	docker rm -vf $$(docker ps -aq)

fclean: clean rmdir
	docker rmi -f $$(docker images -aq)

create:
	docker compose -f $(TARGET) create

re: fclean all

host:
	sudo echo "127.0.0.1 ccambium.42.fr" > /etc/hosts

mkdir:
	mkdir -p $$HOME/data/wordpress $$HOME/data/mariadb

rmdir:
	rm -rf $$HOME/data/wordpress $$HOME/data/mariadb

.PHONY: all up re clean stop start fclean build create host mkdir rmdir

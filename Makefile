TARGET=srcs/docker-compose.yml

all: build create start

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

fclean: clean
	docker rmi -f $$(docker images -aq)

create:
	docker compose -f $(TARGET) create

re: fclean all

.PHONY: all up re clean stop start fclean build create

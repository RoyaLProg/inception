TARGET=srcs/docker-compose.yml
build:
	docker compose -f $(TARGET) build

all: build up

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

re: fclean all

.PHONY: all up re clean stop start fclean build

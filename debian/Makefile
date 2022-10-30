name = CONTAINER_NAME

all:
	@printf "Starting containers (docker compose UP) ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
        @printf "Docker-compose BUILD for containers ${name}...\n"
        @docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "SHUTTING DOWN containers  ${name}...\n"
        @docker-compose -f ./srcs/docker-compose.yml down

re:
	@printf "REBUILDING containers  ${name}...\n"
        @docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@printf "REMOVE ALL UNUSED containers, networks, images for ${name}"
	@docker system prune -a

fclean:
	@printf "STOP all containers, PRUNE volumes and networks"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY all build down re clean fclean

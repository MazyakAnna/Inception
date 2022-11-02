name = inception
user = bmaegan

all:
	@printf "${name}: Docker compose up...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "${name}: Docker compose build...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "${name}: stop and tear down all your non external volumes...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
	
start:
	@printf "${name}: Docker compose start...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env start
	
start:
	@printf "${name}: Docker compose stop...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env stop

re:
	@printf "${name}: Rebuilding...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "${name}: Cleaning (docker system prune -a)...\n"
	@docker system prune -a
	@sudo rm -rf /home/${user}/wordpress/*

fclean:
	@printf "${name}: Cleaning everything\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/wordpress/*

.PHONY	: all build down re clean fclean start stop

name = inception

user = bmaegan
basic_services = nginx wordpress mariadb
bonus_services = website phpmyadmin adminer redis ftpserver


all:
	@printf "${name}: Docker compose up...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d ${basic_services}

bonus:
	@printf "${name}: Docker compose build and up with bonus...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

build:
	@printf "${name}: Docker compose build...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build ${basic_services}

down:
	@printf "${name}: stop and tear down all your non external volumes...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	@printf "${name}: Rebuilding...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build ${basic_services}

start:
	@printf "${name}: Docker compose start...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env start ${basic_services}

startbonus:
	@printf "${name}: Docker compose start...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env start

stop:
	@printf "${name}: Docker compose stop...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env stop

clean: down
	@printf "${name}: Cleaning (docker system prune -a)...\n"
	@docker system prune -a
	@sudo rm -rf /home/${user}/wordpress/*

fclean:
	@printf "${name}: Cleaning everything\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
	@if [ $(docker ps -q) ]; then docker stop $$(docker ps -q); else echo "NO CONTAINERS TO STOP"; fi;
	@if [ $(docker ps -qa) ]; then docker rm $$(docker ps -qa); else echo "NO CONTAINERS TO DELETE"; fi;
	@if [ $(docker images -qa) ]; then docker rmi $(docker images -qa); else echo "NO IMAGES TO DELETE"; fi;
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/wordpress/*

.PHONY	: all build down re clean fclean start stop

#!/bin/bash
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker rmi -f $(docker images -qa)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q) 2>/dev/null
sudo rm -rf /home/bmaegan/data/mariadb/* 
sudo rm -rf /home/bmaegan/data/MariaDB/*
sudo rm -rf /home/bmaegan/data/wordpress/*
sudo rm -rf /home/bmaegan/data/mariaDB/*

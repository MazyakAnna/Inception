FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

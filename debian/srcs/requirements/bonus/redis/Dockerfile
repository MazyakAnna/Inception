FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

ARG REDIS_PASSWORD \
    REDIS_HOST


# "привязываем" редис по локальному адресу 
# + увелтчение предела памяти и разрешение "забывать" lru (last-recently-used) ключи
RUN apt-get install -y redis
RUN sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis/redis.conf && \
    sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g"  /etc/redis/redis.conf && \
    sed -i "s|# maxmemory-policy noevicrion|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT [ "redis-server"]
CMD ["--protected-mode", "no"]

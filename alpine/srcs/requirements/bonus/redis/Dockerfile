FROM alpine:3.16

ARG REDIS_PASSWORD \
    REDIS_HOST


# "привязываем" редис по локальному адресу 
# + увелтчение предела памяти и разрешение "забывать" lru (last-recently-used) ключи
# RUN apk update && apk upgrade && \
#     apk add --no-cache redis && \
#     sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis.conf && \
#     sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g"  /etc/redis.conf && \
#     sed -i "s|# maxmemory-policy noevicrion|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
#     # echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

# ENTRYPOINT [ "redis-server" , "/etc/redis.conf"]
CMD ["redis-server" , "--protected-mode", "no"]

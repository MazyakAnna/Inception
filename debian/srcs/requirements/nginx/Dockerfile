FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache nginx
EXPOSE 443
#COPY ./conf/nginx.conf /etc/nginx/http.d/.
#COPY ./tools/cert/* /etc/ssl/
#COPY ./tools/index.html /var/www/.
CMD ["nginx", "-g", "daemon off;"]

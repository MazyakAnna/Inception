FROM alpine:3.16

ARG FTP_PASSWORD \
    FTP_USER

RUN apk update && \
    apk upgrade && \
    apk add --no-cache vsftpd && \
    mkdir -p /var/www/html

RUN adduser -h /var/www/html -s /bin/false -D $FTP_USER && \
    echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd && \
    echo $FTP_USER >> /etc/vsftpd.userlist && \
    adduser $FTP_USER root && \
	chown -R $FTP_USER:$FTP_USER /var/www/html

RUN sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
    echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

WORKDIR /var/www/html

EXPOSE 23

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]

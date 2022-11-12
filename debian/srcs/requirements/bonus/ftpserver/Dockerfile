# https://www.cosmos.esa.int/documents/772136/977578/psa_activeVsPassiveFtp.pdf/5e36a7b8-8732-4e65-ab6b-6cf94a742ea6#:~:text=FTP%20is%20a%20TCP%20based,20%20for%20the%20data%20port
# https://1cloud.ru/help/linux/kak-nastroit-vsftpd-ubuntu-12
FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

ARG FTP_PASSWORD \
    FTP_USER

RUN apt-get install vsftpd -y && \
    mkdir -p /var/www/html

RUN adduser --home /var/www/html --shell /bin/false --disabled-password $FTP_USER && \
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd && \
    echo $FTP_USER >> /etc/vsftpd.userlist && \ 
    adduser $FTP_USER root && \
    chown -R $FTP_USER:$FTP_USER /var/www/html


RUN sed -i "s|listen=NO|listen=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|listen_ipv6=YES|#listen_ipv6=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd.conf 
    # sed -i "s|#anonymous_enable=YES|anonymous_enable=NO|g"  /etc/vsftpd/vsftpd.conf


RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf &&\
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd.conf && \
    echo 'pasv_enable=YES' >> /etc/vsftpd.conf

WORKDIR /var/www/html

EXPOSE 21
#ENTRYPOINT tail -f

ENTRYPOINT [ "/usr/sbin/vsftpd", "/etc/vsftpd.conf" ]

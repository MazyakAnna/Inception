# https://www.cosmos.esa.int/documents/772136/977578/psa_activeVsPassiveFtp.pdf/5e36a7b8-8732-4e65-ab6b-6cf94a742ea6#:~:text=FTP%20is%20a%20TCP%20based,20%20for%20the%20data%20port
# https://1cloud.ru/help/linux/kak-nastroit-vsftpd-ubuntu-12
FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

ARG FTP_PASSWORD \
    FTP_USER

RUN apt-get install -y vsftpd  && \
    mkdir -p /var/www/html/wordpress && \
    mkdir -p /var/run/vsftpd/empty

# RUN adduser --home /var/www/html --disabled-password $FTP_USER && \
#     echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd && \
#     echo $FTP_USER >> /etc/vsftpd.userlist && \ 
#     chown -R $FTP_USER:$FTP_USER /var/www/html


RUN adduser $FTP_USER --disabled-password ;\
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null ;\
	chown -R $FTP_USER:$FTP_USR /var/www/html/wordpress ;\
	echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

# RUN echo "anonymous_enable=NO" > /etc/vsftpd.conf && \
#     echo "local_enable=YES" >> /etc/vsftpd.conf && \
#     echo "write_enable=YES" >> /etc/vsftpd.conf && \
#     echo "dirmessage_enable=YES" >> /etc/vsftpd.conf && \
#     echo "xferlog_enable=YES" >> /etc/vsftpd.conf && \
#     echo "connect_from_port_20=YES" >> /etc/vsftpd.conf && \
#     echo "ftpd_banner=Welcome to FTP server of inception!" >> /etc/vsftpd.conf && \
#     echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
#     echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf && \
#     echo "user_sub_token=$USER" >> /etc/vsftpd.conf && \
#     echo "local_root=/var/www/html/wordpress" >> /etc/vsftpd.conf && \
#     echo "listen=YES" >> /etc/vsftpd.conf && \
#     echo "listen_port=21" >> /etc/vsftpd.conf && \
#     echo "listen_address=0.0.0.0" >> /etc/vsftpd.conf && \
#     echo "seccomp_sandbox=NO" >> /etc/vsftpd.conf && \
#     echo "pasv_enable=YES" >> /etc/vsftpd.conf && \
#     echo "pasv_min_port=21100" >> /etc/vsftpd.conf && \
#     echo "pasv_max_port=21110" >> /etc/vsftpd.conf && \
#     echo "userlist_enable=YES" >> /etc/vsftpd.conf && \
#     echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf && \
#     echo "userlist_deny=NO" >> /etc/vsftpd.conf




    # sed -i "s|#anonymous_enable=YES|anonymous_enable=NO|g"  /etc/vsftpd/vsftpd.conf


RUN sed -i "s|listen=NO|listen=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|listen_ipv6=YES|#listen_ipv6=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd.conf && \
    sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd.conf &&\
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf &&\
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd.conf && \
    echo 'pasv_enable=YES' >> /etc/vsftpd.conf

WORKDIR /var/www/html

EXPOSE 21
ENTRYPOINT [ "/usr/sbin/vsftpd", "/etc/vsftpd.conf" ]

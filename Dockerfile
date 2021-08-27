FROM debian:stable-slim
RUN apt -y update && apt -y upgrade && apt -y install chrony && apt -y clean && apt -y autoremove
COPY chrony.conf /etc/chrony/chrony.conf
RUN chown -R root:root /etc/chrony/chrony.conf
EXPOSE 123/udp 
EXPOSE 123/tcp
ENTRYPOINT ["/usr/sbin/chronyd", "-d", "-x", "-f", "/etc/chrony/chrony.conf"]
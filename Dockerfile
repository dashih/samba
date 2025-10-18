FROM ubuntu:24.04
EXPOSE 445
RUN apt-get update
RUN apt-get install -y samba=2:4.19.5+dfsg-4ubuntu9.4
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
HEALTHCHECK CMD ps -A | grep smbd

FROM ubuntu:22.04
EXPOSE 445
RUN apt-get update
RUN apt-get install -y samba=2:4.15.9+dfsg-0ubuntu0.2
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
HEALTHCHECK CMD ps -A | grep smbd

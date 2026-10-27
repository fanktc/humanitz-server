FROM steamcmd/steamcmd:latest

WORKDIR /server

EXPOSE 7777/udp
EXPOSE 27015/udp

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

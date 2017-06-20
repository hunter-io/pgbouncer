FROM ubuntu:16.04
MAINTAINER Antoine Finkelstein <antoine@hunter.io>

RUN apt-get update && apt-get install -y pgbouncer

ADD entrypoint.sh ./

EXPOSE 6432
ENTRYPOINT ["./entrypoint.sh"]

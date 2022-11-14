FROM ubuntu:22.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y wget libevent-dev libssl-dev build-essential pkg-config

RUN wget https://pgbouncer.github.io/downloads/files/1.17.0/pgbouncer-1.17.0.tar.gz
RUN tar xzvf pgbouncer-1.17.0.tar.gz
RUN cd /pgbouncer-1.17.0 && ./configure --prefix=/usr/local
RUN cd /pgbouncer-1.17.0 && make && make install

RUN adduser --disabled-password --gecos "" postgres
ADD entrypoint.sh ./

RUN mkdir -p /etc/pgbouncer/
RUN mkdir -p /var/run/postgresql/
ADD pgbouncer.ini /etc/pgbouncer/pgbouncer.ini

EXPOSE 6432
ENTRYPOINT ["./entrypoint.sh"]

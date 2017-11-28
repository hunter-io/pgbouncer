FROM ubuntu:xenial
MAINTAINER Antoine Finkelstein <antoine@hunter.io>

RUN apt-get update
RUN apt-get install -y wget libevent-dev libssl-dev
RUN apt-get install -y build-essential

RUN wget https://pgbouncer.github.io/downloads/files/1.7.2/pgbouncer-1.7.2.tar.gz
RUN tar xzvf pgbouncer-1.7.2.tar.gz
RUN cd /pgbouncer-1.7.2 && ./configure --prefix=/usr/local --with-libevent=libevent-prefix
RUN cd /pgbouncer-1.7.2 && make && make install

RUN adduser --disabled-password --gecos "" postgres
ADD entrypoint.sh ./

RUN mkdir -p /etc/pgbouncer/
RUN mkdir -p /var/run/postgresql/
ADD pgbouncer.ini /etc/pgbouncer/pgbouncer.ini

EXPOSE 6432
ENTRYPOINT ["./entrypoint.sh"]

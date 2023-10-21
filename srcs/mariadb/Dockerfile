FROM debian:penultimate

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/


COPY ./mdb_script.sh


CMD ["mdb_script.sh"]
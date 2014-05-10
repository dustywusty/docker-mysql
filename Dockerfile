#
# mysql
#

FROM ubuntu
MAINTAINER dusty@clarkda.com

RUN apt-get update
RUN apt-get -y install mysql-client mysql-server

EXPOSE 3306

ENTRYPOINT ["/usr/bin/mysqld_safe"]
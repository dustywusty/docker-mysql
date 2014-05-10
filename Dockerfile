#
# mysql
#

FROM ubuntu
MAINTAINER dusty@clarkda.com

# Update our repositories
RUN apt-get update

# Install the mysql client & server
RUN apt-get -y install mysql-client mysql-server

# Let's listen on our local interface
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Add our custom startup script, check for existing db, create if needed and add our root user
ADD ./scripts/mysql_startup.sh /opt/mysql_startup.sh

EXPOSE 3306

CMD ["/bin/bash", "/opt/mysql_startup.sh"]
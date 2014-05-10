
mkdir /var/docker/mysql/var/lib/mysql/

d build -t dusty-mysql .

d run -d -p 3306:3306 -v /var/docker/mysql/var/lib/mysql/:/var/lib/mysql dusty-mysql

mysql --host=(d inspect -format='{{.NetworkSettings.IPAddress}}' container-id) -ucharlie -p

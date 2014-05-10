### Install Docker (Linode) Ubuntu 14.04

~~~
apt-get update
apt-get install docker.io
~~~

### Install docker-mysql

#### I personally like a shorter alias

~~~
echo 'alias d=docker.io' >> .profile
source ~/.profile
~~~

#### Add a few directories where our DB can persist

~~~
mkdir -p /var/docker/mysql/var/lib/mysql/
~~~

#### Build our docker image

~~~
d build -t dusty/mysql github.com/clarkda/docker-mysql.git
~~~

#### Start a container, expose port 3306, and attach our persist directories

~~~
d run -d -p 3306:3306 -v /var/docker/mysql/var/lib/mysql/:/var/lib/mysql dusty/mysql
~~~

#### Connect from our host machine

~~~
mysql --host=`d inspect -format='{{.NetworkSettings.IPAddress}}' CONTAINER_ID` -ucharlie -p
~~~
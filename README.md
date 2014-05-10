### i can't be bothered to type docker.io so often

```
echo 'alias d=docker.io' >> .profile
source ~/.profile
```

### let's setup some directories to persist our db

```
mkdir -p /var/docker/mysql/var/lib/mysql/
```

### Build and start our mysql container

```
d build -t dusty/mysql https://github.com/clarkda/docker-mysql.git

d run -d -p 3306:3306 -v /var/docker/mysql/var/lib/mysql/:/var/lib/mysql dusty-mysql
```

mysql --host=(d inspect -format='{{.NetworkSettings.IPAddress}}' CONTAINER-ID) -ucharlie -p

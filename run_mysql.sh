#!/bin/bash

count=`docker ps | grep xiezj-mysql | wc -l`
if [ $count -eq 0 ]; then
	docker run --name xiezj-mysql -v $PWD/files/mysql:/var/lib/mysql --restart=always -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
fi


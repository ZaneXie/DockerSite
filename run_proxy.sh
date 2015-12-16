#!/bin/bash

docker rm -f proxy
docker run --name proxy --restart=always -d -p 443:443 -p 80:80 -v `pwd`/files/certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy

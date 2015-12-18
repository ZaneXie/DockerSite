#!/bin/bash
# start PHP and nginx
service php7.0-fpm start
service nginx start
while true;do
    sleep 10000;
done

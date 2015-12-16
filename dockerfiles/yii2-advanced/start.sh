#!/bin/bash

set -e

function setEnvironmentVariable() {
    if [ -z "$2" ]; then
            echo "Environment variable '$1' not set."
            return
    fi
    echo "env[$1] = \"$2\"" >> /etc/php5/fpm/pool.d/www.conf
}

# Grep all ENV variables
for _curVar in `env | awk -F = '{print $1}'`;do
    # awk has split them by the equals sign
    # Pass the name and value to our function
    setEnvironmentVariable ${_curVar} ${!_curVar}
done

touch /var/log/nginx/access.log \
      /var/log/nginx/error.log

# wait for MySQL server, since the container may be up, but the database server not yet ready
echo "Trying to connect to MySQL server (max. 5 times)..."
while ! curl http://$MYSQL_PORT_3306_TCP_ADDR:$MYSQL_PORT_3306_TCP_PORT/
do
  echo "$(date) - still trying"
  ((c++)) && ((c==5)) && break
  sleep 1
done
echo "$(date) - connected successfully"

# start PHP and nginx
service php5-fpm start
service nginx start
while true;do
    sleep 10000;
done

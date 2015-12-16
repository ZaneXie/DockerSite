#!/bin/bash
DATE=`date +%Y-%m-%d`
tar zcvf backup/$DATE.tar.gz files/mysql

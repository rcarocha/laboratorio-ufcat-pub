#!/bin/sh
#

docker ps
docker stop mysql-server

sleep 2
docker ps

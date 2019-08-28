#!/bin/bash
VERSION=1.0
NAME="rundeck-slave"

#docker build -t $NAME .
docker build -t $NAME:$VERSION .
docker tag $NAME:$VERSION $NAME:latest

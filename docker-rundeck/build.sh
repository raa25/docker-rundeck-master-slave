#!/bin/bash
VERSION=3.1.0
NAME="rundeck"

#docker build -t $NAME .
docker build -t $NAME:$VERSION .
docker tag $NAME:$VERSION $NAME:latest

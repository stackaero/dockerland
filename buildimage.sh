#!/bin/bash

IMAGE_FOLDER=$1

cd $IMAGE_FOLDER

NAME=${IMAGE_FOLDER}
PUSH=${2:-false}
IMAGE=docheio/$NAME
REGISTRY=registry.doche.io

echo Building image : $IMAGE 
docker build -t $IMAGE .

if [[ $PUSH == *true* ]]
then
  docker login -u t -p ts -e admin@doche.io https://${REGISTRY}

  docker tag $IMAGE  ${REGISTRY}/${IMAGE}

  docker push ${REGISTRY}/${IMAGE}
fi




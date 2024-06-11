#!/bin/bash

IMAGE_NAME="psql_trainer_i"
CONTAINER_NAME="psql_trainer-c"

echo "Сборка Docker-образа: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Ошибка сборки Docker-образа"
    exit 1
fi

echo "Запуск Docker-контейнера: $CONTAINER_NAME"
docker run -d --name $CONTAINER_NAME -p 5432:5432 $IMAGE_NAME

if [ $? -ne 0 ]; then
    echo "Ошибка запуска Docker-контейнера"
    exit 1
fi

echo "Docker-контейнер $CONTAINER_NAME успешно запущен"


docker exec -it psql_trainer-c chmod 744 /import.sh
docker exec -it psql_trainer-cbash /import.sh
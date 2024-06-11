#!/bin/bash

IMAGE_NAME="psql_trainer_i"
CONTAINER_NAME="psql_trainer-c"

PGHOST=127.0.0.1
PGPORT=5432
PGUSER=trainee
PGPASSWORD=postgres
PGDATABASE=trainer

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


echo "Waiting for PostgreSQL to start..."
until pg_isready -h $PGHOST -p $PGPORT -U $PGUSER; do
  >&2 echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done
echo "PostgreSQL is available"

echo "Docker-контейнер $CONTAINER_NAME успешно запущен"

docker exec -it psql_trainer-c chmod 744 /home/import.sh
docker exec -it psql_trainer-c bash /home/import.sh